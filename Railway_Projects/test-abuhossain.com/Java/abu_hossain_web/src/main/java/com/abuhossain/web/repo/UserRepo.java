package com.abuhossain.web.repo;

import java.util.List;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.abuhossain.web.entity.User;

import jakarta.transaction.Transactional;
@Repository
public interface UserRepo extends JpaRepository<User, Long> {
	// ================================
	// GET ALL USER
	// ================================
	@Query("FROM User")
	List<User> getAllUsers();

	// ================================
	// LOG IN
	// ================================
	@Query("FROM User u where u.userName= :userName AND u.password= :password")
	User findByUserNameAndPassword(@Param("userName") String userName, @Param("password") String password);

	// ================================
	// UPDATE USERNAME AND PASSWORD
	// ================================
	@Modifying
	@Transactional
	@Query("UPDATE User u SET u.userName= :newUserName, u.password= :newPassword WHERE u.userName= :userName AND u.password= :password")
	int updateUser(@Param("newUserName") String newUserName, @Param("newPassword") String newPassword, @Param("userName")	String userName, @Param("password")	String password);

	// ================================
	// DELETE USER
	// ================================
	@Modifying
	@Transactional
	@Query("DELETE FROM User u WHERE u.userName = :userName AND u.password = :password")
	int deleteByUserNameAndPassword(@Param("userName") String userName, @Param("password") String password);

	// ================================
	// USER BY USERNAEM
	// ================================
	@Query("SELECT u.userId FROM User u WHERE u.userName = :userName")
	long userId(@Param("userName") String userName);
}
