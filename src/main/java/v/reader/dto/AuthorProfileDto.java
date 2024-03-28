package v.reader.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class AuthorProfileDto {
    private String name;
    private Integer yearOfBirth;
    private String biography;
    private List<BookProfileDto> books;
}