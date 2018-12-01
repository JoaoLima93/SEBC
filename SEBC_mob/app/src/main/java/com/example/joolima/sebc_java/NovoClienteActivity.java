package com.example.joolima.sebc_java;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.Spinner;
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

public class NovoClienteActivity extends AppCompatActivity {

    String urlWebServices = "http://192.168.0.47/sevtb/createLogin.php";
    StringRequest stringRequest;
    RequestQueue requestQueue;

    Button      btnCadastrar;
    EditText    editNome;
    EditText    editLogin;
    EditText    editSenha;
    EditText    editNumMedidor;
    CheckBox    checkBox;
    Spinner     spinnerTipoRede;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_novo_usuario);

        requestQueue        = Volley.newRequestQueue(this);

        btnCadastrar        = findViewById(R.id.btnCadastrar);
        editNome            = findViewById(R.id.editNome);
        editLogin           = findViewById(R.id.editLogin);
        editSenha           = findViewById(R.id.editSenha);
        editNumMedidor      = findViewById(R.id.editNumMedidor);
        spinnerTipoRede     = findViewById(R.id.spinnerTipoRede);
        checkBox            = findViewById(R.id.checkBox);

        btnCadastrar.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                boolean validado = true;

                if (editNome.getText().length() == 0) {
                    editNome.setError("Campo Obrigatório");
                    editNome.requestFocus();
                    validado = false;
                }

                if (editLogin.getText().length() == 0) {
                    editLogin.setError("Campo Obrigatório");
                    editLogin.requestFocus();
                    validado = false;
                }

                if (editSenha.getText().length() == 0) {
                    editSenha.setError("Campo Obrigatório");
                    editSenha.requestFocus();
                    validado = false;
                }

                if (editNumMedidor.getText().length() == 0) {
                    editNumMedidor.setError("Campo Obrigatório");
                    editNumMedidor.requestFocus();
                    validado = false;
                }

                if (!checkBox.isChecked()) {
                    checkBox.setError("Para utilização da APP é concordar com as termos de uso");
                    checkBox.requestFocus();
                    validado = false;
                }

                if(validado){
                    criarLogin();
                }
            }
        });
    }
    private void criarLogin() {
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

                                Intent novaTela = new Intent(NovoClienteActivity.this,LoginActivity.class);
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
                    params.put("nome",editNome.getText().toString());
                    params.put("login",editLogin.getText().toString());
                    params.put("senha",editSenha.getText().toString());
                    params.put("num_medidor",editNumMedidor.getText().toString());
                    params.put("tipo_rede",spinnerTipoRede.getSelectedItem().toString());
                    return params;
                }};
        requestQueue.add(stringRequest);
    }
}
