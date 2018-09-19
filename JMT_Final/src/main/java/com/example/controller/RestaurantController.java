package com.example.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
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
import org.springframework.web.servlet.ModelAndView;

import com.example.model.BigCategory;
import com.example.model.FriendList;
import com.example.model.MemberList;
import com.example.model.MidCategory;
import com.example.model.Restaurant;
import com.example.service.BigCategoryService;
import com.example.service.DiaryService;
import com.example.service.MemberListService;
import com.example.service.MidCategoryService;
import com.example.service.PhotoDecoService;
import com.example.service.RestaurantService;

@Controller
public class RestaurantController {

	@Autowired
	private RestaurantService restaurantService;

	@Autowired
	private MemberListService memberListService;

	@Autowired
	private DiaryService diaryService;

	@Autowired
	private PhotoDecoService photoDecoService;

	@Autowired
	private BigCategoryService bigCategoryService;

	@Autowired
	private MidCategoryService midCategoryService;
	
	@RequestMapping("/testSearch")
    public @ResponseBody List<String> testSearch(String term){
       System.out.println(term);
       HashMap<String, String> map = new HashMap<String,String>();
       map.put("keyword", term);
        return restaurantService.getRestaurantName(map);
    }

	@RequestMapping("/saveImg")
	public @ResponseBody String saveImg(@RequestParam int r_num, @RequestParam String src) {
		restaurantService.updateResImg(r_num, src);
		return "변경되었습니다.";
	}

	@RequestMapping("/review_delete")
	public @ResponseBody int review_delete(int rev_num, int r_num) {
		return restaurantService.review_delete(rev_num, r_num);
	}

	@RequestMapping("/searchImage")
	public @ResponseBody String searchImage(@RequestParam(required = false) String search) {

		return restaurantService.searchImage(search);

	}

	// --------------------------------추가(v1)----------------------------------------
	// 파일업로드
	@RequestMapping("/review_write")
	public @ResponseBody int review_write(@RequestParam(value = "files", required = false) List<MultipartFile> multi,
			@RequestParam(value = "delfiles", required = false) List<String> delimg,
			@RequestParam(required = false) String rev_num, int r_num, int m_num, String textarea, double grade)
			throws IOException {
		return restaurantService.Review_Write(multi, delimg, rev_num, r_num, m_num, textarea, grade);
	}

	@RequestMapping("/review")
	public String editor(Model model, int r_num, @RequestParam(required = false) String rev_num, HttpSession session) {
		String email = (String) session.getAttribute("email");
		MemberList ml = memberListService.getOneMember(email);
		int m_num = ml.getM_num();
		// m_num 로그인한 Session값
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("r_num", r_num + "");
		map.put("m_num", m_num + "");
		model.addAttribute("info", restaurantService.RestaurantSelect(map));
		model.addAttribute("email", restaurantService.MemberInfo(m_num));
		if (rev_num != null) {
			model.addAttribute("review", restaurantService.ReviewInfo(rev_num));
		}
		return "Review";
	}

	public List<HashMap<String, Object>> getfoodNames(String r_name, String r_address) {
		List<HashMap<String, Object>> foodNames = new ArrayList<HashMap<String, Object>>();
		for (int diary_num : diaryService.getDiaryNumBySearch(r_name, r_address)) {
			for (String f_name : photoDecoService.getFoodNameByDiaryNum(diary_num)) {
				int size = foodNames.size();
				if (size == 0) {
					HashMap<String, Object> map = new HashMap<String, Object>();
					map.put("f_name", f_name);
					map.put("count", 1);
					foodNames.add(map);
				} else {
					if (foodNames.get(size - 1).get("f_name").equals(f_name)) {
						int newcount = (int) foodNames.get(size - 1).get("count") + 1;
						foodNames.get(size - 1).put("count", newcount);
					} else {
						HashMap<String, Object> map = new HashMap<String, Object>();
						map.put("f_name", f_name);
						map.put("count", 1);
						foodNames.add(map);
					}
				}
			}
		}
		return foodNames;
	}

	@RequestMapping("/getHashTag") // 3개만할거임
	public @ResponseBody List<String> getHashTag(@RequestParam String r_name, @RequestParam String r_address) {
		int index = 3;
		List<HashMap<String, Object>> foodNames = getfoodNames(r_name, r_address);
		List<String> temp = new ArrayList<String>();
		List<String> hashTag = new ArrayList<String>();
		HashMap<String, Object> map = new HashMap<String, Object>();
		for (int i = 0; i < foodNames.size(); i = 0) {
			for (int j = i + 1; j < foodNames.size(); j++) {
				i = (int) foodNames.get(i).get("count") > (int) foodNames.get(j).get("count") ? i : j;
			}
			temp.add((String) foodNames.get(i).get("f_name"));
			foodNames.remove(i);
		}
		if (temp.size() >= index) {
			for (int i = 0; i < index; i++) {
				hashTag.add(temp.get(i));
			}
		}
		return hashTag;
	}

	@RequestMapping("/select_save")
	public @ResponseBody String select_save(@RequestParam HashMap<String, String> map, HttpSession session) {
		System.out.println(map);
		String email = (String) session.getAttribute("email");
		MemberList ml = memberListService.getOneMember(email);
		restaurantService.evaluation_all_save(map, ml.getM_num());
		return null;
	}

	@RequestMapping("/searchRes")
	public @ResponseBody List<HashMap<String, Object>> searchRes(@RequestParam(required = false) String search,
			@RequestParam(required = false) String sigu, HttpSession session) {
		String email = (String) session.getAttribute("email");
		MemberList ml = memberListService.getOneMember(email);
		if (sigu.equals("시/도 구/군/동")) {
			System.out.println(sigu);
			return restaurantService.searchRestaurant(search, ml.getM_num());
		} else {
			System.out.println(sigu);
			return restaurantService.searchRestaurant(sigu + " " + search, ml.getM_num());
		}
	}

	@RequestMapping("/getBigCate")
	public @ResponseBody List<BigCategory> getBigCate() {
		return bigCategoryService.selectAllBigCategory();
	}

	@RequestMapping("/getMidCate")
	public @ResponseBody List<MidCategory> getMidCate(@RequestParam int big_num) {
		return midCategoryService.selectMidCategory(big_num);
	}
	// --------------------추가끝----------------------------

	// 수정(v2)
	/*-------------------소연---------------------*/
	@RequestMapping("/search")
	public ModelAndView search(@RequestParam(required = false) String keyword) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("searchList", restaurantService.searchRestaurant(keyword, 0));
		mav.addObject("keyword", keyword);
		mav.setViewName("search");

		return mav;
	}

	// 수정(v2)
	@RequestMapping("/getSearchList")
	public @ResponseBody HashMap<String, Object> getSearchList(@RequestParam(required = false) String keyword,
			@RequestParam(defaultValue = "1") int page) {
		// return restaurantService.searchRestaurant(keyword);
		return restaurantService.getBoardListPage(page, keyword, 0);
	}

	/*-------------------용화---------------------*/
	// 수정(v2)
	@RequestMapping("/RestaurantView")
	public String RastaurantView(Model model, @RequestParam(required = false) int r_num, HttpSession session) {
		// m_num 로그인한 Session값
		restaurantService.RestaurantCount(r_num);

		/* 소연 부분 수정 */
		String email = (String) session.getAttribute("email");
		MemberList ml = memberListService.getOneMember(email);
		int m_num = 0;
		if (ml != null) {
			m_num = ml.getM_num();
		}
		// int m_num=2;

		/* 소연 부분 수정 끝 */

		HashMap<String, String> map = new HashMap<String, String>();
		map.put("r_num", r_num + "");
		map.put("m_num", m_num + "");

		model.addAttribute("info", restaurantService.RestaurantSelect(map));
		model.addAttribute("email", restaurantService.MemberInfo(m_num));
		// email.m_num은 로그인 접속 정보
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
	public @ResponseBody int r_view_report(@RequestParam HashMap<String, String> map) {
		if (restaurantService.View_Report(map)) {
			return restaurantService.getReportCount(Integer.parseInt(map.get("rm_num").toString()));
		} else {
			return -1;
		}
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
