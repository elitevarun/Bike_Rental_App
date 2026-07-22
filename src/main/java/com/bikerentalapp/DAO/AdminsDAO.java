package com.bikerentalapp.DAO;

import java.util.List;

import com.bikerentalapp.DTO.Admin;
import com.bikerentalapp.DTO.User;



public interface AdminsDAO {

    void registerAdmin(Admin a);
	
	Admin findById (Integer adminId);
	
	Admin findByMailAndPassword(String mail, String password);
	
	List<Admin> findAll();
	
	void updateAdmin (Admin a);
	
	void deleteAdmin (Admin a);
}
