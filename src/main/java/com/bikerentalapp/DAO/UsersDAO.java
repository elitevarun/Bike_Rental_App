package com.bikerentalapp.DAO;

import java.util.List;

import com.bikerentalapp.DTO.User;

public interface UsersDAO {
	
	void registerUser (User u);
	
	User findById (Integer userId);
	
	List<User> findAll();
	
	void updateUser (User u);
	
	void deleteUser (User u);
}
