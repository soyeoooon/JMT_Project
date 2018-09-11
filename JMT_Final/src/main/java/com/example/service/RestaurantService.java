package com.example.service;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;
import org.xmlpull.v1.XmlPullParserFactory;

import com.example.dao.EvaluationDao;
import com.example.dao.FriendListDao;
import com.example.dao.MemberListDao;
import com.example.dao.RepListDao;
import com.example.dao.ReportDao;
import com.example.dao.RestaurantDao;
import com.example.dao.ReviewDao;
import com.example.model.Evaluation;
import com.example.model.FriendList;
import com.example.model.MemberList;
import com.example.model.Report;
import com.example.model.RestModify;
import com.example.model.Restaurant;
import com.example.dao.IRestModifyDao;

@Service
public class RestaurantService {
	@Autowired
	RestaurantDao restaurantDao;

	@Autowired
	EvaluationDao evaluationDao;

	@Autowired
	ReviewDao reviewDao;

	@Autowired
	IRestModifyDao restModifyDao;

	@Autowired
	ReportDao reportDao;

	@Autowired
	RepListDao reportListDao;

	@Autowired
	MemberListDao memberListDao;

	@Autowired
	FriendListDao friendListDao;

	public int searchResNum(String res_search) {
		String[] res_searchsplit = res_search.split(",.");
		String r_name = res_searchsplit[0];
		String r_address = res_searchsplit[1];
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("r_name", r_name);
		map.put("r_address", r_address);
		if (restaurantDao.selectOneRestaurantNum(map).size() > 1) {
			for (int i = 1; i < restaurantDao.selectOneRestaurantNum(map).size(); i++) {
				restaurantDao.deleteRestaurant(restaurantDao.selectOneRestaurantNum(map).get(i));
			}
		}
		return restaurantDao.selectOneRestaurantNum(map).get(0);
	}

	public List<Restaurant> searchRestaurant(String search) {
		List<Restaurant> restaurantList = null;
		if (search == null)
			search = "";
		try {
			String clientID = "4QCwLmDEwWC3Zzb1dCoM";
			String clientSecret = "Di_Nx6BzME";
			URL url = new URL("https://openapi.naver.com/v1/search/local.xml?query="
					+ URLEncoder.encode(search + " 음식점", "" + "UTF-8") + "&display=50&start=1&sort=random");
			URLConnection urlConn = url.openConnection();

			urlConn.setRequestProperty("X-Naver-Client-Id", clientID);
			urlConn.setRequestProperty("X-Naver-Client-Secret", clientSecret);

			BufferedReader br = new BufferedReader(new InputStreamReader(urlConn.getInputStream()));
			String msg = null;
			String data = "";
			while ((msg = br.readLine()) != null) {
				data = data + msg;
			}
			XmlPullParserFactory factory = XmlPullParserFactory.newInstance();
			XmlPullParser parser = factory.newPullParser();

			parser.setInput(new StringReader(data));
			int eventType = parser.getEventType();
			Restaurant restaurant = null;

			while (eventType != XmlPullParser.END_DOCUMENT) {
				switch (eventType) {

				case XmlPullParser.END_DOCUMENT:
					break;
				case XmlPullParser.START_DOCUMENT:
					restaurantList = new ArrayList<Restaurant>();
					break;

				case XmlPullParser.END_TAG:
					String tag = parser.getName();

					if (tag.equals("item")) {
						restaurantList.add(restaurant);
						restaurant = null;
					}
				case XmlPullParser.START_TAG:
					String tag1 = parser.getName();
					switch (tag1) {
					case "item":
						restaurant = new Restaurant();
						break;
					case "title":
						if (restaurant != null) {
							restaurant.setR_name(parser.nextText().replace("<b>", "").replace("</b>", ""));
						}
						break;
					case "category":
						if (restaurant != null) {
							String cate = parser.nextText();
							String[] cate2 = null;
							if (cate.indexOf(">") > 0) {
								cate2 = cate.split(">");
								restaurant.setR_category1(cate2[0]);
								restaurant.setR_category2(cate2[1]);
							} else {
								restaurant.setR_category1(cate);
							}
						}
						break;
					case "description":
						if (restaurant != null)
							restaurant.setR_intro(parser.nextText());
						break;
					case "telephone":
						if (restaurant != null)
							restaurant.setR_phone(parser.nextText());
						break;
					case "address":
						if (restaurant != null)
							restaurant.setR_address(parser.nextText());
						break;
					case "mapx":
						if (restaurant != null)
							restaurant.setR_lat(Integer.parseInt(parser.nextText()));
						break;
					case "mapy":
						if (restaurant != null)
							restaurant.setR_lon(Integer.parseInt(parser.nextText()));
						HashMap<String, Object> map = new HashMap<String, Object>();
						map.put("r_name", restaurant.getR_name());
						map.put("r_address", restaurant.getR_address());
						if (restaurantDao.countRestaurantNum(map) < 1) {
							restaurantDao.insertRestaurant(restaurant);
						}
						break;
					}
				}
				eventType = parser.next();
			}

		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (XmlPullParserException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return restaurantList;
	}

	/*--------------------소연--------------------*/
	public Restaurant selectOneRestaurant(String r_name, String r_address) {
		return restaurantDao.selectOneRestaurantName(r_name, r_address);
	}

	public List<Restaurant> getRestaurantList() {
		return restaurantDao.selectAllRestaurant();
	}

	/*
	 * getStartPage : 네비게이터의 첫번째번호 getEndPage : 네비게이터의 마지막번호 getLastPage : 총 게시물의 수를
	 * 가져와서 가장 마지막 페이지 번호 구하기
	 */

	public int getStartPage(int page) {
		// 현재페이지-(현재페이지-1)%네비게이터 블록 크기
		return page - ((page - 1) % 10);
	}

	public int getEndPage(int page) {
		// 첫번째 페이지 번호 + (네비게이터 블록 크기 -1)
		return (page - ((page - 1) % 10)) + (10 - 1);

	}

	public int getLastPage(int NumOfBoards) {
		// 총 게시물의 수를 가져와서 맨 마지막 페이지 구하기

		int page = 0;
		if ((NumOfBoards / 10) != 0) {
			page = (NumOfBoards / 10) + 1;
		} else {
			page = NumOfBoards / 10;
		}
		return page;

	}

	public int getOffset(int page) {
		// offset : 게시물의 일부만 가져올때 얼만큼 건너뛰어야 하는지
		return (page - 1) * 10;

	}

//게시물 페이지정보 얻기 가능
	public HashMap<String, Object> getBoardListPage(int page, String keyword) {
		// searchRestaurant(keyword);

		// mapper에 인수를 전달하기 위한 map
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("offset", getOffset(page));
		params.put("boardsPerPage", 10);
		params.put("keyword", keyword);

		// 페이징 처리 정보를 담은 맵
		HashMap<String, Object> pageInfo = new HashMap<String, Object>();
		pageInfo.put("page", page);
		// pageInfo.put("current", page);
		pageInfo.put("start", getStartPage(page));
		pageInfo.put("end", getEndPage(page));
		pageInfo.put("last", getLastPage(searchRestaurant(keyword).size()) - 1);
		pageInfo.put("totalPage", searchRestaurant(keyword).size());

		System.out.println("크기: " + searchRestaurant(keyword).size());

		List<Restaurant> searchList = new ArrayList<Restaurant>();
		if (searchRestaurant(keyword).size() == 50) {
			int j = 0;
			for (int i = getOffset(page); i < getOffset(page) + 10; i++) {
				// System.out.println(i);
				// System.out.println(searchRestaurant(keyword).get(i));
				searchList.add(j, searchRestaurant(keyword).get(i));
				// System.out.println("result: " + searchList.get(j));
				j++;
			}
		} else {
			int j = 0;
			for (int i = getOffset(page); i < searchRestaurant(keyword).size(); i++) {
				// System.out.println(i);
				// System.out.println(searchRestaurant(keyword).get(i));
				searchList.add(j, searchRestaurant(keyword).get(i));
				// System.out.println("result: " + searchList.get(j));
				j++;
			}

		}

		pageInfo.put("searchList", searchList);

		return pageInfo;

	}

	/*
	 * public HashMap<String, Object> getBoardListPageAdmin(int page) { //
	 * searchRestaurant(keyword);
	 * 
	 * // mapper에 인수를 전달하기 위한 map HashMap<String, Object> params = new
	 * HashMap<String, Object>(); params.put("offset", getOffset(page));
	 * params.put("boardsPerPage", 10);
	 * 
	 * 
	 * // 페이징 처리 정보를 담은 맵 HashMap<String, Object> pageInfo = new HashMap<String,
	 * Object>(); pageInfo.put("page", page); // pageInfo.put("current", page);
	 * pageInfo.put("start", getStartPage(page)); pageInfo.put("end",
	 * getEndPage(page)); pageInfo.put("last",
	 * getLastPage(restaurantDao.getCount())); pageInfo.put("totalPage",
	 * restaurantDao.getCount()); pageInfo.put("restaurantList",
	 * restaurantDao.selectBoardPage(params));
	 * 
	 * return pageInfo;
	 * 
	 * }
	 */

	// 관리자 페이지 음식점 리스트를 검색 키워드로 가져오기
	public HashMap<String, Object> getBoardListPageAdminKeyword(int page, String keyword) {
		// mapper에 인수를 전달하기 위한 map
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("offset", getOffset(page));
		params.put("boardsPerPage", 10);
		params.put("keyword", keyword);

		// 페이징 처리 정보를 담은 맵
		HashMap<String, Object> pageInfo = new HashMap<String, Object>();
		pageInfo.put("page", page);
		// pageInfo.put("current", page);
		pageInfo.put("start", getStartPage(page));
		pageInfo.put("end", getEndPage(page));
		pageInfo.put("last", getLastPage(restaurantDao.getCount()));
		pageInfo.put("totalPage", restaurantDao.getCount());
		pageInfo.put("keyword", keyword);
		if (keyword != null) {
			pageInfo.put("restaurantList", restaurantDao.selectBoardPagebyKeyword(params));
		}
		else {
			pageInfo.put("restaurantList",restaurantDao.selectBoardPage(params));
		}

		return pageInfo;

	}

	// 신고받은 상세정보 기록 삭제위해 가져옴 (번호 얻기위해)
	public RestModify getRestModify(String rm_name) {
		return restModifyDao.selectModify(rm_name);
	}

	// 위에서 얻은 번호로 기록 삭제
	public void removeModify(int rm_num) {
		restModifyDao.deleteModify(rm_num);
	}

	// 신고처리 되면 바로 이전기록으로 상세정보 수정하기.
	public void updateRestaurnat(RestModify rm) {
		restaurantDao.updateRestaurantByReport(rm);

	}

	/*--------------------용화--------------------*/
	// 맛집 상세보기 페이지(기본)
	public HashMap<String, Object> RestaurantSelect(HashMap<String, String> data) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int r_num = Integer.parseInt(data.get("r_num"));
		int m_num = Integer.parseInt(data.get("m_num"));

		try {
			Restaurant r = restaurantDao.selectOne(r_num);

			List<HashMap<String, Object>> list = reviewDao.ReviewSelect(r_num);
			for (int i = 0; i < list.size(); i++) {
				List<String> imgs = FolderList(list.get(i).get("rev_path").toString());
				list.get(i).put("rev_path", imgs);
			}

			// 접속한 유저가 내린 음식점 평가
			map.put("user", evaluationDao.memberSelect(data));
			// 만약 없으면 null로 들어가 에러가 뜨므로 기본베이스만 만들고 값은 default
			if (map.get("user") == null) {
				evaluationDao.insert(new Evaluation(r_num, m_num, 0.0, false, false));
				map.put("user", evaluationDao.memberSelect(data));
			}

			// 슬라이드에 사용되는 랜덤이미지
			map.put("imgs", ImgList(r_num));

			// 모두보기에 사용되는 이미지
			map.put("imgs_more", ImgList_More(r_num));

			// 맛집 상세정보 및 위치
			map.put("restaurant", r);

			// 맛집 총 평가 부분
			map.put("evaluation", evaluationDao.restaurantSelect(r_num));
			// 맛집 리뷰 목록
			map.put("review", list);

			// 신고상태 확인
			map.put("report", reportDao.selectRestaurant(r_num));

			// 신고모달에 사용되는 신고내용목록
			map.put("reportlist", reportListDao.selectAll());
		} catch (Exception e) {
			e.printStackTrace();
		}

		return map;
	}

	// 폴더안에 이미지 파일들 조회
	public List<String> FolderList(String path) {
		String root = "C:/Users/USER/Desktop/Dropbox/project_work/demo-3/target/classes/static/img/" + path;

		File folder = new File(root);
		if (!folder.isDirectory()) {
			folder.mkdir();
		}

		List<String> list = new ArrayList<String>();
		try {
			File[] listOfFiles = folder.listFiles();
			for (File file : listOfFiles) {
				if (file.isFile()) {
					list.add("img/" + path + file.getName());
				}
			}
		} catch (Exception e) {
		}
		return list;
	}

	// 슬라이드에 사용되는 랜덤이미지
	public List<String> ImgList(int r_num) throws IOException {
		Restaurant r = restaurantDao.selectOne(r_num);
		String root = "C:/Users/USER/Desktop/Dropbox/project_work/demo-3/target/classes/static/img/" + r.getR_photo();

		File folder = new File(root);
		if (!folder.isDirectory()) {
			folder.mkdir();
		}

		List<String> list = new ArrayList<String>();
		try {
			File[] listOfFiles = folder.listFiles();
			for (File file : listOfFiles) {
				if (file.isDirectory()) {
					File[] Files = file.listFiles();
					for (File f : Files) {
						if (f.isFile()) {
							list.add("img/" + r.getR_photo() + file.getName() + "/" + f.getName());
						}
					}
				}
			}
		} catch (Exception e) {
		}

		while (list.size() != 5) {
			if (list.size() > 5) {
				list.remove(new Random().nextInt(list.size()));
			} else {
				list.add("img/No_Image.jpg");
			}
		}

		return list;
	}

	// 모두보기에 사용되는 전체이미지
	public List<String> ImgList_More(int r_num) throws IOException {
		Restaurant r = restaurantDao.selectOne(r_num);
		String root = "C:/Users/USER/Desktop/Dropbox/project_work/demo-3/target/classes/static/img/" + r.getR_photo();

		File folder = new File(root);
		if (!folder.isDirectory()) {
			folder.mkdir();
		}

		List<String> list = new ArrayList<String>();
		try {
			File[] listOfFiles = folder.listFiles();
			for (File file : listOfFiles) {
				if (file.isDirectory()) {
					File[] Files = file.listFiles();
					for (File f : Files) {
						if (f.isFile()) {
							list.add("img/" + r.getR_photo() + file.getName() + "/" + f.getName());
						}
					}
				}
			}
		} catch (Exception e) {
		}

		return list;
	}

	// 좋아요 on/off
	public HashMap<String, Object> LikeUpdate(HashMap<String, String> map) {
		evaluationDao.likeUpdate(map);
		return evaluationDao.restaurantSelect(Integer.parseInt(map.get("r_num").toString()));
	}

	// 즐겨찾기 on/off
	public HashMap<String, Object> MarkUpdate(HashMap<String, String> map) {
		evaluationDao.markUpdate(map);
		return evaluationDao.restaurantSelect(Integer.parseInt(map.get("r_num").toString()));
	}

	// 평점 수정
	public HashMap<String, Object> GradeUpdate(HashMap<String, String> map) {
		evaluationDao.gradeUpdate(map);
		return evaluationDao.restaurantSelect(Integer.parseInt(map.get("r_num").toString()));
	}

	// 맛집 정보 수정
	public Restaurant RestaurantUpdate(HashMap<String, String> map) {
		Restaurant r = restaurantDao.selectOne(Integer.parseInt(map.get("r_num")));

		RestModify restModify = new RestModify(0, r.getR_name(), map.get("rm_phone"), r.getR_address(), r.getR_lat(),
				r.getR_lon(), r.getR_category1(), r.getR_category2(), r.getR_price(), map.get("rm_enjoy"),
				map.get("rm_rundate"), map.get("rm_runtime"), map.get("rm_intro"), map.get("rm_menu"), r.getR_photo(),
				new Date(), Integer.parseInt(map.get("r_num")), Integer.parseInt(map.get("m_num")));
		restaurantDao.updateInfo(restModify);
		restModifyDao.insert(restModify);

		return restaurantDao.selectOne(restModify.r_num);
	}

	// 유저정보 조회
	public MemberList MemberInfo(int m_num) {
		return memberListDao.selectOne(m_num);
	}

	// 다른사람의 프로필정보(유저정보, 평가정보, 친구상태 여부)
	public HashMap<String, Object> OthersInfo(int m_num, int email) {
		HashMap<String, Object> map = memberListDao.OthersSelect(m_num);

		HashMap<String, Integer> con = new HashMap<String, Integer>();
		con.put("req_mail", email);
		con.put("resp_mail", Integer.parseInt(map.get("email_num").toString()));
		String status = friendListDao.connection(con);
		if (status == null) {
			con.put("req_mail", Integer.parseInt(map.get("email_num").toString()));
			con.put("resp_mail", email);
			status = friendListDao.connection(con);
			if (status == null) {
				status = "친구신청";
			} else if (status.equals("0")) {
				// 보낸사람:타인, 받은사람:본인, 상태:대기
				status = "수락";
			} else if (status.equals("1")) {
				// 보낸사람:타인, 받은사람:본인, 상태:수락
				status = "친구";
			}
		} else if (status.equals("0")) {
			// 보낸사람:본인, 받은사람:타인, 상태:대기
			status = "대기중";
		} else if (status.equals("1")) {
			// 보낸사람:본인, 받은사람:타인, 상태:수락
			status = "친구";
		}

		if (m_num == email) {
			status = "본인";
		}

		map.put("status", status);
		return map;
	}

	public HashMap<String, Object> ModifyMemberInfo(int r_num) {
		return restModifyDao.selectLast(r_num);
	}

	public void FriendSend(FriendList friendList) {
		friendListDao.insert(friendList);
	}

	public void FriendAccept(FriendList friendList) {
		friendListDao.update(friendList);
	}

	public Restaurant ModifyRestaurantInfo(int r_num) {
		return restaurantDao.selectOne(r_num);
	}

	public void View_Report(HashMap<String, String> map) {
		Report report = new Report(0, Integer.parseInt(map.get("r_num")), Integer.parseInt(map.get("m_mail1")),
				Integer.parseInt(map.get("m_mail2")), Integer.parseInt(map.get("replist_num")), 1, new Date(), null);
		reportDao.insert(report);
	}

}
