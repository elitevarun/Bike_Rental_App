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

		String query = "INSERT INTO BOOKING VALUES(0,?,?,?,?,?,?,?)";

		try {
			PreparedStatement ps = con.prepareStatement(query);

			ps.setInt(1, b.getUserId());
			ps.setInt(2, b.getVehicleId());
			ps.setDate(3, b.getStartDate());
			ps.setDate(4, b.getEndDate());
			ps.setInt(5, b.getTotalDays());
			ps.setDouble(6, b.getTotalAmount());
			ps.setString(7, b.getBookingStatus());
			ps.executeUpdate();

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
				b.setTotalAmount(rs.getDouble("total_amount"));
				b.setBookingStatus(rs.getString("booking_status"));
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
				b.setTotalAmount(rs.getDouble("total_amount"));
				b.setBookingStatus(rs.getString("booking_status"));
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
				+ "start_date=?, end_date=?, total_days=?, total_amount=?,booking_status=? " + "WHERE booking_id=?";

		try {
			PreparedStatement ps = con.prepareStatement(query);

			ps.setInt(1, b.getUserId());
			ps.setInt(2, b.getVehicleId());
			ps.setDate(3, b.getStartDate());
			ps.setDate(4, b.getEndDate());
			ps.setInt(5, b.getTotalDays());
			ps.setDouble(6, b.getTotalAmount());
			ps.setString(7, b.getBookingStatus());
			ps.setInt(8, b.getBookingId());

			ps.executeUpdate();

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

			ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<Booking> getBookingByUser(Integer userId) {

		String query = "SELECT " + "b.booking_id, " + "b.vehicle_id, " + "v.model, " + "b.start_date, " + "b.end_date, "
				+ "b.total_days, " + "b.total_amount, " + "b.booking_status " + "FROM booking b " + "JOIN vehicle v "
				+ "ON b.vehicle_id = v.vehicle_id " + "WHERE b.user_id = ? ";

		List<Booking> bookingList = new ArrayList<>();

		try (PreparedStatement ps = con.prepareStatement(query)) {

			ps.setInt(1, userId);

			try (ResultSet rs = ps.executeQuery()) {

				while (rs.next()) {

					Booking b = new Booking();

					b.setBookingId(rs.getInt("booking_id"));
					b.setVehicleId(rs.getInt("vehicle_id"));
					b.setModel(rs.getString("model"));
					b.setStartDate(rs.getDate("start_date"));
					b.setEndDate(rs.getDate("end_date"));
					b.setTotalDays(rs.getInt("total_days"));
					b.setTotalAmount(rs.getDouble("total_amount"));
					b.setBookingStatus(rs.getString("booking_status"));

					bookingList.add(b);
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return bookingList;
	}

	@Override
	public List<Booking> getBooking() {

		String query = "SELECT " + "b.booking_id, " + "b.vehicle_id, " + "u.first_name, " + "u.last_name, "
				+ "v.model, " + "b.start_date, " + "b.end_date, " + "b.total_amount," + "b.total_days,"
				+ "b.booking_status " + "FROM booking b " + "JOIN users u ON b.user_id=u.user_id "
				+ "JOIN vehicle v ON b.vehicle_id=v.vehicle_id; ";

		List<Booking> allBookingList = new ArrayList<>();

		try {
			PreparedStatement ps = con.prepareStatement(query);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				Booking b = new Booking();

				b.setBookingId(rs.getInt("booking_id"));
				b.setVehicleId(rs.getInt("vehicle_id"));
				b.setModel(rs.getString("model"));
				b.setFirstName(rs.getString("first_name"));
				b.setLastName(rs.getString("last_name"));
				b.setStartDate(rs.getDate("start_date"));
				b.setEndDate(rs.getDate("end_date"));
				b.setTotalDays(rs.getInt("total_days"));
				b.setTotalAmount(rs.getDouble("total_amount"));
				b.setBookingStatus(rs.getString("booking_status"));

				allBookingList.add(b);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return allBookingList;
	}

	@Override
	public void udpateBookingStatus(Integer bookingId, String status) {
		String query = "UPDATE booking SET  booking_status=? where booking_id=? ";

		try {

			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, status);
			ps.setInt(2, bookingId);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

}