package com.example.loginproj;

import android.os.Bundle;
import android.widget.TextView;

import androidx.activity.EdgeToEdge;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.graphics.Insets;
import androidx.core.view.ViewCompat;
import androidx.core.view.WindowInsetsCompat;

import com.google.android.gms.tasks.OnSuccessListener;
import com.google.firebase.firestore.DocumentSnapshot;
import com.google.firebase.firestore.FirebaseFirestore;
import com.google.firebase.firestore.QuerySnapshot;

public class PatientActivity extends AppCompatActivity {
    TextView donors;
    String allinfo = "";
    FirebaseFirestore db;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        EdgeToEdge.enable(this);
        setContentView(R.layout.activity_patient);
        ViewCompat.setOnApplyWindowInsetsListener(findViewById(R.id.main), (v, insets) -> {
            Insets systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars());
            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom);
            return insets;
        });
        donors = findViewById(R.id.donors);
        db = FirebaseFirestore.getInstance();
//        db.collection("donors").document("lxFAX9WeEg5N2h6iWWFS").get().addOnSuccessListener(new OnSuccessListener<DocumentSnapshot>() {
//            @Override
//            public void onSuccess(DocumentSnapshot documentSnapshot) {
//                String name=documentSnapshot.get("name").toString();
//                String bg=documentSnapshot.get("bloodgroup").toString();
//                String ph=documentSnapshot.get("phonenumber").toString();
//                String lo=documentSnapshot.get("location").toString();
//                donors.setText(name+", "+bg+", "+ph+", "+lo);
//            }
//        });
        db.collection("donors").whereEqualTo("bloodgroup","A+").get().addOnSuccessListener(new OnSuccessListener<QuerySnapshot>() {
            @Override
            public void onSuccess(QuerySnapshot queryDocumentSnapshots) {
                for (DocumentSnapshot d : queryDocumentSnapshots) {
                    String name = d.get("name").toString();
                    String bg = d.get("bloodgroup").toString();
                    String ph = d.get("phonenumber").toString();
                    String lo = d.get("location").toString();
                    allinfo += name + ", " + bg + ", " + ph + ", " + lo +"\n";
                }
                donors.setText(allinfo);
            }
        });
    }
}