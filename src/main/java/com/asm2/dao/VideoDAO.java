package com.asm2.dao;

import java.util.List;

import com.asm2.entity.Video;
import com.asm2.unitl.JpaUtil;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;

public class VideoDAO {
	static EntityManager entityManager = JpaUtil.getEntityManager();
	//1. lay ds
	public static List<Video> findAll() {
		String jpql = "select v from Video v order by v.id desc";
		TypedQuery<Video> query = entityManager.createQuery(jpql, Video.class);
		List<Video> videos = query.getResultList();
		
		return videos;
	}
	//2 lay theo id
	
	public static Video findById(Integer id) {
		return entityManager.find(Video.class, id);
	}
	
	//3 them
	public static int insert(Video video) {
		//B3
		entityManager.getTransaction().begin();
		try {
			entityManager.persist(video);
			entityManager.getTransaction().commit();
			return 1;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			entityManager.getTransaction().rollback();
			return 0;
		}
	}
	//4 sưa
	public static int update(Video video) {
		//B3
		entityManager.getTransaction().begin();
		try {
			entityManager.merge(video);
			entityManager.getTransaction().commit();
			return 1;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			entityManager.getTransaction().rollback();
			return 0;
		}
	}
	//5 xoa
	public static int delete(Integer id) {
		//B3
		entityManager.getTransaction().begin();
		try {
			Video video = entityManager.find(Video.class, id);
			entityManager.remove(video);
			entityManager.getTransaction().commit();
			return 1;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			entityManager.getTransaction().rollback();
			return 0;
		}
	}
	
	//6 tim videos yeu thich theo user id
	public static List<Video> findVideoByUserId(Integer userId) {
		String jpql = "select li.video from Like li where li.user.id = :userId";
		TypedQuery<Video> query =  entityManager.createQuery(jpql, Video.class);
		query.setParameter("userId", userId);
		return query.getResultList();
	}
	
	// 7. tìm kiếm video theo tiêu đề
	public static List<Video> searchByTitle(String keyword) {
	    String jpql = "SELECT v FROM Video v WHERE v.title LIKE :keyword ORDER BY v.id DESC";
	    TypedQuery<Video> query = entityManager.createQuery(jpql, Video.class);
	    query.setParameter("keyword", "%" + keyword + "%");
	    List<Video> videos = query.getResultList();
	    return videos;
	}

	
	public static int countVideos() {
	    String jpql = "SELECT COUNT(v) FROM Video v";
	    TypedQuery<Long> query = entityManager.createQuery(jpql, Long.class);
	    Long count = query.getSingleResult();
	    return count != null ? count.intValue() : 0;
	}

}
