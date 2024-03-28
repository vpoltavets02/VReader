package v.reader.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class BookProfileDto {
    private String title;
    private String author;
    private String category;
    private String description;
    private Integer numberOfPages;
    private Integer yearOfWriting;
}
