package pl.coderslab.charity;

import java.util.List;

public interface UserService {

    CarUser findByEmail(String email);

    void saveUser(CarUser carUser);
    void saveUserForm(CarUser carUser);

    List<CarUser> getUsers();
}
