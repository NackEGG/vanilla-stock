package com.vs.biz;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vs.dao.AnnouncementDAO;
import com.vs.vo.AnnouncementVO;

@Service
public class AnnouncementBIZImpl implements AnnouncementBIZ {
	@Autowired 
	private AnnouncementDAO announcementDAO;

	@Override
	public String recentAnnouncement() {
		System.out.println(announcementDAO.recentAnnouncement().getTitle());
		return announcementDAO.recentAnnouncement().getTitle();
	}
}
