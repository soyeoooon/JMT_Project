package com.example.dao;

import java.util.List;

import com.example.model.Location;

public interface LocationDao {
	public void insertLocation();
	public void updateLocation();
	public void deleteLocation();
	public List<Location> selectAllLocation();
}
