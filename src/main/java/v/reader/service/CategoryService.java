package v.reader.service;

import org.springframework.stereotype.Service;
import v.reader.dto.BookDto;
import v.reader.dto.BookProfileDto;
import v.reader.dto.mapper.BookMapper;
import v.reader.util.exception.CategoryNotFoundException;
import v.reader.model.Category;
import v.reader.repository.CategoryRepository;

import java.util.List;

@Service
public class CategoryService {
    private final BookMapper bookMapper;
    private final CategoryRepository categoryRepository;

    public CategoryService(BookMapper bookMapper, CategoryRepository categoryRepository) {
        this.bookMapper = bookMapper;
        this.categoryRepository = categoryRepository;
    }

    public List<Category> findAll() {
        return categoryRepository.findAll();
    }

    public List<BookDto> findByTitle(String title) {
        var optionalCategory = categoryRepository.findCategoryByTitle(title.toLowerCase());
        if (optionalCategory.isEmpty())
            throw new CategoryNotFoundException(title);
        var books = optionalCategory.get().getBooks();
        return books.stream().map(bookMapper::convertToBookDto).toList();
    }
}