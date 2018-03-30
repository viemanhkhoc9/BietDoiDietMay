package com.example.service;

import java.util.Iterator;

import com.example.exception.ObjectNotFound;
import com.example.model.User;

public interface UserService {
	public void InsertUser(User us);
	public Iterator<User> FindAll();
	public User FindOne(int id) throws ObjectNotFound;
	public User CheckLogin(String username,String pwd);
}
