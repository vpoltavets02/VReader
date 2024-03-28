package v.reader.model;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import jakarta.persistence.*;
import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "author")
public class Author {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Max(100)
    @Column(name = "name")
    private String name;

    @Column(name = "year_of_birth")
    private Integer yearOfBirth;

    @Max(1000)
    @NotBlank
    @Column(name = "biography")
    private String biography;

    @JsonManagedReference
    @OneToMany(mappedBy = "author")
    private List<Book> books;
}