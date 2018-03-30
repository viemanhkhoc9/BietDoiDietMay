package com.example.service;

import java.util.Iterator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.exception.ObjectNotFound;
import com.example.model.User;
import com.example.repository.UserRepository;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserRepository userRepository;

	@Override
	@Transactional
	public void InsertUser(User us) {
		User userInsert = us;
		userRepository.save(userInsert);
		return;
	}

	@Override
	@Transactional
	public Iterator<User> FindAll() {
		Iterable<User> iterUser = userRepository.findAll();
		if (iterUser == null) {
			return null;
		}
		return iterUser.iterator();
	}

	@Override
	public User FindOne(int id) throws ObjectNotFound {
		return userRepository.findById(id).get();
	}

	@Override
	@Transactional
	public User CheckLogin(String email, String pwd) {
		Iterator<User> UserIterator = FindAll();

		while (UserIterator.hasNext()) {
			User us = UserIterator.next();
			if (us.getEmail().equals(email) && us.getPassword().equals(pwd))
				return us;
		}
		return null;
	}

}
