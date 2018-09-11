package com.example.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.model.RestModify;
import com.example.service.ReportService;
import com.example.service.RestaurantService;

@Controller

public class AdminController {
	
	/*--------------------소연--------------------*/

	@Autowired
	private ReportService rService;
	
	@Autowired
	private RestaurantService restaurantService;

	@RequestMapping("/adminIndex")
	public void adminIndex() {
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
	public void restaurantList(Model model, @RequestParam(required=false) String keyword) {
		model.addAttribute("keyword", keyword);
		
	}
	
	@RequestMapping("/getRestaurantList")
	public @ResponseBody HashMap<String, Object> getRestaurantList(@RequestParam(defaultValue="1") int page, @RequestParam(required=false) String keyword){
		return restaurantService.getBoardListPageAdminKeyword(page,keyword);
	}
	
	/*@RequestMapping("/getRestaurantListKeyword")
	public @ResponseBody HashMap<String, Object> getRestaurantListKeyword(@RequestParam(defaultValue="1") int page, @RequestParam(required=false) String keyword){
		return restaurantService.getBoardListPageAdminKeyword(page, keyword);
	}*/
	
	@RequestMapping("/reportSubmit")
	public String reportSubmit(@RequestParam int rep_num, String rm_name) {
		
		/*RestModify rest = restaurantService.getRestModify(rm_name);
		System.out.println(rest);*/
		restaurantService.removeModify(restaurantService.getRestModify(rm_name).getRm_num());
		rService.UpdateReport(rep_num);
		
		RestModify rm = restaurantService.getRestModify(rm_name);
		System.out.println(rm);
		/*HashMap<String,Object> params = new HashMap<String,Object>();
		params.put("rm_num", rm.getRm_num());
		params.put("rm_phone", rm.getRm_phone());
		params.put("rm_runtime", rm.getRm_runtime());
		params.put("rm_rundate", rm.getRm_rundate());
		params.put("rm_price", rm.getRm_price());
		params.put("rm_intro", rm.getRm_intro());
		params.put("rm_menu", rm.getRm_menu());*/
		restaurantService.updateRestaurnat(rm);
		return "redirect:/reportList";
	}
	@RequestMapping("/reportCancel")
	public String reportCancel(@RequestParam int rep_num, String rm_name) {
		rService.UpdateReport(rep_num);
		return "redirect:/reportList";
		
	}
	
}

























