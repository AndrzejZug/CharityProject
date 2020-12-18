package pl.coderslab.charity;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import java.util.Collection;

public class CurrentUser extends User {
    private final CarUser carUser;

    public CurrentUser(String email, String password,
                       Collection<? extends GrantedAuthority> authorities,
                       CarUser carUser) {
        super(email, password, authorities);
        this.carUser = carUser;
    }

    public CarUser getCarUser() {
        return carUser;
    }
}
