package v.reader;

import lombok.extern.log4j.Log4j;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@Log4j
@SpringBootApplication
public class VReaderApplication {

    public static void main(String[] args) {
        SpringApplication.run(VReaderApplication.class, args);
        log.info("VReaderApplication successfully started");
    }

}
