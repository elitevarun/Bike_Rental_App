package com.bikerentalapp.DAO;

import java.util.List;

import com.bikerentalapp.DTO.VehicleImage;

public interface VehicleImagesDAO {
	
    void registerImage(VehicleImage vi);
	
    VehicleImage findById (Integer imageId);
	
	List<VehicleImage> findAll();
	
	void updateImage (VehicleImage vi);
	
	void deleteImage (VehicleImage vi);
}
