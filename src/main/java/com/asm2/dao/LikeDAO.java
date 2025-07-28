package com.asm2.dao;

import com.asm2.unitl.JpaUtil;

import java.util.List;

import com.asm2.entity.Like;
import com.asm2.entity.Video;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;

public class LikeDAO {
    static EntityManager entityManager = JpaUtil.getEntityManager();

    public static int insert(Like like) {
        try {
            entityManager.getTransaction().begin();
            entityManager.persist(like);
            entityManager.getTransaction().commit();
            return 1;
        } catch (Exception e) {
            e.printStackTrace();
            entityManager.getTransaction().rollback();
            return 0;
        }
    }

    public static int delete(Integer id) {
        try {
            entityManager.getTransaction().begin();
            Like like = entityManager.find(Like.class, id);
            if (like != null) {
                entityManager.remove(like);
            }
            entityManager.getTransaction().commit();
            return 1;
        } catch (Exception e) {
            e.printStackTrace();
            entityManager.getTransaction().rollback();
            return 0;
        }
    }

    public static Like findById(Integer id) {
        try {
            return entityManager.find(Like.class, id);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public static Like findByUserIdAndVideoId(Integer userId, Integer videoId) {
        try {
            return entityManager.createQuery(
                    "SELECT l FROM Like l WHERE l.user.id = :userId AND l.video.id = :videoId", Like.class)
                    .setParameter("userId", userId)
                    .setParameter("videoId", videoId)
                    .setMaxResults(1) 
                    .getResultList()   
                    .stream()
                    .findFirst()
                    .orElse(null);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    
    public static List<Like> findAll() {
		String jpql = "select l from Like l order by l.id desc";
		TypedQuery<Like> query = entityManager.createQuery(jpql, Like.class);
		List<Like> likes = query.getResultList();
		
		return likes;
	}
}
