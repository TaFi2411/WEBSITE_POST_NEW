package com.asm2.dao;

import java.util.List;


import com.asm2.entity.User;
import com.asm2.entity.Video;
import com.asm2.unitl.JpaUtil;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;

public class UserDAO {
	static EntityManager entityManager = JpaUtil.getEntityManager();
	
	//kiem tra user co it nhat 1 luot like
	public static List<User> findUserHasLike() {
		String jpqlString = "select u from User u where u.likes is not empty";
		TypedQuery<User> query = entityManager.createQuery(jpqlString, User.class);
		return query.getResultList();
	}


	//Find all
	public static List<User> findAll() {
		String jpql = "select u from User u";
		TypedQuery<User> query = entityManager.createQuery(jpql, User.class);
		return query.getResultList();
	}
	
	//Find by id
	public static User findById(Integer id) {
		return entityManager.find(User.class, id);
	}

	//Find by Email
	public static User findByEmail(String email) {
		try {
			String jpql = "select u from User u where u.email = :email";
			TypedQuery<User> query = entityManager.createQuery(jpql, User.class);
			query.setParameter("email", email);
			return query.getSingleResult();
		} catch (Exception e) {
			return null;
		}
		
	}
	
	//Find by ID or Email
	public static User findByIdOrEmail(String idOrEmail) {
		String jpql = "select u from User u where u.email = :email or u.id = :u";
		TypedQuery<User> query = entityManager.createQuery(jpql, User.class);
		query.setParameter("email", idOrEmail);
		query.setParameter("id", idOrEmail);
		return query.getSingleResult();
	}


	public static int delete(Integer id) {
		//B3
				entityManager.getTransaction().begin();
				try {
					User user = entityManager.find(User.class, id);
					entityManager.remove(user);
					entityManager.getTransaction().commit();
					return 1;
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
					entityManager.getTransaction().rollback();
					return 0;
				}
		
	}
	
	 public static void update(User user) {
	        EntityManager em = JpaUtil.getEntityManager();
	        try {
	            em.getTransaction().begin();
	            em.merge(user);
	            em.getTransaction().commit();
	        } catch (Exception e) {
	            em.getTransaction().rollback();
	            e.printStackTrace();
	        } finally {
	            em.close();
	        }
	    }
	 
	 public static int countUsers() {
		    String jpql = "SELECT COUNT(v) FROM User v";
		    TypedQuery<Long> query = entityManager.createQuery(jpql, Long.class);
		    Long count = query.getSingleResult();
		    return count != null ? count.intValue() : 0;
		}

	
}	
