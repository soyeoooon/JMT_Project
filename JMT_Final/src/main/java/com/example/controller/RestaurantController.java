package com.example.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

import com.example.model.FriendList;
import com.example.model.MemberList;
import com.example.model.Restaurant;
import com.example.service.MemberListService;
import com.example.service.RestaurantService;

@Controller
public class RestaurantController {

	@Autowired
	private RestaurantService restaurantService;

	@Autowired
	private MemberListService memberListService;

	/*-------------------소연---------------------*/
	@RequestMapping("/search")
	public ModelAndView search(@RequestParam(required = false) String keyword, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("searchList", restaurantService.searchRestaurant(keyword));
		mav.addObject("keyword", keyword);
		mav.addObject("member", memberListService.getOneMember((String) session.getAttribute("email")));
		mav.setViewName("search");

		return mav;
	}

	@RequestMapping("/getSearchList")
	public @ResponseBody HashMap<String, Object> getSearchList(@RequestParam(required = false) String keyword,
			@RequestParam(defaultValue = "1") int page) {
		// return restaurantService.searchRestaurant(keyword);
		return restaurantService.getBoardListPage(page, keyword);
	}
	

	/*-------------------용화---------------------*/
	@RequestMapping("/RestaurantView")
	public String RastaurantView(Model model, @RequestParam(required = false) String r_name,
			@RequestParam(required = false) String r_address, HttpSession session) {
		// m_num 로그인한 Session값

		/* 소연 부분 수정 */
		String email = (String) session.getAttribute("email");
		MemberList ml = memberListService.getOneMember(email);
		System.out.println(email);
		int m_num = ml.getM_num();
		// int m_num=2;

		int r_num = restaurantService.selectOneRestaurant(r_name, r_address).getR_num();

		System.out.println(r_num);

		/* 소연 부분 수정 끝 */

		HashMap<String, String> map = new HashMap<String, String>();
		map.put("r_num", r_num + "");
		map.put("m_num", m_num + "");

		model.addAttribute("info", restaurantService.RestaurantSelect(map));
		model.addAttribute("login", m_num);
		model.addAttribute("email", restaurantService.MemberInfo(m_num));
		// email.m_num은 로그인 접속 정보

		/* 소연 부분 수정 */
		model.addAttribute("r_num", r_num);
		/* 소연 부분 수정 끝 */
		return "RestaurantView";
	}

	@RequestMapping("/like")
	public @ResponseBody HashMap<String, Object> like_update(@RequestParam HashMap<String, String> map) {
		return restaurantService.LikeUpdate(map);
	}

	@RequestMapping("/mark")
	public @ResponseBody HashMap<String, Object> mark(@RequestParam HashMap<String, String> map) {
		return restaurantService.MarkUpdate(map);
	}

	@RequestMapping("/grade")
	public @ResponseBody HashMap<String, Object> grade(@RequestParam HashMap<String, String> map) {
		return restaurantService.GradeUpdate(map);
	}

	@RequestMapping("/r_view_modify")
	public @ResponseBody Restaurant r_view_modify(@RequestParam HashMap<String, String> map, HttpServletRequest req,
			HttpServletResponse resp) {

		return restaurantService.RestaurantUpdate(map);
	}

	@RequestMapping("/r_view_report")
	public @ResponseBody Restaurant r_view_report(@RequestParam HashMap<String, String> map) {
		restaurantService.View_Report(map);
		return null;
	}

	@RequestMapping("/r_view_report_info")
	public @ResponseBody HashMap<String, Object> r_view_report_info(int r_num) {
		return restaurantService.ModifyMemberInfo(r_num);
	}

	@RequestMapping("/r_view_modify_info")
	public @ResponseBody Restaurant r_view_modify_info(int r_num) {
		return restaurantService.ModifyRestaurantInfo(r_num);
	}

	@RequestMapping("/r_view_user_info")
	public @ResponseBody HashMap<String, Object> r_view_user_info(int m_num, int email) {
		return restaurantService.OthersInfo(m_num, email);
	}

	@RequestMapping("/r_view_friendSend")
	public void r_view_friendSend(int req_mail, int resp_mail) {
		FriendList friend = new FriendList(req_mail, resp_mail, 0);
		restaurantService.FriendSend(friend);
	}

	@RequestMapping("/r_view_friendAccept")
	public void r_view_friendAccept(int req_mail, int resp_mail) {
		FriendList friend = new FriendList(req_mail, resp_mail, 1);
		restaurantService.FriendAccept(friend);
	}

	@RequestMapping("/fileUpload")
	public @ResponseBody List<String> fileUp(MultipartHttpServletRequest multi, int r_num, String r_photo)
			throws IOException {
		if (!r_photo.equals("img/No_Image.jpg")) {
			String dpath = "C:/Users/USER/Desktop/Dropbox/project_work/demo-3/target/classes/static/" + r_photo;
			File file = new File(dpath);
			file.delete();
		}

		// 저장 경로 설정
		String path = "C:/Users/USER/Desktop/Dropbox/project_work/demo-3/target/classes/static/img/" + r_num + "/top/";
		String newFileName = ""; // 업로드 되는 파일명

		File dir = new File(path);
		if (!dir.isDirectory()) {
			dir.mkdir();
		}

		Iterator<String> files = multi.getFileNames();
		while (files.hasNext()) {
			String uploadFile = files.next();

			MultipartFile mFile = multi.getFile(uploadFile);
			String fileName = mFile.getOriginalFilename();
			newFileName = System.currentTimeMillis() + "." + fileName.substring(fileName.lastIndexOf(".") + 1);

			try {
				mFile.transferTo(new File(path + newFileName));

			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return restaurantService.ImgList(r_num);
	}

	/*
	 * @RequestMapping("/Login") public String Login() { return "Login"; }
	 * 
	 * @RequestMapping("/Naver_Login") public String Naver_Login() { return
	 * "NaverLogin"; }
	 * 
	 * @RequestMapping("/naver_login_profile") public @ResponseBody Map<String,
	 * Object> naver_login_profile(String token) { String header = "Bearer " +
	 * token; // Bearer 다음에 공백 추가 try { String apiURL =
	 * "https://openapi.naver.com/v1/nid/me"; URL url = new URL(apiURL);
	 * HttpURLConnection con = (HttpURLConnection) url.openConnection();
	 * con.setRequestMethod("GET"); con.setRequestProperty("Authorization", header);
	 * int responseCode = con.getResponseCode(); BufferedReader br; if (responseCode
	 * == 200) { // 정상 호출 br = new BufferedReader(new
	 * InputStreamReader(con.getInputStream())); } else { // 에러 발생 br = new
	 * BufferedReader(new InputStreamReader(con.getErrorStream())); } String
	 * inputLine; StringBuffer response = new StringBuffer(); while ((inputLine =
	 * br.readLine()) != null) { response.append(inputLine); } br.close();
	 * System.out.println(response.toString()); Map<String, Object> map = new
	 * ObjectMapper().readValue(response.toString(), HashMap.class); return map; }
	 * catch (Exception e) { System.out.println(e); } return null; }
	 */

}
