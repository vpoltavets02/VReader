package v.reader.util.exception;

public class ResourceNotFoundException extends RuntimeException {
    public ResourceNotFoundException(String page) {
        super(String.format("Page %s wasn't found!", page));
    }
}