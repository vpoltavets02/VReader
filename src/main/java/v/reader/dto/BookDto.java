package v.reader.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class BookDto {
    private String title;
    private String author;
    private Integer numberOfPages;
    private Integer yearOfWriting;
}