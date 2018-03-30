package com.example.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.NoSuchElementException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.exception.ObjectNotFound;
import com.example.model.News;
import com.example.repository.NewsRepository;

@Service
public class NewsServiceImpl implements NewsService {

	@Autowired
	NewsRepository newsRepository;

	@Override
	@Transactional
	public void InsertNews(News news) {
		News newsInsert = news;
		newsRepository.save(newsInsert);
		return;

	}

	@Override
	@Transactional(rollbackFor = ObjectNotFound.class)
	public void DeleteNews(int id) throws ObjectNotFound {
		News newsdeleted = newsRepository.findById(id).get();
		if (newsdeleted == null)
			throw new ObjectNotFound();
		newsRepository.delete(newsdeleted);
		return;

	}

	@Override
	@Transactional(rollbackFor = ObjectNotFound.class)
	public void UpdateNews(News news) throws ObjectNotFound {
		News newsUpdated = newsRepository.findById(news.getId()).get();
		if (newsUpdated == null)
			throw new ObjectNotFound();
		newsUpdated.setLink(news.getLink());
		newsUpdated.setContent(news.getContent());
		newsUpdated.setCreator(news.getCreator());
		newsUpdated.setDatecreated(news.getDatecreated());
		newsUpdated.setTitle(news.getTitle());
		newsUpdated.setCategory(news.getCategory());
		newsRepository.save(newsUpdated);
		return;
	}

	@Override
	@Transactional
	public Iterator<News> FindAll() {
		Iterable<News> iterNews = newsRepository.findAll();
		if (iterNews == null) {
			return null;
		}
		return iterNews.iterator();
	}

	@Override
	@Transactional
	public News FindOne(int id) throws ObjectNotFound, NoSuchElementException {
		return newsRepository.findById(id).get();
	}

	@Override
	public Iterator<News> LastNews() {
		Iterator<News> iterAllNews = newsRepository.findAll().iterator();
		List<News> listLastNews = new ArrayList<News>();
		int i = 0;
		while (iterAllNews.hasNext() && i < 5) {
			i++;
			listLastNews.add(iterAllNews.next());
		}
		return listLastNews.iterator();
	}

}
