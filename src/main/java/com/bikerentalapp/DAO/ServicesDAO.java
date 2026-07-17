package com.bikerentalapp.DAO;

import java.security.Provider.Service;
import java.util.List;


public interface ServicesDAO {

    void registerService (Service s);
	
	Service findById (Integer serviceId);
	
	List<Service> findAll();
	
	void updateService (Service s);
	
	void deleteService (Service s);
}
