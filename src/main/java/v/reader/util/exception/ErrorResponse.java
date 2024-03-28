package v.reader.util.exception;

import lombok.Data;
import org.springframework.http.HttpStatus;

import java.text.SimpleDateFormat;
import java.util.Date;

@Data
public class ErrorResponse {
    private String status;
    private String message;
    private String timestamp;

    public ErrorResponse(RuntimeException exception, HttpStatus status) {
        this.message = exception.getMessage();
        this.status = status.name();
        this.timestamp = new SimpleDateFormat("dd.MM.yyyy HH:mm:ss").format(new Date());
    }
}
