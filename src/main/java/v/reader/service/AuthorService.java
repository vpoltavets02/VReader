package v.reader.service;

import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import v.reader.dto.AuthorDto;
import v.reader.dto.AuthorProfileDto;
import v.reader.dto.mapper.AuthorMapper;
import v.reader.repository.AuthorRepository;
import v.reader.util.exception.AuthorNotFoundException;
import v.reader.util.exception.ResourceNotFoundException;

import java.util.List;

@Service
public class AuthorService {
    private final AuthorMapper authorMapper;
    private final AuthorRepository authorRepository;

    public AuthorService(AuthorMapper authorMapper, AuthorRepository authorRepository) {
        this.authorMapper = authorMapper;
        this.authorRepository = authorRepository;
    }

    public AuthorProfileDto getAuthor(String name) {
        var optionalAuthor = authorRepository.findAuthorByName(name);
        if (optionalAuthor.isEmpty())
            throw new AuthorNotFoundException(name);
        return authorMapper.convertToAuthorProfileDto(optionalAuthor.get());
    }

    public List<AuthorDto> getAuthorsPage(Pageable pageable) {
        var authorsPage = authorRepository.findAll(pageable);
        if (authorsPage.isEmpty())
            throw new ResourceNotFoundException(String.valueOf(pageable.getPageNumber() + 1));
        return authorsPage.stream().map(authorMapper::convertToAuthorDto).toList();
    }
}