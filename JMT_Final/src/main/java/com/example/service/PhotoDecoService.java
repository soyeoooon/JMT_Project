package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.PhotoDecoDao;
import com.example.model.PhotoDeco;

@Service
public class PhotoDecoService {
	/*--------------------성록--------------------*/
	@Autowired
	PhotoDecoDao photoDecoDao;
	
	//수정(v1)
		public List<String> getFoodNameByDiaryNum(int diary_num){
	      return photoDecoDao.getFoodNameByDiaryNum(diary_num);
	   }
	
	public void insertPhotoDeco(PhotoDeco deco){
		photoDecoDao.insertPhotoDeco(deco);
	}
	public void updatePhotoDeco(PhotoDeco deco){
		photoDecoDao.updatePhotoDeco(deco);
	}
	public List<PhotoDeco> getPhotoDeco(String p_imgname){
		return photoDecoDao.selectAllPhotoDeco(p_imgname);
	}
	public PhotoDeco getDeco(PhotoDeco deco){
		return photoDecoDao.selectOneDeco(deco);
	}
	public void deleteAllPhotoDeco(String p_imgname){
		photoDecoDao.deleteAllPhotoDeco(p_imgname);
	}
	
	public List<String> getAllFoodname(){
	      return photoDecoDao.getAllFoodname();
	   }
}
