package v.reader.dto.mapper;

import org.springframework.stereotype.Component;
import v.reader.dto.CategoryDto;
import v.reader.model.Category;

@Component
public class CategoryMapper {
    public CategoryDto convertToDTO(Category category) {
        return CategoryDto.builder()
                .title(category.getTitle())
                .numberOfBooks(category.getBooks().size())
                .build();
    }
}