package com.example.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.model.RestModify;
import com.example.service.MemberListService;
import com.example.service.ReportService;
import com.example.service.RestaurantService;

@Controller

public class AdminController {

	/*--------------------소연--------------------*/

	@Autowired
	private ReportService rService;

	@Autowired
	private RestaurantService restaurantService;
	
	@Autowired
	private MemberListService memberListService;

	@RequestMapping("/adminIndex")
	public void adminIndex(Model model) {
		model.addAttribute("restaurantCnt", restaurantService.getRestaurantCount());
		model.addAttribute("reportCnt",rService.getCountReport());
		model.addAttribute("memberCnt",memberListService.getCountMember());
	}

	@RequestMapping("/reportList")
	public void reportList() {

	}

	@RequestMapping("/getReportList")
	public @ResponseBody HashMap<String, Object> getReportList(@RequestParam(defaultValue = "1") int page) {

		return rService.getBoardListPage(page);
	}

	@RequestMapping("/chart")
	public void chart() {
	}

	@RequestMapping("/restaurantList")
	public void restaurantList(Model model, @RequestParam(required = false) String keyword) {
		model.addAttribute("keyword", keyword);

	}

	@RequestMapping("/getRestaurantList")
	public @ResponseBody HashMap<String, Object> getRestaurantList(@RequestParam(defaultValue = "1") int page,
			@RequestParam(required = false) String keyword) {
		return restaurantService.getBoardListPageAdminKeyword(page, keyword);
	}

	/*
	 * @RequestMapping("/getRestaurantListKeyword") public @ResponseBody
	 * HashMap<String, Object>
	 * getRestaurantListKeyword(@RequestParam(defaultValue="1") int
	 * page, @RequestParam(required=false) String keyword){ return
	 * restaurantService.getBoardListPageAdminKeyword(page, keyword); }
	 */

	@RequestMapping("/reportSubmit")
	public String reportSubmit(@RequestParam HashMap<String, Object> params) {
		
		//신고처리 페이지에서 신고처리할 목록의 신고번호와 음식점 번호를 받아온다
		
		//---주의! report에서의 rm_num은 음식점 번호 r_num이다!!! 기록테이블의 기본키가아님!!!!
		
		
		//음식점 번호를 신고페이지에서 가져옴.
		int rm_num = Integer.parseInt((String)params.get("rm_num"));
		System.out.println("음식점번호: "+rm_num);
		
		
		//음식점 기록 중 가장 최근 데이터(신고처리 받을)를 삭제한다.
		//여기서 getRm_num은 기록테이블의 기본키임.
		restaurantService.removeModify(restaurantService.getRestModify(rm_num).getRm_num());
		int upnum = Integer.parseInt((String) params.get("rep_num"));
		rService.UpdateReport(upnum);

		RestModify rm = restaurantService.getRestModify(rm_num);
		System.out.println(rm);
		
		if (rm != null) { //이전 기록이 있을때 (첫 기록이 아닌경우)
			restaurantService.updateRestaurnat(rm);
		}
		else { //첫 기록이 신고처리 해야되는 경우 -> 음식점 테이블에 있는 상세정보들을 지워버림 
			RestModify rm_null = new RestModify();
			rm_null.setRm_price("기록없음");
			rm_null.setRm_intro("기록없음");
			rm_null.setRm_enjoy("기록없음");
			rm_null.setRm_menu("기록없음");
			rm_null.setRm_rundate("기록없음");
			rm_null.setRm_runtime("기록없음");
			
			//음식점 몇번의 데이터를 업데이트 할건지
			rm_null.setR_num(rm_num);
			restaurantService.updateRestaurnat(rm_null);
			
			System.out.println("수정완료");
			
		}
		return "redirect:/reportList";
	}

	@RequestMapping("/reportCancel")
	public String reportCancel(@RequestParam HashMap<String, Object> params) {
		int upnum = Integer.parseInt((String) params.get("rep_num"));
		rService.UpdateReport(upnum);
		return "redirect:/reportList";

	}

}
