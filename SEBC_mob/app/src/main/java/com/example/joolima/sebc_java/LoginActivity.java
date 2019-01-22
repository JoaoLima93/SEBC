package com.example.joolima.sebc_java;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;

import org.json.JSONObject;

import java.util.HashMap;
import java.util.Map;

public class LoginActivity extends AppCompatActivity {

    String urlWebServices = "http://192.168.0.102/sebc/IntegraAPI/Usuario/validaUsuario.php";
    StringRequest stringRequest;
    RequestQueue requestQueue;

    Button      btnAcessar;
    Button      btnNovoCliente;
    EditText    editUsuario;
    EditText    editSenha;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        requestQueue        = Volley.newRequestQueue(this);

        btnAcessar          = findViewById(R.id.btnAcessar);
        btnNovoCliente      = findViewById(R.id.btnNovoCliente);
        editUsuario         = findViewById(R.id.editUsuario);
        editSenha           = findViewById(R.id.editSenha);

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
        btnNovoCliente.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent novoCliente = new Intent(LoginActivity.this,NovoClienteActivity.class);
                startActivity(novoCliente);
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

                        try {

                            JSONObject jsonObject = new JSONObject(response);
                            boolean isAutorizado = jsonObject.getBoolean("autorizado");

                            if(isAutorizado){

                                Intent novaTela = new Intent(LoginActivity.this,PainelControleActivity.class);
                                novaTela.putExtra("dados", jsonObject.toString());
                                startActivity(novaTela);
                                finish();

                            } else {
                                Toast.makeText(getApplicationContext(), jsonObject.getString("mensagem"), Toast.LENGTH_LONG).show();
                            }

                        }catch (Exception e) {
                            Log.v("LogLogin", e.getMessage());
                        }
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
