package com.article_published.model;

import java.util.List;

public class Article_PublishedService {
	private Article_PublishedDAO_interface dao;

	public	Article_PublishedService() {
		dao = new Article_PublishedDAO();
	}
	
	public Article_PublishedVO addArticle_Published(String mem_no,String art_title,
		String	art_content,java.sql.Date art_time,Integer art_code) {
		Article_PublishedVO article_publishedVO = new Article_PublishedVO();
		
		article_publishedVO.setMem_no(mem_no);
		article_publishedVO.setArt_title(art_title);
		article_publishedVO.setArt_content(art_content);
		article_publishedVO.setArt_time(art_time);
		article_publishedVO.setArt_code(art_code);
		dao.insert(article_publishedVO);
		
		return article_publishedVO;
	}
	
	public Article_PublishedVO updateArticle_Published(String art_title,String art_content,
		java.sql.Date art_time,Integer art_code,String art_no) {
		Article_PublishedVO article_publishedVO = new Article_PublishedVO();
		
		article_publishedVO.setArt_title(art_title);
		article_publishedVO.setArt_content(art_content);
		article_publishedVO.setArt_time(art_time);
		article_publishedVO.setArt_code(art_code);
		article_publishedVO.setArt_no(art_no);
		dao.update(article_publishedVO);
		
		return article_publishedVO;
	}
	
	public void  deleteArticle_Published(String art_no) {
		dao.delete(art_no);
	}
	
	public Article_PublishedVO getOneArticle_Published(String art_no) {
		return dao.findByPrimaryKey(art_no);
	}
	
	public List<Article_PublishedVO> getAll(){
		return dao.getAll();
	}
}
