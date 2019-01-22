package com.example.joolima.sebc_java;

import android.os.Bundle;
import android.support.design.widget.FloatingActionButton;
import android.support.design.widget.Snackbar;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.view.View;

import com.github.mikephil.charting.charts.BarChart;
import com.github.mikephil.charting.charts.LineChart;
import com.github.mikephil.charting.data.BarData;
import com.github.mikephil.charting.data.BarDataSet;
import com.github.mikephil.charting.data.BarEntry;
import com.github.mikephil.charting.utils.ColorTemplate;

import java.util.ArrayList;
import java.util.List;

public class PainelControleActivity extends AppCompatActivity {

    BarChart graficoBarras;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_painel_controle_consumo);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);

        graficoBarras = findViewById(R.id.graficoBarras);

        List<BarEntry> entradas = new ArrayList<>();

        entradas.add(new BarEntry(0f,2));
        entradas.add(new BarEntry(1f,8));
        entradas.add(new BarEntry(2f,7));
        entradas.add(new BarEntry(3f,6));
        entradas.add(new BarEntry(4f,2));
        entradas.add(new BarEntry(5f,12));
        entradas.add(new BarEntry(6f,12));
        entradas.add(new BarEntry(7f,15));
        entradas.add(new BarEntry(8f,2));
        entradas.add(new BarEntry(9f,8));
        entradas.add(new BarEntry(10f,7));
        entradas.add(new BarEntry(11f,6));
        entradas.add(new BarEntry(12f,2));
        entradas.add(new BarEntry(13f,12));
        entradas.add(new BarEntry(14f,12));
        entradas.add(new BarEntry(15f,15));
        entradas.add(new BarEntry(16f,2));
        entradas.add(new BarEntry(17f,8));
        entradas.add(new BarEntry(18f,7));
        entradas.add(new BarEntry(19f,6));
        entradas.add(new BarEntry(20f,2));
        entradas.add(new BarEntry(21f,12));
        entradas.add(new BarEntry(22f,12));
        entradas.add(new BarEntry(23f,15));

        BarDataSet dados  = new BarDataSet(entradas, "Grafico Consumo");
        BarData    data   = new BarData(dados);

        // Definição das cores
        dados.setColors(ColorTemplate.COLORFUL_COLORS);

        // Separação entre as Barras
        data.setBarWidth(0.9f);

        graficoBarras.setData(data);
        graficoBarras.setFitBars(true);
        graficoBarras.invalidate();

        FloatingActionButton fab = (FloatingActionButton) findViewById(R.id.fab);
        fab.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Snackbar.make(view, "Replace with your own action", Snackbar.LENGTH_LONG)
                        .setAction("Action", null).show();
            }
        });
    }

}
