package com.article_published.model;

import java.util.List;

public interface Article_PublishedDAO_interface {
	public void insert(Article_PublishedVO article_publishedVO);
	public void update(Article_PublishedVO article_publishedVO);
	public void delete(String art_no);
	public Article_PublishedVO findByPrimaryKey(String art_no);
	public List<Article_PublishedVO> getAll();
}
