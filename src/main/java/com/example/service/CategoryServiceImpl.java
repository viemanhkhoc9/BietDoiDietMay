package com.example.service;

import java.util.Iterator;
import java.util.NoSuchElementException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.exception.ObjectNotFound;
import com.example.model.Category;
import com.example.repository.CategoryRepository;

@Service
public class CategoryServiceImpl implements CategoryService {
	@Autowired
	CategoryRepository categoryRepository;

	@Override
	@Transactional
	public void InsertCategory(Category category) {
		Category newCategory = category;
		categoryRepository.save(newCategory);
		return;
	}

	@Override
	@Transactional(rollbackFor = ObjectNotFound.class)
	public void DeleteCategory(int id) throws ObjectNotFound {
		Category categorydeleted = categoryRepository.findById(id).get();
		if (categorydeleted == null)
			throw new ObjectNotFound();
		categoryRepository.delete(categorydeleted);
		return;
	}

	@Override
	@Transactional(rollbackFor = ObjectNotFound.class)
	public void UpdateCategory(Category category) throws ObjectNotFound {
		Category categoryUpdated = categoryRepository.findById(category.getId()).get();
		if (categoryUpdated == null)
			throw new ObjectNotFound();
		categoryUpdated.setAttachment(category.getAttachment());
		categoryUpdated.setContent(category.getContent());
		categoryUpdated.setCreator(category.getCreator());
		categoryUpdated.setDatecreated(category.getDatecreated());
		categoryUpdated.setTitle(category.getTitle());
		categoryRepository.save(categoryUpdated);
		return;

	}

	@Override
	@Transactional
	public Iterator<Category> FindAll() {
		Iterable<Category> iterCategory = categoryRepository.findAll();
		if (iterCategory == null) {
			return null;
		}
		return iterCategory.iterator();
	}

	@Override
	@Transactional
	public Category FindOne(int id) throws ObjectNotFound, NoSuchElementException {
		return categoryRepository.findById(id).get();
	}

}
