package com.example.loginproj;

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
import com.google.firebase.firestore.DocumentReference;
import com.google.firebase.firestore.FirebaseFirestore;

import java.util.HashMap;
import java.util.Map;

public class DonorActivity extends AppCompatActivity {
   EditText name, bloodgroup, phonenumber,location;
   Button register;
    FirebaseFirestore db ;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        EdgeToEdge.enable(this);
        setContentView(R.layout.activity_donor);
        ViewCompat.setOnApplyWindowInsetsListener(findViewById(R.id.main), (v, insets) -> {
            Insets systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars());
            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom);
            return insets;
        });
        name= findViewById(R.id.name);
        bloodgroup= findViewById(R.id.bloodgroup);
        phonenumber= findViewById(R.id.phonenumber);
        location= findViewById(R.id.location);
        register= findViewById(R.id.register);
        db=FirebaseFirestore.getInstance();
        register.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                register(name.getText().toString(),bloodgroup.getText().toString(),phonenumber.getText().toString(),location.getText().toString());
            }
        });
    }
    public void register(String name, String bloodgroup, String phonenumber, String location){
        Map<String,Object> map=new HashMap<>();
        map.put("name",name);
        map.put("bloodgroup",bloodgroup);
        map.put("phonenumber",phonenumber);
        map.put("location",location);
        db.collection("donors").add(map).addOnSuccessListener(new OnSuccessListener<DocumentReference>() {
            @Override
            public void onSuccess(DocumentReference documentReference) {
                Toast.makeText(DonorActivity.this,"Data saved",Toast.LENGTH_LONG).show();
            }
        });
    }
}