package pl.ksw_stats;

import org.apache.tomcat.util.http.fileupload.FileUpload;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import pl.ksw_stats.user.UserController;

import java.io.File;

@SpringBootApplication
public class FinalProjectApplication {

    public static void main(String[] args) {
        new File(UserController.uploadDirectory).mkdir();
        SpringApplication.run(FinalProjectApplication.class, args);
    }

}
