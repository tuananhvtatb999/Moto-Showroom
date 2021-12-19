package com.devpro.conf;

import com.devpro.common.Constants;
import com.devpro.entities.Role;
import com.devpro.entities.User;
import com.devpro.repositories.RoleRepo;
import com.devpro.repositories.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.SmartLifecycle;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.context.event.EventListener;
import org.springframework.scheduling.annotation.Async;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

import java.util.Arrays;
import java.util.Objects;

@Component
public class ConfigData {

    @Autowired
    private UserRepo userRepo;

    @Autowired
    private RoleRepo roleRepo;

    @EventListener(ContextRefreshedEvent.class)
    @Async
    public void appReady() {

        BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder(8);

        Role role1 = Role.builder()
                .name("ADMIN")
                .description("Vai trò người quản trị")
                .build();
        Role role2 = Role.builder()
                .name("CUSTOMER")
                .description("Vai trò khách hàng")
                .build();
        User user = new User("Administrator", bCryptPasswordEncoder.encode("admin"),
                "admin@admin.com.vn", Arrays.asList(role1));

        Role roleFind = roleRepo.findByName(Constants.ROLE.ADMIN.toString());
        if (Objects.isNull(roleFind)) {
            roleRepo.save(role1);
        }

        Role roleFindCus = roleRepo.findByName(Constants.ROLE.CUSTOMER.toString());
        if (Objects.isNull(roleFindCus)) {
            roleRepo.save(role2);
        }

        User userFind = userRepo.findByusername("admin");
        if (Objects.isNull(userFind)) {
            userRepo.save(user);
        }
    }
}
