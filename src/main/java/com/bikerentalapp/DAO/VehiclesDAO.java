package com.bikerentalapp.DAO;

import java.util.List;

import com.bikerentalapp.DTO.Vehicle;

public interface VehiclesDAO {
	
    void registerVehicle(Vehicle v);
	
	Vehicle findById (Integer vehicleId);
	
	List<Vehicle> findAll();
	
	void updateVehicle (Vehicle v);
	
	void deleteVehicle (Vehicle v);
}
