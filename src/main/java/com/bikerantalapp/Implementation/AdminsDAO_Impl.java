package com.bikerantalapp.Implementation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bikerentalapp.DAO.AdminsDAO;
import com.bikerentalapp.DTO.Admin;
import com.bikerentalapp.utitly.Connector;

public class AdminsDAO_Impl implements AdminsDAO {

	private Connection con;

	public AdminsDAO_Impl() {
		this.con = Connector.requestConnection();
	}

	// CREATE
	@Override
	public void registerAdmin(Admin a) {

		String query = "INSERT INTO ADMIN VALUES(0,?,?,?,?)";

		try {
			PreparedStatement ps = con.prepareStatement(query);

			ps.setString(1, a.getName());
			ps.setString(2, a.getEmail());
			ps.setString(3, a.getPassword());
			ps.setString(4, a.getRole());

			int res = ps.executeUpdate();

			if (res > 0) {
				System.out.println("Admin registered successfully");
			} else {
				System.out.println("Admin registration failed");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// READ - FIND BY ID
	@Override
	public Admin findById(Integer adminId) {

		String query = "SELECT * FROM ADMIN WHERE admin_id = ?";

		Admin a = null;

		try {
			PreparedStatement ps = con.prepareStatement(query);

			ps.setInt(1, adminId);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {

				a = new Admin();

				a.setAdminId(rs.getInt("admin_id"));
				a.setName(rs.getString("name"));
				a.setEmail(rs.getString("email"));
				a.setPassword(rs.getString("password"));
				a.setRole(rs.getString("role"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return a;
	}

	// READ - FIND ALL
	@Override
	public List<Admin> findAll() {

		String query = "SELECT * FROM ADMIN";

		List<Admin> adminList = new ArrayList<>();

		try {
			PreparedStatement ps = con.prepareStatement(query);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				Admin a = new Admin();

				a.setAdminId(rs.getInt("admin_id"));
				a.setName(rs.getString("name"));
				a.setEmail(rs.getString("email"));
				a.setPassword(rs.getString("password"));
				a.setRole(rs.getString("role"));

				adminList.add(a);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return adminList;
	}

	// UPDATE
	@Override
	public void updateAdmin(Admin a) {

		String query =
				"UPDATE ADMIN SET name=?, email=?, password=?, role=? WHERE admin_id=?";

		try {
			PreparedStatement ps = con.prepareStatement(query);

			ps.setString(1, a.getName());
			ps.setString(2, a.getEmail());
			ps.setString(3, a.getPassword());
			ps.setString(4, a.getRole());
			ps.setInt(5, a.getAdminId());

			int res = ps.executeUpdate();

			if (res > 0) {
				System.out.println("Admin updated successfully");
			} else {
				System.out.println("Admin not found");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// DELETE
	@Override
	public void deleteAdmin(Admin a) {

		String query = "DELETE FROM ADMIN WHERE admin_id=?";

		try {
			PreparedStatement ps = con.prepareStatement(query);

			ps.setInt(1, a.getAdminId());

			int res = ps.executeUpdate();

			if (res > 0) {
				System.out.println("Admin deleted successfully");
			} else {
				System.out.println("Admin not found");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}