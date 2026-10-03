package com.example.nicelogin;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

import androidx.activity.EdgeToEdge;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.graphics.Insets;
import androidx.core.view.ViewCompat;
import androidx.core.view.WindowInsetsCompat;

public class MainActivity extends AppCompatActivity {
    EditText email, password;
    Button login;

    String user_email = "sazid@gmail.com";
    String user_password = "1234";


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        EdgeToEdge.enable(this);
        setContentView(R.layout.activity_main);
        ViewCompat.setOnApplyWindowInsetsListener(findViewById(R.id.main), (v, insets) -> {
            Insets systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars());
            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom);
            return insets;
        });
        email = findViewById(R.id.email);
        password = findViewById(R.id.pass);

    }
    public void login(View view){
        String u_email = String.valueOf(email.getText());
        String u_pass = String.valueOf(password.getText());

        if ((u_email.equals(user_email))&&(u_pass.equals(user_password))){
            Intent i = new Intent(getApplicationContext(), Success.class);
            startActivity(i);
        }else {
            Intent i = new Intent(getApplicationContext(), Fail.class);
            startActivity(i);
        }



    }



}