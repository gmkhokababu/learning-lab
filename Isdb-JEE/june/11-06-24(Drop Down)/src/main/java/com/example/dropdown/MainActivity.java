package com.example.dropdown;

import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.Toast;

import androidx.activity.EdgeToEdge;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.graphics.Insets;
import androidx.core.view.ViewCompat;
import androidx.core.view.WindowInsetsCompat;

public class MainActivity extends AppCompatActivity implements AdapterView.OnItemSelectedListener {
    String[] names = new String[]{"Select","A","B", "C", "D"};

    String selectedItem;






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

        Spinner dropdown = findViewById(R.id.spinner1);

        ArrayAdapter<String> adapter = new ArrayAdapter<>(this, android.R.layout.simple_spinner_dropdown_item, names);
        dropdown.setAdapter(adapter);
        dropdown.setOnItemSelectedListener(this);





    }

    @Override
    public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {

        selectedItem = names[position];

//        if (names[position] == "A"){
//            Toast.makeText(getApplicationContext(),"America", Toast.LENGTH_LONG).show();
//        }else if (names[position] == "B"){
//            Toast.makeText(getApplicationContext(),"Bangladesh", Toast.LENGTH_LONG).show();
//        }
//        else if (names[position] == "C"){
//            Toast.makeText(getApplicationContext(),"Canada", Toast.LENGTH_LONG).show();
//        }
//        else if (names[position] == "D"){
//            Toast.makeText(getApplicationContext(),"Denmark", Toast.LENGTH_LONG).show();
//        }
    }

    public void buttonClick(View view){
        if (selectedItem == "A"){
            Toast.makeText(getApplicationContext(),"America", Toast.LENGTH_LONG).show();
        }else if (selectedItem == "B"){
            Toast.makeText(getApplicationContext(),"Bangladesh", Toast.LENGTH_LONG).show();
        }
        else if (selectedItem == "C"){
            Toast.makeText(getApplicationContext(),"Canada", Toast.LENGTH_LONG).show();
        }
        else if (selectedItem == "D"){
            Toast.makeText(getApplicationContext(),"Denmark", Toast.LENGTH_LONG).show();
        }
    }



    @Override
    public void onNothingSelected(AdapterView<?> parent) {

    }
}