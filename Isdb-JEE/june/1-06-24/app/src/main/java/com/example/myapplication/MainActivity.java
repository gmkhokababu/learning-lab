package com.example.myapplication;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import androidx.activity.EdgeToEdge;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.graphics.Insets;
import androidx.core.view.ViewCompat;
import androidx.core.view.WindowInsetsCompat;

public class MainActivity extends AppCompatActivity {
    Button b1,b2;
    EditText n1,n2,calculate;

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

        b1 = findViewById(R.id.sum);
        n1 = findViewById(R.id.n1);
        n2 = findViewById(R.id.n2);
        calculate = findViewById(R.id.result);



    }
//    public void m1(View view){
//        Toast.makeText(this,"hello",Toast.LENGTH_LONG).show();
//    }

    public void add(View v){
//        n1.setText("Dhaka");
//        n2.setText("Bangladesh");
        String getn1 = String.valueOf(n1.getText());
        Integer num1Int = Integer.parseInt(getn1);
        String getn2 = String.valueOf(n2.getText());
        Integer num2Int = Integer.parseInt(getn2);

        int sumTwoNumber = num1Int + num2Int;

        String sumToast = String.valueOf(sumTwoNumber);
        calculate.setText(sumToast);


        Toast.makeText(this, sumToast, Toast.LENGTH_LONG).show();

    }

    public void minus(View v){
//        n1.setText("Dhaka");
//        n2.setText("Bangladesh");
        String getn1 = String.valueOf(n1.getText());
        Integer num1Int = Integer.parseInt(getn1);
        String getn2 = String.valueOf(n2.getText());
        Integer num2Int = Integer.parseInt(getn2);

        int subTwoNumber = num1Int - num2Int;

        String subToast = String.valueOf(subTwoNumber);
        calculate.setText(subToast);


        Toast.makeText(this, subToast, Toast.LENGTH_LONG).show();

    }
    public void multi(View v){
//        n1.setText("Dhaka");
//        n2.setText("Bangladesh");
        String getn1 = String.valueOf(n1.getText());
        Integer num1Int = Integer.parseInt(getn1);
        String getn2 = String.valueOf(n2.getText());
        Integer num2Int = Integer.parseInt(getn2);

        int multiTwoNumber = num1Int * num2Int;

        String multiToast = String.valueOf(multiTwoNumber);
        calculate.setText(multiToast);


        Toast.makeText(this, multiToast, Toast.LENGTH_LONG).show();

    }

    public void div(View v){
//        n1.setText("Dhaka");
//        n2.setText("Bangladesh");
        String getn1 = String.valueOf(n1.getText());
        double num1Int = Double.parseDouble(getn1);
        String getn2 = String.valueOf(n2.getText());
        double num2Int = Double.parseDouble(getn2);

        double divTwoNumber = num1Int / num2Int;

        String divToast = String.valueOf(divTwoNumber);
        calculate.setText(divToast);


        Toast.makeText(this, divToast, Toast.LENGTH_LONG).show();

    }




}