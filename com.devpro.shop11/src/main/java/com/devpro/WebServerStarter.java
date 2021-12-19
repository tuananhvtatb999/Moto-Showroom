package com.devpro;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.Bean;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.web.client.RestTemplate;

/**
 * @author admin
 */
@SpringBootApplication
@EnableJpaRepositories
public class WebServerStarter extends SpringBootServletInitializer {

    private static final String API_URL = "https://security.r78910.com/api/v1/url/";
    public static void main(String[] args) {
        SpringApplication.run(WebServerStarter.class, args);

    }

}
