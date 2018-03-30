package com.example.service;

import java.util.Iterator;

import com.example.exception.ObjectNotFound;
import com.example.model.News;

public interface NewsService {
	public void InsertNews(News news);
	public void DeleteNews(int id) throws ObjectNotFound;
	public void UpdateNews(News news) throws ObjectNotFound;
	public Iterator<News> FindAll();
	public News FindOne(int id) throws ObjectNotFound;
	public Iterator<News> LastNews();
}
