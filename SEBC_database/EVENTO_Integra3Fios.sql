
-- Integração de instalações elétricas com 3 fios por minuto
-- Cliente Bifásico (2 Fases e 3 Fios) e Trifásico (3 Fases e 3 Fios)
   CREATE EVENT integra_consumo_3fios
   ON SCHEDULE EVERY 1 MINUTE
   COMMENT 'Integraliza o consumo do cliente com 3 fios por minuto'
   DO insert into CALC_CONSUMO (ID_CLIENTE, CONSUMO, CUSTO_TARIFA_NORMAL, CUSTO_TARIFA_BRANCA, DATA_CONSUMO) 	
      select 	        
             cc.id as ID_CLIENTE,	        
 		     (sum(l.leitura_a + l.leitura_b)/count(l.leitura_a))/60                         			    as CONSUMO, 	       
             ((sum(l.leitura_a + l.leitura_b)/count(l.leitura_a))/60)*avg(tc.preco_kwh)       			    as CUSTO_TARIFA_NORMAL,
             if(f.dia_util='T',((sum(l.leitura_a + l.leitura_b)/count(l.leitura_a))/60)*avg(tb.preco_kwh)	        
      						  ,((sum(l.leitura_a + l.leitura_b)/count(l.leitura_a))/60)*avg(tbf.preco_kwh)) as CUSTO_TARIFA_BRANCA,
 	         max(l.hora_web)                                                             			        as DATA_CONSUMO	             
      from leituras l 	        
 		left join cadastro_cliente cc on cc.id =l.id_cliente				
      left join tarifas tb  on  tb.inicio_periodo < time(l.hora_consumo)           
                            and tb.fim_periodo    > time(l.hora_consumo)           
                            and tb.id_tarifa = 2           
      left join feriados f  on  f.data = date(l.hora_web)			
      left join tarifas tbf on  tbf.id = 5			
      left join tarifas tc  on  tc.id_tarifa = 1           
      where l.hora_web > date_sub(now(),interval 1 minute) and cc.tipo_rede in (2,3) group by cc.id;