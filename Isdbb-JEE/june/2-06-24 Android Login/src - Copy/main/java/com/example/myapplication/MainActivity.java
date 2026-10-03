package com.example.myapplication;

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

    EditText username, password;
    Button login;

    String name = "sumon";
    String password_1 = "123456";
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



        username=findViewById(R.id.userName);
        password=findViewById(R.id.password);

    }

    public void login(View view){
        String username_1 =  String.valueOf(username.getText());
        String userpassword = String.valueOf(password.getText());

        if((userpassword.equals(password_1)) && (username_1.equals(name))){
            Intent i= new Intent(getApplicationContext(),MainActivity2.class);
            startActivity(i);
        }else{
            Intent i= new Intent(getApplicationContext(),MainActivity3.class);
            startActivity(i);
        }


    }
}