package com.asm2.unitl;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class JpaUtil {
	static EntityManagerFactory factory = Persistence.createEntityManagerFactory("TaiLT_PC09570_ASM2");
	public static EntityManager getEntityManager() {
		if (factory == null) {
			factory = Persistence.createEntityManagerFactory("TaiLT_PC09570_ASM2");
		}
		return factory.createEntityManager();
	}
}
