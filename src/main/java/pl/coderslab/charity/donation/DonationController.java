package pl.coderslab.charity.donation;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.charity.category.CategoryRepository;
import pl.coderslab.charity.institution.InstitutionRepository;

import javax.validation.Valid;

@Controller
public class DonationController {
    private final DonationRepository donationRepository;
    private final InstitutionRepository institutionRepository;
    private final CategoryRepository categoryRepository;

    public DonationController(DonationRepository donationRepository, InstitutionRepository institutionRepository, CategoryRepository categoryRepository) {
        this.donationRepository = donationRepository;
        this.institutionRepository = institutionRepository;
        this.categoryRepository = categoryRepository;
    }

    @GetMapping("/form")
    public String formAction(Model model){
        model.addAttribute("donation", new Donation());
        model.addAttribute("institutions", institutionRepository.findAll());
        model.addAttribute("categories", categoryRepository.findAll());
        return "form";
    }
    @PostMapping("/form")
    public String saveDonation(@Valid Donation donation, BindingResult result){
        if (result.hasErrors()) {
            return "redirect:/form";
        }
        donationRepository.save(donation);
        return "redirect:/form-confirmation";
    }
    @RequestMapping("/form-confirmation")
    public String formConfirmation(){
        return "/form-confirmation";
    }
}
