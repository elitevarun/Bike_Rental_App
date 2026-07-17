package com.bikerentalapp.DAO;

import java.util.List;

import com.bikerentalapp.DTO.Booking;

public interface BookingsDAO {
	
    void registerBooking(Booking b);
	
	Booking findById (Integer bookingId);
	
	List<Booking> findAll();
	
	void updateBooking (Booking b);
	
	void deleteBooking (Booking b);
}
