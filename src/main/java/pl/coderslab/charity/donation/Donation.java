package pl.coderslab.charity.donation;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;
import pl.coderslab.charity.category.Category;
import pl.coderslab.charity.institution.Institution;

import javax.persistence.*;
import javax.validation.constraints.FutureOrPresent;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;

@Entity
@Data
public class Donation {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Min(1)
    private Integer quantity;
    @ManyToMany(fetch = FetchType.EAGER)
    private List<Category> categories;
    @ManyToOne
    private Institution institution;
    private String street;
    private String city;
    private String zipCode;
    @Pattern(regexp="(^$|[0-9]{8,10})")
    private String phone;
    @NotNull
    @FutureOrPresent
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate pickUpDate;
    private LocalTime pickUpTime;
    private String pickUpComment;
}
