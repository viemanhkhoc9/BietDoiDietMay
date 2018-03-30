package com.example.service;

import java.util.Iterator;

import com.example.exception.ObjectNotFound;
import com.example.model.Category;

public interface CategoryService {
	public void InsertCategory(Category category);
	public void DeleteCategory(int id) throws ObjectNotFound;
	public void UpdateCategory(Category category) throws ObjectNotFound;
	public Iterator<Category> FindAll();
	public Category FindOne(int id) throws ObjectNotFound;
	
}
