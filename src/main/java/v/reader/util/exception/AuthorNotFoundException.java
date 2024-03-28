package v.reader.util.exception;

public class AuthorNotFoundException extends RuntimeException {
    public AuthorNotFoundException(String name) {
        super(String.format("%s wasn't found!", name));
    }
}