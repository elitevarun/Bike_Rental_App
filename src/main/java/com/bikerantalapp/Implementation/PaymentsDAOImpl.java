package com.bikerantalapp.Implementation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import com.bikerentalapp.DAO.PaymentsDAO;
import com.bikerentalapp.DTO.Payment;
import com.bikerentalapp.utitly.Connector;

public class PaymentsDAOImpl implements PaymentsDAO {

	private Connection con;

	public PaymentsDAOImpl() {
		this.con = Connector.requestConnection();
	}

	// CREATE
	@Override
	public void registerPayment(Payment p) {

		String query = "INSERT INTO PAYMENT VALUES(0,?,?,?,?,?) ";

		try {
			PreparedStatement ps = con.prepareStatement(query);

			ps.setInt(1, p.getBookingId());
			ps.setDouble(2, p.getAmount());
			ps.setString(3, p.getPaymentMode());
			ps.setString(4, p.getPaymentStatus());
			ps.setObject(5, p.getPaymentDate());

			ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// READ BY ID
	@Override
	public Payment findById(Integer paymentId) {

		String query = "SELECT * FROM PAYMENT WHERE payment_id=? ";
		Payment p = null;

		try {
			PreparedStatement ps = con.prepareStatement(query);

			ps.setInt(1, paymentId);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {

				p = new Payment();

				p.setPaymentId(rs.getInt("payment_id"));
				p.setBookingId(rs.getInt("booking_id"));
				p.setAmount(rs.getDouble("amount"));
				p.setPaymentMode(rs.getString("payment_mode"));
				p.setPaymentStatus(rs.getString("payment_status"));
				p.setPaymentDate(rs.getObject("payment_date", LocalDateTime.class));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return p;
	}

	// READ ALL
	@Override
	public List<Payment> findAll() {

		String query = "SELECT * FROM PAYMENT";

		List<Payment> paymentList = new ArrayList<>();

		try {
			PreparedStatement ps = con.prepareStatement(query);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				Payment p = new Payment();

				p.setPaymentId(rs.getInt("payment_id"));
				p.setBookingId(rs.getInt("booking_id"));
				p.setAmount(rs.getDouble("amount"));
				p.setPaymentMode(rs.getString("payment_mode"));
				p.setPaymentStatus(rs.getString("payment_status"));
				p.setPaymentDate(rs.getObject("payment_date", LocalDateTime.class));

				paymentList.add(p);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return paymentList;
	}

	// UPDATE
	@Override
	public void updatePayment(Payment p) {

		String query = "UPDATE PAYMENT SET booking_id=?, amount=?, "
				+ "payment_mode=?, payment_status=?, payment_date=? " + "WHERE payment_id=?";

		try {
			PreparedStatement ps = con.prepareStatement(query);

			ps.setInt(1, p.getBookingId());
			ps.setDouble(2, p.getAmount());
			ps.setString(3, p.getPaymentMode());
			ps.setString(4, p.getPaymentStatus());
			ps.setObject(5, p.getPaymentDate());
			ps.setInt(6, p.getPaymentId());

			ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// DELETE
	@Override
	public void deletePayment(Payment p) {

		String query = "DELETE FROM PAYMENT WHERE payment_id=?";

		try {
			PreparedStatement ps = con.prepareStatement(query);

			ps.setInt(1, p.getPaymentId());

			ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void updatePaymentStatus(Integer paymentId, String status) {
		String query = "UPDATE PAYMENT SET  payment_status=? where payment_id=? ";

		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, status);
			ps.setInt(2, paymentId);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	@Override
	public Payment findByBookingId(Integer paymentId) {

		String query = "SELECT * FROM PAYMENT WHERE booking_id=? ";
		Payment p = null;

		try {
			PreparedStatement ps = con.prepareStatement(query);

			ps.setInt(1, paymentId);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {

				p = new Payment();

				p.setPaymentId(rs.getInt("payment_id"));
				p.setBookingId(rs.getInt("booking_id"));
				p.setAmount(rs.getDouble("amount"));
				p.setPaymentMode(rs.getString("payment_mode"));
				p.setPaymentStatus(rs.getString("payment_status"));
				p.setPaymentDate(rs.getObject("payment_date", LocalDateTime.class));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return p;
	}

}