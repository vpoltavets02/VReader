package v.reader.controller;

import lombok.extern.log4j.Log4j;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import v.reader.dto.AuthorDto;
import v.reader.dto.AuthorProfileDto;
import v.reader.service.AuthorService;
import v.reader.util.exception.AuthorNotFoundException;
import v.reader.util.exception.ErrorResponse;
import v.reader.util.exception.ResourceNotFoundException;

import java.util.List;

@Log4j
@RestController
@RequestMapping("/api/v1/authors")
public class AuthorController {
    private final AuthorService authorService;

    public AuthorController(AuthorService authorService) {
        this.authorService = authorService;
    }

    @GetMapping
    public ResponseEntity<List<AuthorDto>> getAuthorsPage(@RequestParam("page") Integer page) {
        var authors = authorService.getAuthorsPage(PageRequest.of(page - 1, 5));
        return new ResponseEntity<>(authors, HttpStatus.OK);
    }

    @GetMapping("/{name}")
    public ResponseEntity<AuthorProfileDto> getAuthor(@PathVariable String name) {
        return new ResponseEntity<>(authorService.getAuthor(name), HttpStatus.OK);
    }

    @ExceptionHandler(AuthorNotFoundException.class)
    private ResponseEntity<ErrorResponse> handleAuthorNotFoundException(AuthorNotFoundException e) {
        log.error(e.getMessage(), e);
        var errorResponse = new ErrorResponse(e, HttpStatus.NOT_FOUND);
        return new ResponseEntity<>(errorResponse, HttpStatus.NOT_FOUND);
    }

    @ExceptionHandler(ResourceNotFoundException.class)
    private ResponseEntity<ErrorResponse> handleMyResourceNotFoundException(ResourceNotFoundException e) {
        log.error(e.getMessage(), e);
        var errorResponse = new ErrorResponse(e, HttpStatus.NOT_FOUND);
        return new ResponseEntity<>(errorResponse, HttpStatus.NOT_FOUND);
    }
}