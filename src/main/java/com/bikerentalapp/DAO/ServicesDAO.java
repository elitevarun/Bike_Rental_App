package com.bikerentalapp.DAO;


import java.util.List;

import com.bikerentalapp.DTO.Service;


public interface ServicesDAO {

    void registerService (Service s);
	
	Service findById (Integer serviceId);
	
	List<Service> findAll();
	
	void updateService (Service s);
	
	void deleteService (Service s);
}
