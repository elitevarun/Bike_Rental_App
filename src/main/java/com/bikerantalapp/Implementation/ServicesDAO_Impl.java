package com.bikerantalapp.Implementation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bikerentalapp.DAO.ServicesDAO;
import com.bikerentalapp.DTO.Service;
import com.bikerentalapp.utitly.Connector;

public class ServicesDAO_Impl implements ServicesDAO {

	private Connection con;

	public ServicesDAO_Impl() {
		this.con = Connector.requestConnection();
	}

	@Override
	public void registerService(Service s) {

		String query = "INSERT INTO SERVICE VALUES(0,?,?,?,?,?,?)";

		try {
			PreparedStatement ps = con.prepareStatement(query);

			ps.setInt(1, s.getVehicleId());
			ps.setDate(2, s.getService_date());
			ps.setString(3, s.getServiceType());
			ps.setBigDecimal(4, s.getServiceCost());
			ps.setString(5, s.getRemarks());
			ps.setDate(6, s.getNextServiceDate());

			int res = ps.executeUpdate();

			if (res > 0) {
				System.out.println("Service added successfully");
			} else {
				System.out.println("Service not added");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public Service findById(Integer serviceId) {

		String query = "SELECT * FROM SERVICE WHERE service_id=?";

		Service s = null;

		try {
			PreparedStatement ps = con.prepareStatement(query);

			ps.setInt(1, serviceId);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {

				s = new Service();

				s.setServiceId(rs.getInt("service_id"));
				s.setVehicleId(rs.getInt("vehicle_id"));
				s.setService_date(rs.getDate("service_date"));
				s.setServiceType(rs.getString("service_type"));
				s.setServiceCost(rs.getBigDecimal("service_cost"));
				s.setRemarks(rs.getString("remarks"));
				s.setNextServiceDate(rs.getDate("next_service_date"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return s;
	}

	@Override
	public List<Service> findAll() {

		String query = "SELECT * FROM SERVICE";

		List<Service> list = new ArrayList<>();

		try {
			PreparedStatement ps = con.prepareStatement(query);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				Service s = new Service();

				s.setServiceId(rs.getInt("service_id"));
				s.setVehicleId(rs.getInt("vehicle_id"));
				s.setService_date(rs.getDate("service_date"));
				s.setServiceType(rs.getString("service_type"));
				s.setServiceCost(rs.getBigDecimal("service_cost"));
				s.setRemarks(rs.getString("remarks"));
				s.setNextServiceDate(rs.getDate("next_service_date"));

				list.add(s);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public void updateService(Service s) {

		String query = "UPDATE SERVICE SET vehicle_id=?, service_date=?, "
				+ "service_type=?, service_cost=?, remarks=?, next_service_date=? "
				+ "WHERE service_id=?";

		try {
			PreparedStatement ps = con.prepareStatement(query);

			ps.setInt(1, s.getVehicleId());
			ps.setDate(2, s.getService_date());
			ps.setString(3, s.getServiceType());
			ps.setBigDecimal(4, s.getServiceCost());
			ps.setString(5, s.getRemarks());
			ps.setDate(6, s.getNextServiceDate());
			ps.setInt(7, s.getServiceId());

			int res = ps.executeUpdate();

			if (res > 0) {
				System.out.println("Service updated successfully");
			} else {
				System.out.println("Service not found");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteService(Service s) {

		String query = "DELETE FROM SERVICE WHERE service_id=?";

		try {
			PreparedStatement ps = con.prepareStatement(query);

			ps.setInt(1, s.getServiceId());

			int res = ps.executeUpdate();

			if (res > 0) {
				System.out.println("Service deleted successfully");
			} else {
				System.out.println("Service not found");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}