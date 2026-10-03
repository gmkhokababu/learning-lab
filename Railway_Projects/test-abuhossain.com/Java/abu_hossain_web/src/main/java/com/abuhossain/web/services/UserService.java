package com.abuhossain.web.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.abuhossain.web.entity.User;
import com.abuhossain.web.repo.UserRepo;

import jakarta.transaction.Transactional;

@Service
public class UserService {

	@Autowired
	private UserRepo userRepo;
	
	@Transactional
	public User addUser(User user) {
		return userRepo.save(user);
	}
	
	public User login(String userName, String password) {
		return userRepo.findByUserNameAndPassword(userName, password);
	}
}
