package pl.coderslab.charity;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import java.util.HashSet;
import java.util.Set;

public class SpringDataUserDetailsService implements UserDetailsService {

        private UserService userService;

        @Autowired
        public void setUserRepository(UserService userService) {
            this.userService = userService;
        }

        @Override
        public UserDetails loadUserByUsername(String email) {
            CarUser carUser = userService.findByEmail(email);
            if (carUser == null) {
                throw new UsernameNotFoundException(email);
            }
            Set<GrantedAuthority> grantedAuthorities = new HashSet<>();
            carUser.getRoles().forEach(r ->
                    grantedAuthorities.add(new SimpleGrantedAuthority(r.getName())));
            return new CurrentUser(carUser.getEmail(), carUser.getPassword(),
                    grantedAuthorities, carUser);
        }
    }
