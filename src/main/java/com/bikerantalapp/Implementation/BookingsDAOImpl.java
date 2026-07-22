package com.bikerantalapp.Implementation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bikerentalapp.DAO.BookingsDAO;
import com.bikerentalapp.DTO.Booking;
import com.bikerentalapp.utitly.Connector;

public class BookingsDAOImpl implements BookingsDAO {

	private Connection con;

	public BookingsDAOImpl() {
		this.con = Connector.requestConnection();
	}

	// CREATE
	@Override
	public void registerBooking(Booking b) {

		String query = "INSERT INTO BOOKING VALUES(0,?,?,?,?,?,?)";

		try {
			PreparedStatement ps = con.prepareStatement(query);

			ps.setInt(1, b.getUserId());
			ps.setInt(2, b.getVehicleId());
			ps.setDate(3, b.getStartDate());
			ps.setDate(4, b.getEndDate());
			ps.setInt(5, b.getTotalDays());
			ps.setBigDecimal(6, b.getTotalAmount());

			int res = ps.executeUpdate();

			if (res > 0) {
				System.out.println("Booking registered successfully");
			} else {
				System.out.println("Booking registration failed");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// READ BY ID
	@Override
	public Booking findById(Integer bookingId) {

		String query = "SELECT * FROM BOOKING WHERE booking_id=?";

		Booking b = null;

		try {
			PreparedStatement ps = con.prepareStatement(query);

			ps.setInt(1, bookingId);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {

				b = new Booking();

				b.setBookingId(rs.getInt("booking_id"));
				b.setUserId(rs.getInt("user_id"));
				b.setVehicleId(rs.getInt("vehicle_id"));
				b.setStartDate(rs.getDate("start_date"));
				b.setEndDate(rs.getDate("end_date"));
				b.setTotalDays(rs.getInt("total_days"));
				b.setTotalAmount(rs.getBigDecimal("total_amount"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return b;
	}

	// READ ALL
	@Override
	public List<Booking> findAll() {

		String query = "SELECT * FROM BOOKING";

		List<Booking> bookingList = new ArrayList<>();

		try {
			PreparedStatement ps = con.prepareStatement(query);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				Booking b = new Booking();

				b.setBookingId(rs.getInt("booking_id"));
				b.setUserId(rs.getInt("user_id"));
				b.setVehicleId(rs.getInt("vehicle_id"));
				b.setStartDate(rs.getDate("start_date"));
				b.setEndDate(rs.getDate("end_date"));
				b.setTotalDays(rs.getInt("total_days"));
				b.setTotalAmount(rs.getBigDecimal("total_amount"));

				bookingList.add(b);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return bookingList;
	}

	// UPDATE
	@Override
	public void updateBooking(Booking b) {

		String query = "UPDATE BOOKING SET user_id=?, vehicle_id=?, "
				+ "start_date=?, end_date=?, total_days=?, total_amount=? "
				+ "WHERE booking_id=?";

		try {
			PreparedStatement ps = con.prepareStatement(query);

			ps.setInt(1, b.getUserId());
			ps.setInt(2, b.getVehicleId());
			ps.setDate(3, b.getStartDate());
			ps.setDate(4, b.getEndDate());
			ps.setInt(5, b.getTotalDays());
			ps.setBigDecimal(6, b.getTotalAmount());

			ps.setInt(7, b.getBookingId());

			int res = ps.executeUpdate();

			if (res > 0) {
				System.out.println("Booking updated successfully");
			} else {
				System.out.println("Booking not found");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// DELETE
	@Override
	public void deleteBooking(Booking b) {

		String query = "DELETE FROM BOOKING WHERE booking_id=?";

		try {
			PreparedStatement ps = con.prepareStatement(query);

			ps.setInt(1, b.getBookingId());

			int res = ps.executeUpdate();

			if (res > 0) {
				System.out.println("Booking deleted successfully");
			} else {
				System.out.println("Booking not found");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}