package pl.coderslab.charity;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.charity.donation.Donation;
import pl.coderslab.charity.donation.DonationRepository;
import pl.coderslab.charity.institution.Institution;
import pl.coderslab.charity.institution.InstitutionRepository;

import java.util.List;


@Controller
public class HomeController {
    private final InstitutionRepository institutionRepository;
    private final DonationRepository donationRepository;

    public HomeController(InstitutionRepository institutionRepository, DonationRepository donationRepository) {
        this.institutionRepository = institutionRepository;
        this.donationRepository = donationRepository;
    }
    @ModelAttribute ("institutions")
    List<Institution> getInstitutions() {
        return institutionRepository.findAll();
    }
    @ModelAttribute ("countdonations")
    Long countDonations(){
        return donationRepository.count();
    }

    @RequestMapping("/")
    public String homeAction(Model model){
//        model.addAttribute("institutions", getInstitutions());
        model.addAttribute("quantity", donationRepository.countQuantity());

        return "index";
    }


}


