
-- Integração de instalações elétricas com 4 fios.
-- Cliente Trifásico (3 Fases e 4 Fios)
   CREATE EVENT integra_consumo_4fios
   ON SCHEDULE EVERY 1 MINUTE
   COMMENT 'Integraliza o consumo do cliente com 3 fios por minuto'
   DO insert into CALC_CONSUMO (ID_CLIENTE, CONSUMO, CUSTO_TARIFA_NORMAL, CUSTO_TARIFA_BRANCA, DATA_CONSUMO) 	
      select 	        
             cc.id as ID_CLIENTE,	        
 		     (sum(l.leitura_a + l.leitura_b + l.leitura_c)/count(l.leitura_a))                           			 as CONSUMO, 	       
             (sum(l.leitura_a + l.leitura_b + l.leitura_c)/count(l.leitura_a))*avg(tc.preco_kwh)       			     as CUSTO_TARIFA_NORMAL,
             if(f.dia_util='T',(sum(l.leitura_a + l.leitura_b + l.leitura_c)/count(l.leitura_a))*avg(tb.preco_kwh)	        
      						  ,(sum(l.leitura_a + l.leitura_b + l.leitura_c)/count(l.leitura_a))*avg(tbf.preco_kwh)) as CUSTO_TARIFA_BRANCA,
 	         max(l.hora_web)                                                             			                 as DATA_CONSUMO	             
      from leituras l 	        
 		left join cadastro_cliente cc on cc.id =l.id_cliente				
      left join tarifas tb  on  tb.inicio_periodo < time(l.hora_consumo)           
                            and tb.fim_periodo    > time(l.hora_consumo)           
                            and tb.id_tarifa = 2           
      left join feriados f  on  f.data = date(l.hora_web)			
      left join tarifas tbf on  tbf.id = 5			
      left join tarifas tc  on  tc.id_tarifa = 1           
      where l.hora_web > date_sub(now(),interval 1 minute) and cc.tipo_rede = 4 group by cc.id;