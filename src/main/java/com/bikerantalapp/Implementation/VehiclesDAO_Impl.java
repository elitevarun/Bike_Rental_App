package com.bikerantalapp.Implementation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bikerentalapp.DAO.VehiclesDAO;
import com.bikerentalapp.DTO.Vehicle;
import com.bikerentalapp.utitly.Connector;

public class VehiclesDAO_Impl implements VehiclesDAO {

	private Connection con;

	public VehiclesDAO_Impl() {
		this.con = Connector.requestConnection();
	}

	// CREATE
	@Override
	public void registerVehicle(Vehicle v) {

		String query = "INSERT INTO VEHICLES VALUES(0,?,?,?,?,?,?,?,?)";

		try {
			PreparedStatement ps = con.prepareStatement(query);

			ps.setString(1, v.getVehicleType());
			ps.setString(2, v.getModel());
			ps.setString(3, v.getRegistrationNo());
			ps.setString(4, v.getFuelType());
			ps.setInt(5, v.getTopSpeed());
			ps.setBigDecimal(6, v.getPricePerDay());
			ps.setBigDecimal(7, v.getDepositFee());
			ps.setBoolean(8, v.getAvailable());

			int res = ps.executeUpdate();

			if (res > 0) {
				System.out.println("Vehicle registered successfully");
			} else {
				System.out.println("Vehicle registration failed");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// READ BY ID
	@Override
	public Vehicle findById(Integer vehicleId) {

		String query = "SELECT * FROM VEHICLES WHERE vehicle_id=?";

		Vehicle v = null;

		try {
			PreparedStatement ps = con.prepareStatement(query);

			ps.setInt(1, vehicleId);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {

				v = new Vehicle();

				v.setVehicleId(rs.getInt("vehicle_id"));
				v.setVehicleType(rs.getString("vehicle_type"));
				v.setModel(rs.getString("model"));
				v.setRegistrationNo(rs.getString("registration_no"));
				v.setFuelType(rs.getString("fuel_type"));
				v.setTopSpeed(rs.getInt("top_speed"));
				v.setPricePerDay(rs.getBigDecimal("price_per_day"));
				v.setDepositFee(rs.getBigDecimal("deposit_fee"));
				v.setAvailable(rs.getBoolean("available"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return v;
	}

	// READ ALL
	@Override
	public List<Vehicle> findAll() {

		String query = "SELECT * FROM VEHICLES";

		List<Vehicle> vehicleList = new ArrayList<>();

		try {
			PreparedStatement ps = con.prepareStatement(query);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				Vehicle v = new Vehicle();

				v.setVehicleId(rs.getInt("vehicle_id"));
				v.setVehicleType(rs.getString("vehicle_type"));
				v.setModel(rs.getString("model"));
				v.setRegistrationNo(rs.getString("registration_no"));
				v.setFuelType(rs.getString("fuel_type"));
				v.setTopSpeed(rs.getInt("top_speed"));
				v.setPricePerDay(rs.getBigDecimal("price_per_day"));
				v.setDepositFee(rs.getBigDecimal("deposit_fee"));
				v.setAvailable(rs.getBoolean("available"));

				vehicleList.add(v);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return vehicleList;
	}

	// UPDATE
	@Override
	public void updateVehicle(Vehicle v) {

		String query = "UPDATE VEHICLES SET vehicle_type=?, model=?, "
				+ "registration_no=?, fuel_type=?, top_speed=?, "
				+ "price_per_day=?, deposit_fee=?, available=? "
				+ "WHERE vehicle_id=?";

		try {
			PreparedStatement ps = con.prepareStatement(query);

			ps.setString(1, v.getVehicleType());
			ps.setString(2, v.getModel());
			ps.setString(3, v.getRegistrationNo());
			ps.setString(4, v.getFuelType());
			ps.setInt(5, v.getTopSpeed());
			ps.setBigDecimal(6, v.getPricePerDay());
			ps.setBigDecimal(7, v.getDepositFee());
			ps.setBoolean(8, v.getAvailable());

			ps.setInt(9, v.getVehicleId());

			int res = ps.executeUpdate();

			if (res > 0) {
				System.out.println("Vehicle updated successfully");
			} else {
				System.out.println("Vehicle not found");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// DELETE
	@Override
	public void deleteVehicle(Vehicle v) {

		String query = "DELETE FROM VEHICLES WHERE vehicle_id=?";

		try {
			PreparedStatement ps = con.prepareStatement(query);

			ps.setInt(1, v.getVehicleId());

			int res = ps.executeUpdate();

			if (res > 0) {
				System.out.println("Vehicle deleted successfully");
			} else {
				System.out.println("Vehicle not found");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}