package com.example.firebasecrud;

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

import com.google.android.gms.tasks.OnSuccessListener;
import com.google.firebase.Firebase;
import com.google.firebase.firestore.DocumentReference;
import com.google.firebase.firestore.FirebaseFirestore;

import java.util.HashMap;
import java.util.Map;

public class MainActivity extends AppCompatActivity {
    FirebaseFirestore db ;
    EditText id,name;
    Button save;
    HashMap<String,Object> map = new HashMap<>();
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
        db = FirebaseFirestore.getInstance();
        id=findViewById(R.id.editTextText);
        name=findViewById(R.id.editTextText2);
        save=findViewById(R.id.button);






        save.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                map.put("id",id.getText().toString());
                map.put("name",name.getText().toString());
                //Toast.makeText(MainActivity.this, i+"  "+n,Toast.LENGTH_LONG).show();
                 save(map);
            }
        });

    }
    public void save(Map map){
        db.collection("students").add(map).addOnSuccessListener(new OnSuccessListener<DocumentReference>() {
            @Override
            public void onSuccess(DocumentReference documentReference) {
                Toast.makeText(MainActivity.this,"saved",Toast.LENGTH_LONG).show();
            }
        });
    }
}