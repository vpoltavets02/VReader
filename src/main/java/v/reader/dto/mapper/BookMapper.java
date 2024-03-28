package v.reader.dto.mapper;

import org.springframework.stereotype.Component;
import v.reader.dto.BookDto;
import v.reader.dto.BookProfileDto;
import v.reader.model.Book;

@Component
public class BookMapper {
    public BookDto convertToBookDto(Book book) {
        return BookDto.builder()
                .title(book.getTitle())
                .author(book.getAuthor().getName())
                .numberOfPages(book.getNumberOfPager())
                .yearOfWriting(book.getYearOfWriting())
                .build();
    }

    public BookProfileDto convertToBookProfileDto(Book book) {
        return BookProfileDto.builder()
                .title(book.getTitle())
                .author(book.getAuthor().getName())
                .category(book.getCategory().getTitle())
                .description(book.getDescription())
                .numberOfPages(book.getNumberOfPager())
                .yearOfWriting(book.getYearOfWriting())
                .build();
    }
}