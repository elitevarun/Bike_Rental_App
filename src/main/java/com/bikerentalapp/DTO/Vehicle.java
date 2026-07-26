package com.bikerentalapp.DTO;



public class Vehicle {
	private Integer vehicleId;
	private String vehicleType;
	private String model;
	private String registrationNo;
	private String fuelType;
	private Integer topSpeed;
	private Double pricePerDay;
	private Double depositFee;
	private Boolean available;
	private String imagePath;
	
	
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	public Integer getVehicleId() {
		return vehicleId;
	}
	public void setVehicleId(Integer vehicleId) {
		this.vehicleId = vehicleId;
	}
	public String getVehicleType() {
		return vehicleType;
	}
	public void setVehicleType(String vehicleType) {
		this.vehicleType = vehicleType;
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public String getRegistrationNo() {
		return registrationNo;
	}
	public void setRegistrationNo(String registrationNo) {
		this.registrationNo = registrationNo;
	}
	public String getFuelType() {
		return fuelType;
	}
	public void setFuelType(String fuelType) {
		this.fuelType = fuelType;
	}
	public Integer getTopSpeed() {
		return topSpeed;
	}
	public void setTopSpeed(Integer topSpeed) {
		this.topSpeed = topSpeed;
	}
	public Double getPricePerDay() {
		return pricePerDay;
	}
	public void setPricePerDay(Double pricePerDay) {
		this.pricePerDay = pricePerDay;
	}
	public Double getDepositFee() {
		return depositFee;
	}
	public void setDepositFee(Double depositFee) {
		this.depositFee = depositFee;
	}
	public Boolean getAvailable() {
		return available;
	}
	public void setAvailable(Boolean available) {
		this.available = available;
	}
	@Override
	public String toString() {
		return "Vehicle [vehicleId=" + vehicleId + ", vehicleType=" + vehicleType + ", model=" + model
				+ ", registrationNo=" + registrationNo + ", fuelType=" + fuelType + ", topSpeed=" + topSpeed
				+ ", pricePerDay=" + pricePerDay + ", depositFee=" + depositFee + ", available=" + available
				+ ", imagePath=" + imagePath + "]";
	}
	
	
	
}
