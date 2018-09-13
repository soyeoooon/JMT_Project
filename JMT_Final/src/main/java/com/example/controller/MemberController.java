package com.example.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.example.model.Diary;
import com.example.model.FriendList;
import com.example.model.MemberList;
import com.example.model.PhotoDeco;
import com.example.model.Restaurant;
import com.example.service.BigCategoryService;
import com.example.service.DiaryService;
import com.example.service.EmailService;
import com.example.service.EvaluationService;
import com.example.service.FriendlistService;
import com.example.service.MemberListService;
import com.example.service.PhotoDecoService;
import com.example.service.RestaurantService;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller

public class MemberController {

	@Autowired
	MemberListService memberListService;
	/*--------------------성록--------------------*/
	@Autowired
	DiaryService diaryService;

	@Autowired
	EvaluationService evaluationService;

	@Autowired
	FriendlistService friendListService;

	@Autowired
	PhotoDecoService photoDecoService;

	@Autowired
	RestaurantService restaurantService;

	@Autowired
	EmailService emailService;
	@Autowired
	BigCategoryService bigCategoryService;

	/* 소연 부분 수정 -> 세션 "id"를 "email"로 변경*/ 
	public String emailBySession(HttpSession session) {
		return (String) session.getAttribute("email");
	}

	public int emailNumBySession(HttpSession session) {
		return emailService.getEmailNum((String) session.getAttribute("email"));
	}
	
	/* 소연 부분 수정 끝*/ 

	public int getM_NumByEmailNum(int email_num) {
		return memberListService.getM_NumByEmailNum(email_num);
	}
	
	public String getEmailByEmailNum(int email_num) {
		return emailService.getEmailByNum(email_num);
	}
	
	@RequestMapping("/getEmailByNum")
	public @ResponseBody String getEmailByNum(int email_num){
		return getEmailByEmailNum(email_num);
	}
	@RequestMapping("/findFriend")
	public @ResponseBody List<MemberList> findFriend(HttpSession session,@RequestParam String search){
		List<MemberList> list = memberListService.getMemberListByNick(search);
		for(int email_num : emailService.getEmailBySearch(search)){
			list.add(memberListService.selectOneMemberListByNum(email_num));
		}
		for(int i=0;i<list.size();i++){
			if(list.get(i).getEmail_num()==emailNumBySession(session)){
				list.remove(i);
			}
		}
		for(int i=0;i<list.size();i++){
			for(int j=i+1;j<list.size();j++){
				if(list.get(i).getEmail_num()==list.get(j).getEmail_num()){
					list.remove(j);
				}
			}
		}
		return list;
	}
	
	@RequestMapping("/myPage") // 첫번재 탭이자 기본 페이지
	public ModelAndView myPage(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		//session.setAttribute("id", "lokie@lok.com"); // 나중에 삭제
		/* 소연 부분 수정 */
		session.getAttribute("email");
		/* 소연 부분 수정 끝*/
		
		mav.addObject("memberList", memberListService.selectOneMemberListByNum(getM_NumByEmailNum(emailNumBySession(session))));
		mav.addObject("countLike", evaluationService.countEvaluationLikeByNum(getM_NumByEmailNum(emailNumBySession(session))));
		mav.addObject("countMark", evaluationService.countEvaluationMarkByNum(getM_NumByEmailNum(emailNumBySession(session))));
		mav.addObject("countDiary", 0);
		mav.addObject("countReview", 0);
		mav.setViewName("myPage");
		return mav;
	}
	@RequestMapping("/myPageTab1")
	public @ResponseBody List<HashMap<String,Object>> myPageTab1(HttpSession session){
		List<HashMap<String,Object>> params = evaluationService.getRestaurantByEV(getM_NumByEmailNum(emailNumBySession(session)));
		List<String> cate = new ArrayList<String>();
		List<Double> grade = new ArrayList<Double>();
		List<HashMap<String,Object>> forchart1 = new ArrayList<HashMap<String,Object>>();
		for(int i = 0;i<bigCategoryService.selectAllBigCategory().size();i++){
			HashMap<String,Object> forchart = new HashMap<String,Object>();
			forchart.put("category", bigCategoryService.selectAllBigCategory().get(i).getBig_name());
			forchart1.add(forchart);
		}
		for(int j=0;j<forchart1.size();j++){
			for(int i=0;i<params.size();i++){
				if(params.get(i).get("r_category1").equals(forchart1.get(j).get("category"))){
					if(forchart1.get(j).get("count")==null){
						forchart1.get(j).put("count", 1);
						forchart1.get(j).put("grade", params.get(i).get("e_grade"));
					}else{
						forchart1.get(j).put("count", (int)forchart1.get(j).get("count")+1);
						forchart1.get(j).put("grade", (double)forchart1.get(j).get("grade") + (double)params.get(i).get("e_grade"));
					}
				}
			}
		}
		for(int i =0;i<forchart1.size();i++){
			if(forchart1.get(i).get("count")==null){
				forchart1.remove(i);
			}
		}
		List<HashMap<String,Object>> map = new ArrayList<HashMap<String,Object>>();
		for(int i =0;i<forchart1.size();i=0){
			for(int j =i+1;j<forchart1.size();j++){
				i = (int)forchart1.get(i).get("count")>(int)forchart1.get(j).get("count")?i:j;
			}
			map.add(forchart1.get(i));
			forchart1.remove(i);
		}
		return map;
	}
	@RequestMapping("/getCountList")
	public @ResponseBody HashMap<String,Integer> getCountList(@RequestParam int email_num){
		HashMap<String,Integer> map = new HashMap<String,Integer>();
		int countList = evaluationService.countEvaluationLikeByNum(getM_NumByEmailNum(email_num));
		int countMark = evaluationService.countEvaluationMarkByNum(getM_NumByEmailNum(email_num));
		map.put("countLike", countList);
		map.put("countMark", countMark);
		map.put("countDiary", 0); // 수정
		map.put("countReview", 0);
		return map;
	}

	@RequestMapping("/updateID")
	public @ResponseBody String updateID(HttpSession session, @RequestParam String m_nick, @RequestParam String m_pwd) {
		memberListService.updateMemberlist(emailNumBySession(session), m_nick, m_pwd);
		return "변경되었습니다.";
	}

	@RequestMapping("/restaurantPhoto")
	public @ResponseBody boolean restaurantPhoto(@RequestParam int r_num) {
		String path = System.getProperty("user.dir") + "/target/classes/static/restaurant/" + r_num + ".jpg";
		File file = new File(path);
		return file.exists();
	}

	@RequestMapping("/getFriendList")
	public @ResponseBody List<MemberList> getFriendList(HttpSession session) {
		return memberListService
				.selectOneMember(friendListService.selectApplyFriendListByEmail(emailNumBySession(session)));
	}

	@RequestMapping("/applyFriend")
	public @ResponseBody String applyFriend(HttpSession session, @RequestParam int email_num) {
		friendListService.updateFriend(email_num, emailNumBySession(session));
		return "수락되었습니다.";
	}

	@RequestMapping("/deleteFriend")
	public @ResponseBody String deleteFriend(HttpSession session, @RequestParam int email_num) {
		friendListService.deleteFriend(email_num, emailNumBySession(session));
		return "삭제되었습니다.";
	}

	@RequestMapping("/getReqFriendList")
	public @ResponseBody List<MemberList> getReqFriendList(HttpSession session) {
		return memberListService
				.selectOneMember(friendListService.selectReqFriendListByEmail(emailNumBySession(session)));
	}

	@RequestMapping("/searchRestaurant")
	public @ResponseBody List<HashMap<String, Object>> searchRestaurant(@RequestParam String res_search, HttpSession session) {
		String email = (String) session.getAttribute("email");
		MemberList ml = memberListService.getOneMember(email);
		return restaurantService.searchRestaurant(res_search,ml.getM_num());
	}

	@RequestMapping("/deletePhotoDeco")
	public @ResponseBody String deletePhotoDeco(@RequestParam String p_imgname) {
		photoDecoService.deleteAllPhotoDeco(p_imgname);
		return "ok";
	}

	@RequestMapping("/givegrade")
	public @ResponseBody String givegrade(HttpSession session, @RequestParam String point, @RequestParam String place) {
		double e_grade = Double.parseDouble(point);
		evaluationService.setEforRByEmail(emailNumBySession(session), restaurantService.searchResNum(place), e_grade);
		return "myPage";
	}

	@RequestMapping("/howstar")
	public @ResponseBody double howstar(HttpSession session, @RequestParam String place) {
		return evaluationService.getEvaluationRestaurantByEmail(emailNumBySession(session),
				restaurantService.searchResNum(place));
	}

	@RequestMapping("/writePhotoDeco")
	public @ResponseBody String writePhotoDeco(@RequestParam int p_lat, @RequestParam int p_lon,
			@RequestParam String p_imgname, @RequestParam(required = false) String p_foodname,
			@RequestParam(required = false) String p_price, @RequestParam(required = false) String p_emo,
			@RequestParam(required = false) String p_comment) {
		PhotoDeco deco = new PhotoDeco();
		deco.setP_lat(p_lat);
		deco.setP_lon(p_lon);
		deco.setP_imgname(p_imgname);
		deco.setP_foodname(p_foodname);
		deco.setP_price(p_price);
		deco.setP_emo(p_emo);
		deco.setP_comment(p_comment);
		photoDecoService.insertPhotoDeco(deco);
		return "입력";
	}

	@RequestMapping("/updatePhotoDeco")
	public @ResponseBody String updatePhotoDeco(@RequestParam int p_lat, @RequestParam int p_lon,
			@RequestParam String p_imgname, @RequestParam(required = false) String p_foodname,
			@RequestParam(required = false) String p_price, @RequestParam(required = false) String p_emo,
			@RequestParam(required = false) String p_comment) {
		PhotoDeco deco = new PhotoDeco();
		deco.setP_lat(p_lat);
		deco.setP_lon(p_lon);
		deco.setP_imgname(p_imgname);
		deco.setP_foodname(p_foodname);
		deco.setP_price(p_price);
		deco.setP_emo(p_emo);
		deco.setP_comment(p_comment);
		photoDecoService.updatePhotoDeco(deco);
		return "수정";
	}

	@RequestMapping("/deleteImage")
	public @ResponseBody String deleteImage(@RequestParam String imageName) {
		photoDecoService.deleteAllPhotoDeco(imageName);
		String path = System.getProperty("user.dir") + "/target/classes/static" + imageName;
		File deleteFile = new File(path);
		if (deleteFile.delete()) {
			return "삭제완료";
		} else {
			return "삭제실패";
		}
	}

	@RequestMapping("/deleteDiary")
	public @ResponseBody String deleteDiary(@RequestParam int diaryNum) {
		diaryService.deleteDiary(diaryNum);
		return "삭제완료";
	}

	@RequestMapping("/readPhotoDeco")
	public @ResponseBody List<PhotoDeco> readPhotoDeco(@RequestParam String p_imgname) {
		return photoDecoService.getPhotoDeco(p_imgname);
	}

	@RequestMapping("/readDeco")
	public @ResponseBody PhotoDeco readDeco(@RequestParam String p_imgname, @RequestParam String p_lat,
			@RequestParam String p_lon) {
		PhotoDeco deco = new PhotoDeco();
		deco.setP_lat(Integer.parseInt(p_lat));
		deco.setP_lon(Integer.parseInt(p_lon));
		deco.setP_imgname(p_imgname);
		return photoDecoService.getDeco(deco);
	}

	String diaryNum = "";

	@RequestMapping("/getDiaryNum")
	public @ResponseBody String getDiaryNum(@RequestParam String diary_num) {
		diaryNum = diary_num;
		return "ok";
	}

	@RequestMapping("/getFriendPhoto")
	public @ResponseBody String getFriendPhoto(@RequestParam String friendNumStr) {
		int friendNum = Integer.parseInt(friendNumStr);
		String friend_photo = memberListService.getFriendPhoto(friendNum);
		return friend_photo;
	}

	@RequestMapping("/updateIntro")
	public @ResponseBody String updateIntro(HttpSession session, @RequestParam String m_intro) {
		memberListService.updateIntro(emailNumBySession(session), m_intro);
		return "인트로업데이트";
	}

	@RequestMapping("/uploadDiaryImage")
	public @ResponseBody String uploadDiaryImage(MultipartHttpServletRequest multi) {
		// 저장 경로 설정
		String path = System.getProperty("user.dir") + "/target/classes/static/diary/" + diaryNum + "/";
		File dir = new File(path);
		if (!dir.isDirectory()) {
			dir.mkdir();
		}
		Iterator<String> files = multi.getFileNames();
		while (files.hasNext()) {
			String uploadFile = files.next();
			MultipartFile mFile = multi.getFile(uploadFile);
			String fileName = mFile.getOriginalFilename();
			File file = new File(path + fileName);
			boolean fileExist = file.exists();
			if (fileExist) {
				return "같은이름의 파일이 있습니다. 다시 저장해주세요";
			} else {
				try {
					mFile.transferTo(new File(path + fileName));
				} catch (Exception e) {
					e.printStackTrace();
				}
				return "파일 업로드하였습니다.";
			}
		}
		return "ok";
	}
	@RequestMapping("/isFriend")
	public @ResponseBody int isFriend(HttpSession session, int email_num){
		return friendListService.isFriend(emailNumBySession(session), email_num);
	}
	
	@RequestMapping("/sendApplyFriend")
	public @ResponseBody String sendApplyFriend(HttpSession session, int email_num){
		friendListService.insertFriendList(emailNumBySession(session), email_num);
		return "신청되었습니다.";
	}
	
	@RequestMapping("/uploadProfileImage")
	public @ResponseBody String uploadProfileImage(MultipartHttpServletRequest multi, HttpSession session) {
		// 저장 경로 설정
		String result = "";
		if (multi != null) {
			String path = System.getProperty("user.dir") + "/target/classes/static/member/" + session.getAttribute("id")
					+ "/";
			File dir = new File(path);
			if (!dir.isDirectory()) {
				dir.mkdir();
			}
			Iterator<String> files = multi.getFileNames();

			while (files.hasNext()) {
				String uploadFile = files.next();
				MultipartFile mFile = multi.getFile(uploadFile);
				String fileName = mFile.getOriginalFilename();
				File file = new File(path + fileName);
				boolean fileExist = file.exists();
				if (fileExist) {
					result = "같은이름의 파일이 있습니다. 다시 저장해주세요";
				} else {
					try {
						mFile.transferTo(new File(path + "profilephoto.jpg"));
					} catch (Exception e) {
						e.printStackTrace();
					}
					result = "파일 업로드하였습니다.";
				}
			}
		} else {
			result = "이미지없음";
		}
		return result;
	}

	@RequestMapping("/diaryImage")
	public @ResponseBody String diaryImage(HttpSession session, @RequestParam String diary_num) {
		String uri = System.getProperty("user.dir") + "/target/classes/static/diary/" + diary_num + "/";
		File folder = new File(uri);
		File[] filelist = folder.listFiles();
		String result = "";
		if (filelist != null) {
			for (File file : filelist) {
				result += "/diary/" + diary_num + "/" + file.getName() + ",";
			}
			result += "/icons/plusBtn.png";
		} else {
			result += "/icons/plusBtn.png";
		}
		return result;
	}

	@RequestMapping("/getGrade")
	public @ResponseBody double getGrade(@RequestParam int r_num) {
		return evaluationService.getGrade(r_num);
	}

	@RequestMapping("/myPageTab2Type1") // 두번째 탭 불러오기
	public @ResponseBody List<Diary> myPageTab2(HttpSession session,
			@RequestParam(required = false) String diary_date) {
		return diaryService.selectAllDiaryByEmailandDate(emailNumBySession(session), diary_date);
	}

	@RequestMapping("/selectDiary")
	public @ResponseBody HashMap<String, Object> selectDiary(@RequestParam int diary_num) {
		return diaryService.selectOneDiary(diary_num);
	}

	@RequestMapping("/myPageTab2Type2") // 두번째 탭 불러오기
	public @ResponseBody HashMap<String, Object> myPageTab2Type2(HttpSession session,
			@RequestParam(required = false) int readPage) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("diarylist", diaryService.selectAllDiaryByEmail(emailNumBySession(session), readPage));
		map.put("lastPage", diaryService.countAllDiaryByEmail(emailNumBySession(session)) / 10 + 1);
		return map;
	}

	@RequestMapping("/writeDiary") // 두번째 탭 다이어리쓰기
	public @ResponseBody String writeDiary(HttpSession session, @RequestParam(required = false) String res_search,
			@RequestParam String diary_title, @RequestParam String diary_content, @RequestParam String diary_dateStr,
			@RequestParam String diary_weather, @RequestParam(required = false) String diary_friends) {
		Diary diary = new Diary();
		int r_num = restaurantService.searchResNum(res_search);
		String diary_path = "/diary/" + diaryService.getNextAI() + "/";
		SimpleDateFormat tf = new SimpleDateFormat("yyyy-MM-dd");
		Date diary_date = null;
		try {
			diary_date = tf.parse(diary_dateStr);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		diary_date.setDate(diary_date.getDate() + 1); // utc 시간이라 그런가 저장할때 자꾸 하루
														// 전으로 저장되어서 설정해줌
		diary.setR_num(r_num);
		diary.setM_mail(emailNumBySession(session));
		diary.setDiary_title(diary_title);
		diary.setDiary_content(diary_content);
		diary.setDiary_date(diary_date);
		diary.setDiary_path(diary_path);
		diary.setDiary_weather(diary_weather);
		diary.setDiary_friends(diary_friends);
		diaryService.insertDiary(diary);
		return "성공";
	}

	@RequestMapping("/myPageTab3") // 세번째 탭 불러오기
	public @ResponseBody List<HashMap<String, Object>> myPageTab3(HttpSession session,String like,String mark) {
		if(like.equals("/icons/like.png")&&mark.equals("/icons/star.png"))
			return restaurantService.getRestaurantByLikeandMark(getM_NumByEmailNum(emailNumBySession(session)));
		else if(like.equals("/icons/like.png"))
			return restaurantService.getRestaurantByLike(getM_NumByEmailNum(emailNumBySession(session)));
		else if(mark.equals("/icons/star.png"))
			return restaurantService.getRestaurantByMark(getM_NumByEmailNum(emailNumBySession(session)));
		else
			return null;
	}

	@RequestMapping("/myPageTab4") // 네번째 탭 불러오기
	public @ResponseBody List<FriendList> myPageTab4(HttpSession session) {
		return friendListService.selectAllFriendListByEmail(emailNumBySession(session));
	}

	@RequestMapping("/myPageTab5") // 다섯번째 탭 불러오기
	public @ResponseBody MemberList myPageTab5(HttpSession session) {
		return memberListService.selectOneMemberListByNum(emailNumBySession(session));
	}

	@RequestMapping("/getMemberList") // 다섯번째 탭 불러오기
	public @ResponseBody MemberList getMemberList(int email_num) {
		return memberListService.selectOneMemberListByNum(email_num);
	}
	
	@RequestMapping("/getLikeList")
	public @ResponseBody List<HashMap<String,Object>> getLikeList(@RequestParam int email_num){
		return restaurantService.getRestaurantByLike(getM_NumByEmailNum(email_num));
	}
	@RequestMapping("/getMarkList")
	public @ResponseBody List<HashMap<String,Object>> getMarkList(int email_num){
		return restaurantService.getRestaurantByMark(getM_NumByEmailNum(email_num));
	}
	
	@RequestMapping("/wordcloud")
	   public @ResponseBody List<HashMap<String,Object>> wordcloud(){
	      List<HashMap<String,Object>> wordcloud = new ArrayList<HashMap<String,Object>>();
	      List<String> foodNames = photoDecoService.getAllFoodname();
	      HashMap<String,Object> map = new HashMap<String,Object>();
	      map.put("word", foodNames.get(0));
	      map.put("weight", 1);
	      wordcloud.add(map);
	      
	      for(int i=1;i<foodNames.size();i++){
	         if(foodNames.get(i).equals(wordcloud.get(wordcloud.size()-1).get("word"))){
	            int newcount = (int)wordcloud.get(wordcloud.size()-1).get("weight")+1;
	            wordcloud.get(wordcloud.size()-1).put("weight", newcount);
	         }else{
	            HashMap<String,Object> map2 = new HashMap<String,Object>();
	            map2.put("word", foodNames.get(i));
	            map2.put("weight", 1);
	            wordcloud.add(map2);
	         }
	      }
	      return wordcloud;
	   }

	

	/*--------------------소연--------------------*/
	@RequestMapping("/joinForm")
	public void joinForm() {
	}

	@RequestMapping("/main")
	public ModelAndView main(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("member", memberListService.getOneMember((String) session.getAttribute("email")));
		mav.setViewName("main");

		return mav;
	}

	@RequestMapping("/join")
	public String join(@RequestParam HashMap<String, Object> params, HttpSession session) {
		if (memberListService.join(params) == 1) {
			session.setAttribute("email", (String) params.get("email"));
			return "redirect:/selectForm";
		}
		return "redirect:/joinForm";
	}

	@RequestMapping("/loginForm")
	public void loginForm() {
	}

	// 성록 일부수정
		@RequestMapping("/login")
		public @ResponseBody String login(@RequestParam String email, @RequestParam String password, HttpSession session,
				Model model) {
			HashMap<String, Object> params = new HashMap<String, Object>();
			params.put("email", email);
			params.put("pwd", password);
			if (memberListService.login(params) == 1) {
				session.setAttribute("email", email);
				if (email.equals("admin123@naver.com")) {
					return "adminIndex";
				} else {
					return "main";
				}
			} else if (memberListService.login(params) == 0) {
				return "loginForm";
			} else {
				return "loginForm";
			}
		}
	/*
	 * @RequestMapping("/Login") public String Login() { return "Login"; }
	 */

	@RequestMapping("/Naver_Login")
	public String Naver_Login() {
		return "NaverLogin";
	}

	@RequestMapping("/naver_login_profile")
	public @ResponseBody Map<String, Object> naver_login_profile(String token) {
		String header = "Bearer " + token; // Bearer 다음에 공백 추가
		try {
			String apiURL = "https://openapi.naver.com/v1/nid/me";
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("Authorization", header);
			int responseCode = con.getResponseCode();
			BufferedReader br;
			if (responseCode == 200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else { // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;
			StringBuffer response = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				response.append(inputLine);
			}
			br.close();
			System.out.println(response.toString());
			Map<String, Object> map = new ObjectMapper().readValue(response.toString(), HashMap.class);
			return map;
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("email");
		return "redirect:/main";

	}


	@RequestMapping("/selectForm")
	public void selectForm() {
	}

	
}
