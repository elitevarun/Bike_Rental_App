package com.bikerentalapp.DAO;

import java.util.List;

import com.bikerentalapp.DTO.Admin;



public interface AdminsDAO {

    void registerAdmin(Admin a);
	
	Admin findById (Integer adminId);
	
	List<Admin> findAll();
	
	void updateAdmin (Admin a);
	
	void deleteAdmin (Admin a);
}
