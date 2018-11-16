package com.example.joolima.sebc_java;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;

import java.util.HashMap;
import java.util.Map;

public class MainActivity extends AppCompatActivity {

    String urlWebServices = "http://192.168.0.47/sevtb/getLogin.php";
    StringRequest stringRequest;
    RequestQueue requestQueue;

    Button      btnAcessar;
    EditText    editUsuario;
    EditText    editSenha;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        requestQueue = Volley.newRequestQueue(this);

        btnAcessar   = findViewById(R.id.btnAcessar);
        editUsuario  = findViewById(R.id.editUsuario);
        editSenha    = findViewById(R.id.editSenha);

        btnAcessar.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                boolean validado = true;
                if (editUsuario.getText().length() == 0) {
                    editUsuario.setError("Campo Obrigatório");
                    editUsuario.requestFocus();
                    validado = false;
                }

                if (editSenha.getText().length() == 0) {
                    editSenha.setError("Campo Obrigatório");
                    editSenha.requestFocus();
                    validado = false;
                }

                if(validado){
                    validarLogin();
                }
            }
        });
    }

    private void validarLogin() {
        stringRequest = new StringRequest(Request.Method.POST,
                                          urlWebServices,
                new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {
                        Log.v("LogLogin", response);
                    }
                },
                new Response.ErrorListener() {
                    @Override
                    public void onErrorResponse(VolleyError error) {
                        Log.e("LogLogin", error.getMessage());
                    }
                }) {
                @Override
                protected Map<String,String> getParams(){
                    Map<String,String> params = new HashMap<>();
                    params.put("login",editUsuario.getText().toString());
                    params.put("senha",editSenha.getText().toString());
                    return params;
                }
        };
        requestQueue.add(stringRequest);
    }
}
