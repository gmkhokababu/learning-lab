
package student;

import javafx.application.Application;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.layout.StackPane;
import javafx.stage.Stage;

import java.util.ArrayList;
import static javafx.application.Application.launch;

public class StudentGUI extends Application {
    ArrayList<Student> sInfo = new ArrayList<>();

    public static void main(String[] args) {
        launch(args);
    }

    public void start(Stage primaryStage) {
        primaryStage.setTitle("Student Information System");

        Button admissionButton = new Button("New Student Admission");
        Button infoButton = new Button("Student Information");

        // Handle button click events
        admissionButton.setOnAction(e -> handleAdmission());
        infoButton.setOnAction(e -> handleInfo());

        StackPane root = new StackPane();
        root.getChildren().addAll(admissionButton, infoButton);

        primaryStage.setScene(new Scene(root, 300, 250));
        primaryStage.show();
    }

    private void handleAdmission() {
        AdmissionService admissionService = new AdmissionService();
        admissionService.runAdmission(sInfo);
    }

    private void handleInfo() {
        InfoService infoService = new InfoService();
        infoService.runInfo(sInfo);
    }

    public static class AdmissionService {
        public void runAdmission(ArrayList<Student> sInfo) {
            // Logic for new student admission
            // Use sInfo array to store and manage student information
            // You can call the necessary methods or refactor the logic from the Run class
        }
    }

    public static class InfoService {
        public void runInfo(ArrayList<Student> sInfo) {
            // Logic for student information retrieval
            // Use sInfo array to search for and display student information
            // You can call the necessary methods or refactor the logic from the Run class
        }
    }
}
