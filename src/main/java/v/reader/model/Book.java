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
@Table(name = "book")
public class Book {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Max(100)
    @NotBlank
    @Column(name = "title")
    private String title;

    @JsonManagedReference
    @ManyToOne (fetch = FetchType.LAZY)
    @JoinColumn(name = "author_id", referencedColumnName = "id")
    private Author author;

    @JsonManagedReference
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "category_id", referencedColumnName = "id")
    private Category category;

    @Max(1500)
    @NotBlank
    @Column(name = "description")
    private String description;

    @Column(name = "number_of_pages")
    private Integer numberOfPager;

    @Column(name = "year_of_writing")
    private Integer yearOfWriting;

    @ManyToMany(mappedBy = "wishlist")
    private List<User> likes;
}