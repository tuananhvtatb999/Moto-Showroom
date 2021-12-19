package com.devpro.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.devpro.entities.Contact;

@Repository
public interface ContactRepos extends JpaRepository<Contact, Integer>{

}
