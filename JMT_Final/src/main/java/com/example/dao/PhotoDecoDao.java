package com.example.dao;

import java.util.List;

import com.example.model.PhotoDeco;

public interface PhotoDecoDao {
	//추가(v1)
		public List<String> getFoodNameByDiaryNum(int diary_num);
	/*--------------------성록--------------------*/
	public void insertPhotoDeco(PhotoDeco deco);
	public void updatePhotoDeco(PhotoDeco deco);
	public void deletePhotoDeco(PhotoDeco deco);
	public void deleteAllPhotoDeco(String p_imgname);
	public List<PhotoDeco> selectAllPhotoDeco(String p_imgname);
	public PhotoDeco selectOneDeco(PhotoDeco deco);
	
	public List<String> getAllFoodname();
}
