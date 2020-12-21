package pl.coderslab.charity;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.mail.MessagingException;
import javax.validation.Valid;
import java.util.List;

@Controller
public class UserController {

    private final UserService userService;
    private final RoleRepository roleRepository;
    private final EmailService emailService;


    public UserController(UserService userService, RoleRepository roleRepository, EmailService emailService) {
        this.userService = userService;
        this.roleRepository = roleRepository;
        this.emailService = emailService;
    }

    @ModelAttribute("roles")
    public List<Role> userRoles() {
        return roleRepository.findAll();
    }

    @GetMapping("/admin/create-user")
    @ResponseBody
    public String createUser() {

        CarUser carUser = new CarUser();
        carUser.setEmail("admin@wp.pl");
        carUser.setPassword("admin");
        userService.saveUser(carUser);
        return "admin";
    }

    @GetMapping("/admin/all")
    public String showUsers(Model model) {
        List<CarUser> carUsers = userService.getUsers();
        model.addAttribute("carUsers", carUsers);
        return "/admin/all-users";
    }

    @GetMapping("/email")
    @ResponseBody
    public String sendEmail() {
        emailService.sendSimpleMessage("ajzugaj@gmail.com", "Test email", "Test wysyłki email");
        return "email wysłano";
    }
    @GetMapping("/email2")
    @ResponseBody
    public String sendEmailWithAttachement() throws MessagingException {
        emailService.sendMessageWithAttachment("ajzugaj@gmail.com", "Test email", "Test wysyłki email z załącznikiem", "resources/images/about-us.jpg");
        return "email wysłano";
    }


    @GetMapping("/register")
    public String showRegisterForm(Model model) {
        model.addAttribute("carUser", new CarUser());
        return "/register";
    }
        @PostMapping("/register")
    public String registerUser(@Valid CarUser carUser, BindingResult result, Model model) {

        if (result.hasErrors()) {
            System.out.println("error: " + result);
            System.out.println(carUser);
            return "/register";
        }
        CarUser userByEmail = userService.findByEmail(carUser.getEmail());

        if(userByEmail==null) {
            userService.saveUser(carUser);
            String emailTo = carUser.getEmail();
            String emailText = carUser.getFirstName() + " " + carUser.getLastName();
            emailService.sendSimpleMessage(emailTo, "Potwierdzenie rejestracji Charity", emailText);
            return "redirect:/";
        }else {
            String error = "This email is already taken";
            model.addAttribute("message", error);
            return "/register";
        }
    }

}
