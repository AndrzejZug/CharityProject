package pl.coderslab.charity;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository<CarUser, Long> {
    CarUser findByEmail(String email);
}
