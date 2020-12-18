package pl.coderslab.charity;

import lombok.Data;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;
import java.util.Set;

@Entity
@Data
public class CarUser {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(nullable = false, unique = true, length = 80)
    @Email
    @NotEmpty
    private String email;
    @NotEmpty
    private String password;
    private String firstName;
    private String lastName;
    @Min(0)
    @Max(1)
    private int enabled;
    @NotEmpty
    @ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private Set<Role> roles;
}
