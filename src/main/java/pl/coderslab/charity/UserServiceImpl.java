package pl.coderslab.charity;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Arrays;
import java.util.HashSet;
import java.util.List;

@Service
@Transactional
public class UserServiceImpl implements UserService {

    private final UserRepository userRepository;
    private final RoleRepository roleRepository;
    private final BCryptPasswordEncoder passwordEncoder;

    public UserServiceImpl(UserRepository userRepository, RoleRepository roleRepository, BCryptPasswordEncoder passwordEncoder) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
        this.passwordEncoder = passwordEncoder;
    }

    @Override
    public CarUser findByEmail(String email) {
        return userRepository.findByEmail(email);
    }

    @Override
    public void saveUser(CarUser carUser) {
        carUser.setPassword(passwordEncoder.encode(carUser.getPassword()));
        carUser.setEnabled(1);
        Role userRole = roleRepository.findByName("ROLE_USER");
        carUser.setRoles(new HashSet<>(Arrays.asList(userRole)));
        userRepository.save(carUser);
    }

    @Override
    public void saveUserForm(CarUser carUser) {
        carUser.setPassword(passwordEncoder.encode(carUser.getPassword()));
        carUser.setEnabled(1);
        userRepository.save(carUser);
    }

    @Override
    public List<CarUser> getUsers() {
        return userRepository.findAll();
    }
}
