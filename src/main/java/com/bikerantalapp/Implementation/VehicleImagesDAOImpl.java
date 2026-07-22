package com.bikerantalapp.Implementation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bikerentalapp.DAO.VehicleImagesDAO;
import com.bikerentalapp.DTO.VehicleImage;
import com.bikerentalapp.utitly.Connector;

public class VehicleImagesDAOImpl implements VehicleImagesDAO {

	private Connection con;

	public VehicleImagesDAOImpl() {
		this.con = Connector.requestConnection();
	}

	// CREATE
	@Override
	public void registerImage(VehicleImage vi) {

		String query = "INSERT INTO VEHICLE_IMAGES VALUES(0,?,?)";

		try {
			PreparedStatement ps = con.prepareStatement(query);

			ps.setInt(1, vi.getVehicleId());
			ps.setString(2, vi.getPath());

			int res = ps.executeUpdate();

			if (res > 0) {
				System.out.println("Image registered successfully");
			} else {
				System.out.println("Image registration failed");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// READ BY ID
	@Override
	public VehicleImage findById(Integer imageId) {

		String query = "SELECT * FROM VEHICLE_IMAGES WHERE image_id=?";

		VehicleImage vi = null;

		try {
			PreparedStatement ps = con.prepareStatement(query);

			ps.setInt(1, imageId);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {

				vi = new VehicleImage();

				vi.setImageId(rs.getInt("image_id"));
				vi.setVehicleId(rs.getInt("vehicle_id"));
				vi.setPath(rs.getString("path"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return vi;
	}

	// READ ALL
	@Override
	public List<VehicleImage> findAll() {

		String query = "SELECT * FROM VEHICLE_IMAGES";

		List<VehicleImage> imageList = new ArrayList<>();

		try {
			PreparedStatement ps = con.prepareStatement(query);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				VehicleImage vi = new VehicleImage();

				vi.setImageId(rs.getInt("image_id"));
				vi.setVehicleId(rs.getInt("vehicle_id"));
				vi.setPath(rs.getString("path"));

				imageList.add(vi);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return imageList;
	}

	// UPDATE
	@Override
	public void updateImage(VehicleImage vi) {

		String query = "UPDATE VEHICLE_IMAGES "
				+ "SET vehicle_id=?, path=? "
				+ "WHERE image_id=?";

		try {
			PreparedStatement ps = con.prepareStatement(query);

			ps.setInt(1, vi.getVehicleId());
			ps.setString(2, vi.getPath());
			ps.setInt(3, vi.getImageId());

			int res = ps.executeUpdate();

			if (res > 0) {
				System.out.println("Image updated successfully");
			} else {
				System.out.println("Image not found");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// DELETE
	@Override
	public void deleteImage(VehicleImage vi) {

		String query = "DELETE FROM VEHICLE_IMAGES WHERE image_id=?";

		try {
			PreparedStatement ps = con.prepareStatement(query);

			ps.setInt(1, vi.getImageId());

			int res = ps.executeUpdate();

			if (res > 0) {
				System.out.println("Image deleted successfully");
			} else {
				System.out.println("Image not found");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}