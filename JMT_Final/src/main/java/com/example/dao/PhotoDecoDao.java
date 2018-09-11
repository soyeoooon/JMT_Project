package com.example.dao;

import java.util.List;

import com.example.model.PhotoDeco;

public interface PhotoDecoDao {
	public void insertPhotoDeco(PhotoDeco deco);
	public void updatePhotoDeco(PhotoDeco deco);
	public void deletePhotoDeco(PhotoDeco deco);
	public void deleteAllPhotoDeco(String p_imgname);
	public List<PhotoDeco> selectAllPhotoDeco(String p_imgname);
	public PhotoDeco selectOneDeco(PhotoDeco deco);
}
