package com.bikerentalapp.DAO;

import java.util.List;

import com.bikerentalapp.DTO.Payment;


public interface PaymentsDAO {

    void registerPayment (Payment p);
	
	Payment findById (Integer paymentId);
	
	List<Payment> findAll();
	
	void updatePayment (Payment p);
	
	void deletePayment (Payment p);
}
