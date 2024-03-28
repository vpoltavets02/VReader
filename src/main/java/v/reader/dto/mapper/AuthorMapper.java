package v.reader.dto.mapper;

import org.springframework.stereotype.Component;
import v.reader.dto.AuthorDto;
import v.reader.dto.AuthorProfileDto;
import v.reader.model.Author;

@Component
public class AuthorMapper {
    private final BookMapper bookMapper;

    public AuthorMapper(BookMapper bookMapper) {
        this.bookMapper = bookMapper;
    }

    public AuthorDto convertToAuthorDto(Author author) {
        return AuthorDto.builder()
                .name(author.getName())
                .yearOfBirth(author.getYearOfBirth())
                .build();
    }

    public AuthorProfileDto convertToAuthorProfileDto(Author author) {
        var booksDto = author.getBooks().stream().map(bookMapper::convertToBookProfileDto).toList();
        return AuthorProfileDto.builder()
                .name(author.getName())
                .yearOfBirth(author.getYearOfBirth())
                .biography(author.getBiography())
                .books(booksDto)
                .build();

    }
}