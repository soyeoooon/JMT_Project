package com.example.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.service.MemberListService;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller

public class MemberController {

	@Autowired
	MemberListService memberListService;

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

	@RequestMapping("/login")
	public String login(@RequestParam HashMap<String, Object> params, HttpSession session, Model model) {

		if (memberListService.login(params) == 1) {
			session.setAttribute("email", (String) params.get("email"));
			if (((String) params.get("email")).equals("admin123@naver.com")) {
				return "redirect:/adminIndex";
			} else {
				return "redirect:/main";
			}
		} else if (memberListService.login(params) == 0) {
			return "redirect:/loginForm";
		} else {
			return "redirect:/loginForm";
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

	/*
	 * @RequestMapping("/selectForm") public ModelAndView selectForm(HttpSession
	 * session) { ModelAndView mav = new ModelAndView(); String email =
	 * (String)session.getAttribute("email"); if(email!=null) {
	 * mav.setViewName("selectForm"); return mav; } else {
	 * mav.setViewName("loginForm"); return mav; }
	 * 
	 * }
	 */

	@RequestMapping("/selectForm")
	public void selectForm() {
	}

	/*
	 * @Autowired DiaryService diaryService;
	 * 
	 * @Autowired EvaluationService evaluationService;
	 * 
	 * @Autowired FriendlistService friendListService;
	 * 
	 * @Autowired PhotoDecoService photoDecoService;
	 * 
	 * @Autowired RestaurantService restaurantService;
	 * 
	 * @Autowired EmailService emailService;
	 * 
	 * public String emailBySession(HttpSession session) { return (String)
	 * session.getAttribute("id"); }
	 * 
	 * public int emailNumBySession(HttpSession session) { return
	 * emailService.getEmailNum((String) session.getAttribute("id")); }
	 * 
	 * @RequestMapping("/") public String exex(HttpSession session) {
	 * session.setAttribute("id", "lokie@lok.com"); return "myPage"; }
	 * 
	 * @RequestMapping("/getFriendList") public @ResponseBody List<MemberList>
	 * getFriendList(HttpSession session) { return
	 * memberListService.selectOneMember(friendListService.
	 * selectApplyFriendListByEmail(emailNumBySession(session))); }
	 * 
	 * @RequestMapping("/searchRestaurant") public @ResponseBody List<Restaurant>
	 * searchRestaurant(@RequestParam String res_search) { return
	 * restaurantService.searchRestaurant(res_search); }
	 * 
	 * @RequestMapping("/deletePhotoDeco") public @ResponseBody String
	 * deletePhotoDeco(@RequestParam String p_imgname) {
	 * photoDecoService.deleteAllPhotoDeco(p_imgname); return "ok"; }
	 * 
	 * @RequestMapping("/givegrade") public @ResponseBody String
	 * givegrade(HttpSession session, @RequestParam String point, @RequestParam
	 * String place) { double e_grade = Double.parseDouble(point);
	 * evaluationService.setEforRByEmail(emailNumBySession(session),
	 * restaurantService.searchResNum(place), e_grade); return "myPage"; }
	 * 
	 * @RequestMapping("/howstar") public @ResponseBody double howstar(HttpSession
	 * session, @RequestParam String place) { return
	 * evaluationService.getEvaluationRestaurantByEmail(emailNumBySession(session),
	 * restaurantService.searchResNum(place)); }
	 * 
	 * @RequestMapping("/writePhotoDeco") public @ResponseBody String
	 * writePhotoDeco(@RequestParam int p_lat, @RequestParam int p_lon,
	 * 
	 * @RequestParam String p_imgname, @RequestParam(required = false) String
	 * p_foodname,
	 * 
	 * @RequestParam(required = false) String p_price, @RequestParam(required =
	 * false) String p_emo,
	 * 
	 * @RequestParam(required = false) String p_comment) { PhotoDeco deco = new
	 * PhotoDeco(); deco.setP_lat(p_lat); deco.setP_lon(p_lon);
	 * deco.setP_imgname(p_imgname); deco.setP_foodname(p_foodname);
	 * deco.setP_price(p_price); deco.setP_emo(p_emo); deco.setP_comment(p_comment);
	 * photoDecoService.insertPhotoDeco(deco); return "입력"; }
	 * 
	 * @RequestMapping("/updatePhotoDeco") public @ResponseBody String
	 * updatePhotoDeco(@RequestParam int p_lat, @RequestParam int p_lon,
	 * 
	 * @RequestParam String p_imgname, @RequestParam(required = false) String
	 * p_foodname,
	 * 
	 * @RequestParam(required = false) String p_price, @RequestParam(required =
	 * false) String p_emo,
	 * 
	 * @RequestParam(required = false) String p_comment) { PhotoDeco deco = new
	 * PhotoDeco(); deco.setP_lat(p_lat); deco.setP_lon(p_lon);
	 * deco.setP_imgname(p_imgname); deco.setP_foodname(p_foodname);
	 * deco.setP_price(p_price); deco.setP_emo(p_emo); deco.setP_comment(p_comment);
	 * photoDecoService.updatePhotoDeco(deco); return "수정"; }
	 * 
	 * @RequestMapping("/deleteImage") public @ResponseBody String
	 * deleteImage(@RequestParam String imageName){
	 * photoDecoService.deleteAllPhotoDeco(imageName); String path =
	 * System.getProperty("user.dir") + "/target/classes/static"+imageName; File
	 * deleteFile = new File(path); if(deleteFile.delete()){ return "삭제완료"; }else{
	 * return "삭제실패"; } }
	 * 
	 * @RequestMapping("/deleteDiary") public @ResponseBody String
	 * deleteDiary(@RequestParam int diaryNum){ diaryService.deleteDiary(diaryNum);
	 * return "삭제완료"; }
	 * 
	 * @RequestMapping("/readPhotoDeco") public @ResponseBody List<PhotoDeco>
	 * readPhotoDeco(@RequestParam String p_imgname) {
	 * 
	 * return photoDecoService.getPhotoDeco(p_imgname); }
	 * 
	 * @RequestMapping("/readDeco") public @ResponseBody PhotoDeco
	 * readDeco(@RequestParam String p_imgname, @RequestParam int p_lat,
	 * 
	 * @RequestParam int p_lon) { PhotoDeco deco = new PhotoDeco();
	 * deco.setP_lat(p_lat); deco.setP_lon(p_lon); deco.setP_imgname(p_imgname);
	 * return photoDecoService.getDeco(deco); }
	 * 
	 * String diaryNum = "";
	 * 
	 * @RequestMapping("/getDiaryNum") public @ResponseBody String
	 * getDiaryNum(@RequestParam String diary_num) { diaryNum = diary_num; return
	 * "ok"; }
	 * 
	 * @RequestMapping("/getFriendPhoto") public @ResponseBody String
	 * getFriendPhoto(@RequestParam String friendNumStr) { int friendNum =
	 * Integer.parseInt(friendNumStr); String friend_photo =
	 * memberListService.getFriendPhoto(friendNum); return friend_photo; }
	 * 
	 * @RequestMapping("/uploadDiaryImage") public @ResponseBody String
	 * uploadDiaryImage(MultipartHttpServletRequest multi) { // 저장 경로 설정 String path
	 * = System.getProperty("user.dir") + "/target/classes/static/diary/" + diaryNum
	 * + "/"; File dir = new File(path); if (!dir.isDirectory()) { dir.mkdir(); }
	 * Iterator<String> files = multi.getFileNames(); while (files.hasNext()) {
	 * String uploadFile = files.next(); MultipartFile mFile =
	 * multi.getFile(uploadFile); String fileName = mFile.getOriginalFilename();
	 * File file = new File(path + fileName); boolean fileExist = file.exists(); if
	 * (fileExist) { return "같은이름의 파일이 있습니다. 다시 저장해주세요"; } else { try {
	 * mFile.transferTo(new File(path + fileName)); } catch (Exception e) {
	 * e.printStackTrace(); } return "파일 업로드하였습니다."; } } return "ok"; }
	 * 
	 * @RequestMapping("/diaryImage") public @ResponseBody String
	 * diaryImage(HttpSession session, @RequestParam String diary_num) { String uri
	 * = System.getProperty("user.dir") + "/target/classes/static/diary/" +
	 * diary_num + "/"; // 상대경로로 // 바꿔야됨 // 안바꿔도되긴함 File folder = new File(uri);
	 * File[] filelist = folder.listFiles(); String result = ""; if (filelist !=
	 * null) { for (File file : filelist) { result += "/diary/" + diary_num + "/" +
	 * file.getName() + ","; } result += "/icons/plusBtn.png"; } else { result +=
	 * "/icons/plusBtn.png"; } return result; }
	 * 
	 * @RequestMapping("/myPage") // 첫번재 탭이자 기본 페이지 public ModelAndView
	 * myPage(HttpSession session) { ModelAndView mav = new ModelAndView();
	 * mav.addObject("member", myPageTab5(session)); mav.addObject("countLike",
	 * evaluationService.countEvaluationLikeByEmail(emailNumBySession(session)));
	 * mav.addObject("countMark",
	 * evaluationService.countEvaluationMarkByEmail(emailNumBySession(session)));
	 * mav.setViewName("myPage"); return mav; }
	 * 
	 * @RequestMapping("/myPageTab2Type1") // 두번째 탭 불러오기 public @ResponseBody
	 * List<Diary> myPageTab2(HttpSession session, @RequestParam(required = false)
	 * String diary_date) { return
	 * diaryService.selectAllDiaryByEmailandDate(emailNumBySession(session),
	 * diary_date); }
	 * 
	 * @RequestMapping("/selectDiary") public @ResponseBody HashMap<String,Object>
	 * selectDiary(@RequestParam int diary_num){ return
	 * diaryService.selectOneDiary(diary_num); }
	 * 
	 * @RequestMapping("/myPageTab2Type2") // 두번째 탭 불러오기 public @ResponseBody
	 * HashMap<String,Object> myPageTab2Type2(HttpSession session, @RequestParam
	 * (required=false)int readPage) { HashMap<String,Object> map = new
	 * HashMap<String,Object>(); map.put("diarylist",
	 * diaryService.selectAllDiaryByEmail(emailNumBySession(session),readPage));
	 * map.put("lastPage",
	 * diaryService.countAllDiaryByEmail(emailNumBySession(session))/10+1); return
	 * map; }
	 * 
	 * @RequestMapping("/writeDiary") // 두번째 탭 다이어리쓰기 public @ResponseBody String
	 * writeDiary(HttpSession session, @RequestParam(required = false) String
	 * res_search,
	 * 
	 * @RequestParam String diary_title, @RequestParam String
	 * diary_content, @RequestParam String diary_dateStr,
	 * 
	 * @RequestParam String diary_weather, @RequestParam(required = false) String
	 * diary_friends) { Diary diary = new Diary(); int r_num =
	 * restaurantService.searchResNum(res_search); String diary_path = "/diary/" +
	 * diaryService.getNextAI() + "/"; SimpleDateFormat tf = new
	 * SimpleDateFormat("yyyy-MM-dd"); Date diary_date = null; try { diary_date =
	 * tf.parse(diary_dateStr); } catch (ParseException e) { // TODO Auto-generated
	 * catch block e.printStackTrace(); } diary_date.setDate(diary_date.getDate() +
	 * 1); // utc 시간이라 그런가 저장할때 자꾸 하루 전으로 저장되어서 설정해줌 diary.setR_num(r_num);
	 * diary.setM_mail(emailNumBySession(session));
	 * diary.setDiary_title(diary_title); diary.setDiary_content(diary_content);
	 * diary.setDiary_date(diary_date); diary.setDiary_path(diary_path);
	 * diary.setDiary_weather(diary_weather); diary.setDiary_friends(diary_friends);
	 * diaryService.insertDiary(diary); return "성공"; }
	 * 
	 * @RequestMapping("/myPageTab3") // 세번째 탭 불러오기 public @ResponseBody
	 * List<Evaluation> myPageTab3(HttpSession session) { return
	 * evaluationService.selectAllEvaluationByEmail(emailNumBySession(session)); }
	 * 
	 * @RequestMapping("/myPageTab4") // 네번째 탭 불러오기 public @ResponseBody
	 * List<FriendList> myPageTab4(HttpSession session) { return
	 * friendListService.selectAllFriendListByEmail(emailNumBySession(session)); }
	 * 
	 * @RequestMapping("/myPageTab5") // 다섯번째 탭 불러오기 public @ResponseBody MemberList
	 * myPageTab5(HttpSession session) { return
	 * memberListService.selectOneMember(emailBySession(session)); }
	 */
}
