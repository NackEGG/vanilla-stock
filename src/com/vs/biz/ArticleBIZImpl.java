package com.vs.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vs.dao.ArticleDAO;

@Service
public class ArticleBIZImpl implements ArticleBIZ {
	@Autowired
	private ArticleDAO articleDAO;
}
