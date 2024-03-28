package v.reader.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import v.reader.dto.BookDto;
import v.reader.dto.CategoryDto;
import v.reader.dto.mapper.CategoryMapper;
import v.reader.service.CategoryService;
import v.reader.util.exception.CategoryNotFoundException;
import v.reader.util.exception.ErrorResponse;

import java.util.List;

@RestController
@RequestMapping("/api/v1/categories")
public class CategoryController {
    private final CategoryMapper categoryMapper;
    private final CategoryService categoryService;

    public CategoryController(CategoryMapper categoryMapper, CategoryService categoryService) {
        this.categoryMapper = categoryMapper;
        this.categoryService = categoryService;
    }

    @GetMapping
    public ResponseEntity<List<CategoryDto>> getCategories() {
        var categories = categoryService.findAll().stream().map(categoryMapper::convertToDTO).toList();
        return new ResponseEntity<>(categories, HttpStatus.OK);
    }

    @GetMapping("/{title}")
    public ResponseEntity<List<BookDto>> getCategory(@PathVariable String title) {
        var books = categoryService.findByTitle(title);
        return new ResponseEntity<>(books, HttpStatus.OK);
    }

    @ExceptionHandler(CategoryNotFoundException.class)
    private ResponseEntity<ErrorResponse> handleCategoryNotFoundException(CategoryNotFoundException e) {
        var response = new ErrorResponse(e, HttpStatus.NOT_FOUND);
        return new ResponseEntity<>(response, HttpStatus.NOT_FOUND);
    }
}