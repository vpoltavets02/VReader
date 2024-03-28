package v.reader.util.exception;

public class CategoryNotFoundException extends RuntimeException {
    public CategoryNotFoundException(String title) {
        super(String.format("Category %s wasn't found!", title));
    }
}
