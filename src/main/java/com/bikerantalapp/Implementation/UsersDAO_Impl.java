package com.bikerantalapp.Implementation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bikerentalapp.DAO.UsersDAO;
import com.bikerentalapp.DTO.User;
import com.bikerentalapp.utitly.Connector;

public class UsersDAO_Impl implements UsersDAO {

	private Connection con;

	public UsersDAO_Impl() {
		this.con = Connector.requestConnection();
	}

	// CREATE
	@Override
	public void registerUser(User u) {

		String query = "INSERT INTO USERS VALUES(0,?,?,?,?,?,?,?)";

		try {
			PreparedStatement ps = con.prepareStatement(query);

			ps.setString(1, u.getFirstName());
			ps.setString(2, u.getLastName());
			ps.setString(3, u.getEmail());
			ps.setString(4, u.getPhone());
			ps.setString(5, u.getPassword());
			ps.setString(6, u.getAddress());
			ps.setInt(7, u.getDrivingLicenseNo());

			int res = ps.executeUpdate();

			if (res > 0) {
				System.out.println("User registered successfully");
			} else {
				System.out.println("User registration failed");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// READ BY ID
	@Override
	public User findById(Integer userId) {

		String query = "SELECT * FROM USERS WHERE user_id=?";

		User u = null;

		try {
			PreparedStatement ps = con.prepareStatement(query);

			ps.setInt(1, userId);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {

				u = new User();

				u.setUserId(rs.getInt("user_id"));
				u.setFirstName(rs.getString("first_name"));
				u.setLastName(rs.getString("last_name"));
				u.setEmail(rs.getString("email"));
				u.setPhone(rs.getString("phone"));
				u.setPassword(rs.getString("password"));
				u.setAddress(rs.getString("address"));
				u.setDrivingLicenseNo(rs.getInt("driving_license_no"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return u;
	}

	// READ ALL
	@Override
	public List<User> findAll() {

		String query = "SELECT * FROM USERS";

		List<User> userList = new ArrayList<>();

		try {
			PreparedStatement ps = con.prepareStatement(query);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				User u = new User();

				u.setUserId(rs.getInt("user_id"));
				u.setFirstName(rs.getString("first_name"));
				u.setLastName(rs.getString("last_name"));
				u.setEmail(rs.getString("email"));
				u.setPhone(rs.getString("phone"));
				u.setPassword(rs.getString("password"));
				u.setAddress(rs.getString("address"));
				u.setDrivingLicenseNo(rs.getInt("driving_license_no"));

				userList.add(u);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return userList;
	}

	// UPDATE
	@Override
	public void updateUser(User u) {

		String query = "UPDATE USERS SET first_name=?, last_name=?, email=?, "
				+ "phone=?, password=?, address=?, driving_license_no=? "
				+ "WHERE user_id=?";

		try {
			PreparedStatement ps = con.prepareStatement(query);

			ps.setString(1, u.getFirstName());
			ps.setString(2, u.getLastName());
			ps.setString(3, u.getEmail());
			ps.setString(4, u.getPhone());
			ps.setString(5, u.getPassword());
			ps.setString(6, u.getAddress());
			ps.setInt(7, u.getDrivingLicenseNo());

			ps.setInt(8, u.getUserId());

			int res = ps.executeUpdate();

			if (res > 0) {
				System.out.println("User updated successfully");
			} else {
				System.out.println("User not found");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// DELETE
	@Override
	public void deleteUser(User u) {

		String query = "DELETE FROM USERS WHERE user_id=?";

		try {
			PreparedStatement ps = con.prepareStatement(query);

			ps.setInt(1, u.getUserId());

			int res = ps.executeUpdate();

			if (res > 0) {
				System.out.println("User deleted successfully");
			} else {
				System.out.println("User not found");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}