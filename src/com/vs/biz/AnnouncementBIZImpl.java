package com.vs.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vs.dao.AnnouncementDAO;

@Service
public class AnnouncementBIZImpl {
	@Autowired 
	private AnnouncementDAO announcementDAO;
}
