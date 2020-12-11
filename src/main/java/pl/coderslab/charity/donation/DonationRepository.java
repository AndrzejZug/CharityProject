package pl.coderslab.charity.donation;

import org.hibernate.sql.Select;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.stream.Collectors;

@Repository
public interface DonationRepository extends JpaRepository<Donation, Long> {
//
//
    @Query("SELECT SUM(d.quantity) FROM Donation d")
    public int countQuantity();
}
