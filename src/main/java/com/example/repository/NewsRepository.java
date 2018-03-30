package com.example.repository;

import org.springframework.data.repository.CrudRepository;

import com.example.model.News;

public interface NewsRepository extends CrudRepository<News,Integer>{

}
