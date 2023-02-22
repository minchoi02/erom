package egovframework.base.member.web;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.apache.commons.codec.binary.Base64;
import org.springframework.social.MissingAuthorizationException;
import org.springframework.social.connect.Connection;
import org.springframework.social.facebook.api.Facebook;
import org.springframework.social.facebook.api.User;
import org.springframework.social.facebook.api.UserOperations;
import org.springframework.social.facebook.api.impl.FacebookTemplate;
import org.springframework.social.facebook.connect.FacebookConnectionFactory;
import org.springframework.social.oauth2.AccessGrant;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import egovframework.admgrConfig.service.AdmgrConfigService;
import egovframework.admgrConfig.service.AdmgrConfigVO;
import egovframework.admgrExtention.service.AdmgrExtentionService;
import egovframework.admgrExtention.service.AdmgrExtentionVO;
import egovframework.base.member.service.BaseMemberService;
import egovframework.base.member.service.BaseMemberVO;
import egovframework.base.service.BaseService;
import egovframework.base.shop.service.BaseShopService;
import egovframework.base.shop.service.BaseShopVO;

@Controller
public class BaseMemberController {

	@Resource(name = "BaseMemberService")
	private BaseMemberService baseMemberService;	
	
	@Resource(name = "BaseShopService")
	private BaseShopService baseShopService;	
	
	@Resource(name = "BaseService")
	private BaseService baseService;	
	
	@Resource(name = "AdmgrConfigService")
	private AdmgrConfigService admgrConfigService;	
	
	@Resource(name = "AdmgrExtentionService")
	private AdmgrExtentionService admgrExtentionService;	
	
	//===============================================================================================================
	// * 로그인 선택
	//===============================================================================================================
	@Autowired
    private FacebookConnectionFactory connectionFactory;
    @Autowired
    private OAuth2Parameters oAuth2Parameters;
    
    
    
	//mypage 구매내역
	@RequestMapping(value = "/mypage.do")
	public String mypage(
			ModelMap model, 
			HttpServletRequest request, 
			HttpServletResponse response
			
		)throws Exception {
		
		
		
		
		
		return "/baseScmtour/E_mypage/mypage";
	}
	
	//mypage 구매내역상세
	@RequestMapping(value = "/mypage_detail.do")
	public String mypage_detail(
			ModelMap model, 
			HttpServletRequest request, 
			HttpServletResponse response
			
		)throws Exception {
		
		
		
		
		
		return "/baseScmtour/E_mypage/mypage_detail";
	}
	
	//mypage 할인쿠폰
	@RequestMapping(value = "/mypage_coupon.do")
	public String mypage_coupon(
			ModelMap model, 
			HttpServletRequest request, 
			HttpServletResponse response
			
		)throws Exception {
		
		
		
		
		
		return "/baseScmtour/E_mypage/mypage_coupon";
	}
	
	//mypage 포인트
	@RequestMapping(value = "/mypage_point.do")
	public String mypage_point(
			ModelMap model, 
			HttpServletRequest request, 
			HttpServletResponse response
			
		)throws Exception {
		
		
		
		
		
		return "/baseScmtour/E_mypage/mypage_point";
	}
	
	//mypage Q&A
	@RequestMapping(value = "/mypage_qna.do")
	public String mypage_qna(
			ModelMap model, 
			HttpServletRequest request, 
			HttpServletResponse response
			
		)throws Exception {
		
		
		
		
		
		return "/baseScmtour/E_mypage/mypage_qna";
	}
	
	//mypage 구매후기
	@RequestMapping(value = "/mypage_review.do")
	public String mypage_review(
			ModelMap model, 
			HttpServletRequest request, 
			HttpServletResponse response
			
		)throws Exception {
		
		
		
		
		
		return "/baseScmtour/E_mypage/mypage_review";
	}
	
	//mypage 구매취소
	@RequestMapping(value = "/mypage_cancel.do")
	public String mypage_cancel(
			ModelMap model, 
			HttpServletRequest request, 
			HttpServletResponse response
			
		)throws Exception {
		
		
		
		
		
		return "/baseScmtour/E_mypage/mypage_cancel";
	}
    
    
	//mypage 개인정보수정
	@RequestMapping(value = "/mypage_modify.do")
	public String mypage_modify(
			@ModelAttribute("BaseShopVO") BaseShopVO baseShopVO, 
			@ModelAttribute("BaseMemberVO") BaseMemberVO baseMemberVO, 
			ModelMap model, 
			HttpServletRequest request, 
			HttpServletResponse response
			
		)throws Exception {
		// 세션체크한다. - 로그인전 페이지용
		HttpSession session = request.getSession(true);
		String user_sess_id = (String) session.getAttribute("user_id");
		if(user_sess_id != null && user_sess_id != "" ) {
		
			baseMemberVO.setuser_id(user_sess_id);
			baseShopVO.setuser_id(user_sess_id);
			model.addAttribute("memberInfo", baseMemberService.get_site_user_info(baseMemberVO));
			model.addAttribute("addrList", baseMemberService.get_order_addr_list(baseMemberVO));
			
			String addr_seq = request.getParameter("addr_seq");
			model.addAttribute("addr_seq", addr_seq);
			if(addr_seq != null && addr_seq !="") {
				baseMemberVO.setaddr_seq(addr_seq);
				model.addAttribute("addrInfo", baseMemberService.get_addr_info(baseMemberVO));
			}
			//회원주소록 정보를 호출한다.
			model.addAttribute("addrList", baseShopService.get_cart_addr_list(baseShopVO));
		System.out.println("11111111111111111");
		
		}
		return "/baseScmtour/E_mypage/mypage_modify";
	}
    	
	
	//회원가입분류
	@RequestMapping(value = "/join_step1.do")
	public String join_step1(
			@ModelAttribute("BaseMemberVO") BaseMemberVO baseMemberVO, 
			ModelMap model, 
			HttpServletRequest request, 
			HttpServletResponse response
		) throws Exception {

		//------------------------------------------------------------------------------------------------------------------------------
		// 세션체크한다. - 로그인전 페이지용
		HttpSession session = request.getSession(true);
		String user_sess_id = (String) session.getAttribute("user_id");
		if(user_sess_id != null && user_sess_id != "" ) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('이미 로그인되어 있습니다.'); history.back(); </script>");
			out.flush();
			return null;
		}
		//------------------------------------------------------------------------------------------------------------------------------
		
		
		
		
		
		return "/baseScmtour/E_member/join_step1";
	}

	
	//회원가입입력
	@RequestMapping(value = "/join_step2.do")
	public String join_step2(
			@ModelAttribute("BaseMemberVO") BaseMemberVO baseMemberVO, 
			ModelMap model, 
			HttpServletRequest request, 
			HttpServletResponse response
		) throws Exception {

		//------------------------------------------------------------------------------------------------------------------------------
		// 세션체크한다. - 로그인전 페이지용
		HttpSession session = request.getSession(true);
		String user_sess_id = (String) session.getAttribute("user_id");
		if(user_sess_id != null && user_sess_id != "" ) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('이미 로그인되어 있습니다.'); history.back(); </script>");
			out.flush();
			return null;
		}
		//------------------------------------------------------------------------------------------------------------------------------
		
		
		
		return "/baseScmtour/E_member/join_step2";
	}
	
	//로그인
	@RequestMapping(value = "/login.do")
	public String login(
			@ModelAttribute("BaseMemberVO") BaseMemberVO baseMemberVO, 
			@ModelAttribute("AdmgrConfigVO") AdmgrConfigVO admgrConfigVO, 
			ModelMap model, 
			HttpServletRequest request, 
			HttpServletResponse response
		) throws Exception {
		
		//------------------------------------------------------------------------------------------------------------------------------
		// 세션체크한다. - 로그인전 페이지용
		HttpSession session = request.getSession(true);
		String user_sess_id = (String) session.getAttribute("user_id");
		if(user_sess_id != null && user_sess_id != "" ) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('이미 로그인되어 있습니다.'); history.back(); </script>");
			out.flush();
			return null;
		}
		//------------------------------------------------------------------------------------------------------------------------------
		String return_url = request.getParameter("return_url");
		if(return_url != null && return_url != "") {
			session.setAttribute("return_url", return_url);
		} else {
			session.setAttribute("return_url", "/");
		}
		model.addAttribute("SiteBaseConfig",admgrConfigService.get_base_config(null));
		
		// 페이스북 관련
		 OAuth2Operations oauthOperations = connectionFactory.getOAuthOperations();
        String facebook_url = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, oAuth2Parameters);
    
        model.addAttribute("facebook_url", facebook_url);
        //System.out.println("/facebook" + facebook_url);
        
		
		
		return "/baseScmtour/E_member/login";
	}	
    
    
    
    
	@RequestMapping(value = "/member/joinLogin.do")
	public String MemberjoinLogin(
			@ModelAttribute("BaseMemberVO") BaseMemberVO baseMemberVO, 
			@ModelAttribute("AdmgrConfigVO") AdmgrConfigVO admgrConfigVO, 
			ModelMap model, 
			HttpServletRequest request, 
			HttpServletResponse response
		) throws Exception {
		
		//------------------------------------------------------------------------------------------------------------------------------
		// 세션체크한다. - 로그인전 페이지용
		HttpSession session = request.getSession(true);
		String user_sess_id = (String) session.getAttribute("user_id");
		if(user_sess_id != null && user_sess_id != "" ) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('이미 로그인되어 있습니다.'); history.back(); </script>");
			out.flush();
			return null;
		}
		//------------------------------------------------------------------------------------------------------------------------------
		String return_url = request.getParameter("return_url");
		if(return_url != null && return_url != "") {
			session.setAttribute("return_url", return_url);
		} else {
			session.setAttribute("return_url", "/");
		}
		model.addAttribute("SiteBaseConfig",admgrConfigService.get_base_config(null));
		
		// 페이스북 관련
		 OAuth2Operations oauthOperations = connectionFactory.getOAuthOperations();
        String facebook_url = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, oAuth2Parameters);
    
        model.addAttribute("facebook_url", facebook_url);
        //System.out.println("/facebook" + facebook_url);
        
		return "/baseScmtour/baseMember/joinLogin";
	}
	
	//===============================================================================================================
	// * 로그인
	//===============================================================================================================
	@RequestMapping(value = "/member/login.do")
	public String Memberlogin(
			@ModelAttribute("BaseMemberVO") BaseMemberVO baseMemberVO, 
			ModelMap model, 
			HttpServletRequest request, 
			HttpServletResponse response
		) throws Exception {

		//------------------------------------------------------------------------------------------------------------------------------
		// 세션체크한다. - 로그인전 페이지용
		HttpSession session = request.getSession(true);
		String user_sess_id = (String) session.getAttribute("user_id");
		if(user_sess_id != null && user_sess_id != "" ) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('이미 로그인되어 있습니다.'); history.back(); </script>");
			out.flush();
			return null;
		}
		//------------------------------------------------------------------------------------------------------------------------------
		
		return "/baseScmtour/baseMember/login";
	}

	//===============================================================================================================
	// * 회원가입
	//===============================================================================================================
	@RequestMapping(value = "/member/join.do")
	public String Memberjoin(
			@ModelAttribute("BaseMemberVO") BaseMemberVO baseMemberVO, 
			ModelMap model, 
			HttpServletRequest request, 
			HttpServletResponse response
		) throws Exception {

		//------------------------------------------------------------------------------------------------------------------------------
		// 세션체크한다. - 로그인전 페이지용
		HttpSession session = request.getSession(true);
		String user_sess_id = (String) session.getAttribute("user_id");
		if(user_sess_id != null && user_sess_id != "" ) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('이미 로그인되어 있습니다.'); history.back(); </script>");
			out.flush();
			return null;
		}
		//------------------------------------------------------------------------------------------------------------------------------
		
		return "/baseScmtour/baseMember/join";
	}

	//===============================================================================================================
	// * 로그인액션 - 일반회원
	//===============================================================================================================
	@RequestMapping(value = "/member/loginAction.do")
	public void MemberloginAction(
			@ModelAttribute("BaseMemberVO") BaseMemberVO baseMemberVO, 
			ModelMap model, 
			HttpServletRequest request, 
			HttpServletResponse response
		) throws Exception {

		//------------------------------------------------------------------------------------------------------------------------------
		// 세션체크한다. - 로그인전 페이지용
		System.out.println("111111111111111111111111111111111111111111111111111");
		System.out.println("111111111111111111111111111111111111111111111111111");


		
		HttpSession session = request.getSession(true);
		String isMobile = (String) session.getAttribute("isMobile");
		String isApp = (String) session.getAttribute("isApp");
		System.out.println(isApp);
		String user_sess_id = (String) session.getAttribute("user_id");
		System.out.println("111111111111111111111111111111111111111111111111111");
		System.out.println("여기가가가가가아니니?");
		if(user_sess_id != null && user_sess_id != "" ) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('이미 로그인되어 있습니다.'); history.back(); </script>");
			out.flush();
			return;
		}
		//------------------------------------------------------------------------------------------------------------------------------
		String inuserId = request.getParameter("user_id").trim();
		String inuserPw = request.getParameter("user_pw").trim();
		String return_url = request.getParameter("return_url");
		//if(return_url == "" || return_url == null) {
		//	return_url = "/index.do";
		//} else {
		//	return_url = URLDecoder.decode(return_url , "UTF-8");
		//	return_url = return_url.replace("&amp;", "&");
		//}
		
		if(inuserId == null || inuserId == "") {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('아이디와 비밀번호를 제대로 입력해 주세요.'); history.back(); </script>");
			out.flush();
			return;
		}
		if(inuserPw == null || inuserPw == "") {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('아이디와 비밀번호를 제대로 입력해 주세요.'); history.back(); </script>");
			out.flush();
			return;
		}
		//비번 암호화
		if(inuserPw != "" && inuserPw != null) {
			inuserPw = BaseService.encPasswd(inuserId, inuserPw);
		}
		
		baseMemberVO.setuser_id(inuserId);
		baseMemberVO.setuser_pwd(inuserPw);
		BaseMemberVO loginCheck = baseMemberService.normal_login_check(baseMemberVO);
		
		//로그인 성공
		if(loginCheck != null) {
			String user_id = loginCheck.getuser_id();
			String user_nm = loginCheck.getuser_nm();
			String user_level = loginCheck.getuser_level();
			String user_hp = loginCheck.getuser_hp();
			String user_email = loginCheck.getuser_email();
			String user_type = loginCheck.getuser_join_fl();
	
			if(user_type.equals("normal")) {
				user_type = "N";	//사이트가입회원
			} else {
				user_type = "S";	//소셜회원
			}

			// 로그인 성공했으므로.. 로그를 남긴다.
			baseMemberService.insert_login_member(baseMemberVO);

			// 세션할당
			session.setAttribute("user_id", user_id);
			session.setAttribute("user_nm", user_nm);
			session.setAttribute("user_level", user_level);
			session.setAttribute("user_hp", user_hp);
			session.setAttribute("user_email", user_email);
			session.setAttribute("user_type", user_type);
			session.setAttribute("user_sns", "");

			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			System.out.println("165124561234651243123");
			if(isApp.equals("1")) {
				//out.println("<script>location.href='app://dtoursc?control=login&user_id="+user_id+"';</script>");
				//out.println("<script>locationReplace('/index.do');</script>");
				out.println("<script>location.href='/index.do';</script>");
				System.out.println("흐허허허허");
			} else {
				//out.println("<script>function locationReplace(url){ if(history.replaceState){ history.replaceState(null, document.title, url); history.go(0); }else{ location.replace(url); } }</script>");
				out.println("<script>locationReplace('/index.do');</script>");
				System.out.println("흐허허허허11111111111111111");
			}
			out.flush();
			return;
			
		} else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인정보가 맞지 않습니다\\n\\n다시 로그인하여 주새요.'); history.back(); </script>");
			out.flush();
			return;
		}
		
	}
	//===============================================================================================================
	// * 로그인액션 - 일반회원
	//===============================================================================================================
	@RequestMapping(value = "/Api/appLoginCheck.do")
	public void MemberappLoginCheck(
		@ModelAttribute("BaseMemberVO") BaseMemberVO baseMemberVO, 
		ModelMap model, 
		HttpServletRequest request, 
		HttpServletResponse response
		) throws Exception {
		
		HttpSession session = request.getSession(true);
		String sess_id = (String) session.getId();
		String user_id = request.getParameter("user_id");

		baseMemberVO.setuser_id(user_id);
		BaseMemberVO loginCheck = baseMemberService.get_site_user_info(baseMemberVO);
		
		if(loginCheck != null) {
			String user_nm = loginCheck.getuser_nm();
			String user_level = loginCheck.getuser_level();
			String user_hp = loginCheck.getuser_hp();
			String user_email = loginCheck.getuser_email();
			String user_type = loginCheck.getuser_join_fl();
	
			String user_sns = user_type;
			if(user_type.equals("normal")) {
				user_sns = "";
				user_type = "N";	//사이트가입회원
			} else {
				user_type = "S";	//
			}
	
			// 로그인 성공했으므로.. 로그를 남긴다.
			baseMemberService.insert_login_member(baseMemberVO);
			
			session.setAttribute("user_id", user_id);
			session.setAttribute("user_nm", user_nm);
			session.setAttribute("user_level", user_level);
			session.setAttribute("user_hp", user_hp);
			session.setAttribute("user_email", user_email);
			session.setAttribute("user_type", user_type);
			session.setAttribute("user_sns", user_sns);
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("{\"msg\":\"로그인에 성공하였습니다.\",\"result\":\"success\"}");
			out.flush();
			return;
			
		} else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("{\"msg\":\"가입된 정보가 없습니다.\",\"result\":\"fail\"}");
			out.flush();
			return;
		}
		
	}
	
	//===============================================================================================================
	// * 회원가입 액션
	//===============================================================================================================
	@RequestMapping(value = "/member/joinAction.do")
	public void MemberjoinAction(
			@ModelAttribute("BaseMemberVO") BaseMemberVO baseMemberVO, 
			ModelMap model, 
			HttpServletRequest request, 
			HttpServletResponse response
		) throws Exception {

		//------------------------------------------------------------------------------------------------------------------------------
		// 세션체크한다. - 로그인전 페이지용
		HttpSession session = request.getSession(true);
		String user_sess_id = (String) session.getAttribute("user_id");
		if(user_sess_id != null && user_sess_id != "" ) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('이미 로그인되어 있습니다.'); history.back(); </script>");
			out.flush();
			return;
		}
		//------------------------------------------------------------------------------------------------------------------------------
		
		String return_url = request.getParameter("return_url");
		
		String user_join_fl = "normal";
		//String user_sex_fl = "N";
		String user_sex_fl = request.getParameter("user_sex_fl");
		String user_st = "Y";
		String user_id = request.getParameter("user_id").trim();
		String user_nm = request.getParameter("user_nm").trim();
		String user_pw = request.getParameter("user_pw").trim();
		String user_pw_re = request.getParameter("user_pw_re").trim();
		String user_hp = request.getParameter("user_hp").trim();
		String user_email = request.getParameter("user_email");
		String user_level = "2";
		String user_m_nm = request.getParameter("user_m_nm").trim();
		String user_m_num = request.getParameter("user_m_num").trim();
		String user_birth = request.getParameter("user_birth").trim();
		
		
		baseMemberVO.setuser_id(user_id);
		int idCheck = baseMemberService.is_member_id(baseMemberVO);
		
		if(idCheck>0) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('이미존재하는 아이디입니다.'); history.back(); </script>");
			out.flush();
			return;
		}
		
		String new_user_pw = "";
		if(user_pw.equals(user_pw_re)) {
			new_user_pw = BaseService.encPasswd(user_id, user_pw);
		} else {
			
		}
		
		baseMemberVO.setuser_join_fl(user_join_fl);
		baseMemberVO.setuser_id(user_id);
		baseMemberVO.setuser_nm(user_nm);
		baseMemberVO.setuser_pwd(new_user_pw);
		baseMemberVO.setuser_nm(user_nm);
		baseMemberVO.setuser_hp(user_hp);
		baseMemberVO.setuser_email(user_email);
		baseMemberVO.setuser_level(user_level);
		baseMemberVO.setuser_sex_fl(user_sex_fl);
		baseMemberVO.setuser_st(user_st);
		baseMemberVO.setuser_birth(user_birth);
		baseMemberVO.setuser_m_nm(user_m_nm);
		baseMemberVO.setuser_m_num(user_m_num);
		
		baseMemberService.site_insert_member(baseMemberVO);

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>function locationReplace(url){ if(history.replaceState){ history.replaceState(null, document.title, url); history.go(0); }else{ location.replace(url); } }</script>");
		out.println("<script>alert('가입되었습니다. 로그인하여 주세요.'); locationReplace('/login.do');</script>");
		out.flush();
		return;
		
	}

	//===============================================================================================================
	// * 회원가입 (아이디 중복 확인)
	//===============================================================================================================
	@RequestMapping(value = "/Ajax/idCheck.do")
	public String Memberidchek(
			@ModelAttribute("BaseMemberVO") BaseMemberVO baseMemberVO, 
			ModelMap model, 
			HttpServletRequest request, 
			HttpServletResponse response
		) throws Exception {
		
		String res = "사용 가능한 아이디 입니다.";
		String user_id = request.getParameter("user_id");
		
		baseMemberVO.setuser_id(user_id);
		int idCheck = baseMemberService.is_member_id(baseMemberVO);
		
		
		if(idCheck>0) {
				res = "중복된 아이디 입니다.";
		
		}
		model.addAttribute("result", res);
		
		return "/baseScmtour/AjaxResult/checkid"; 
		
	}

	

	//===============================================================================================================
	// * 로그아웃
	//===============================================================================================================
	@RequestMapping(value = "/member/logOut.do")
	public void MemberjoinLogOut(
			@ModelAttribute("BaseMemberVO") BaseMemberVO baseMemberVO, 
			ModelMap model, 
			HttpServletRequest request, 
			HttpServletResponse response
		) throws Exception {

		//------------------------------------------------------------------------------------------------------------------------------
		// 로그아웃 페이지용
		HttpSession session = request.getSession(false);
		String isMobile = (String) session.getAttribute("isMobile");
		String isApp = (String) session.getAttribute("isApp");
		if(session==null || session.isNew()){
			//response.sendError(400);
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인상태가 아닙니다'); history.back();</script>");
			out.flush();
			return;
		}
		//세션날리기
		session.invalidate();
		//------------------------------------------------------------------------------------------------------------------------------
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if(isApp.equals("1")) {
			
			out.println("<script>alert('로그아웃이 됐습니다');location.href='/index.do'</script>");
			//out.println("<script>location.href='app://dtoursc?control=logout'</script>");
		} else {
			out.println("<script>function locationReplace(url){ if(history.replaceState){ history.replaceState(null, document.title, url); history.go(0); }else{ location.replace(url); } }</script>");
			out.println("<script>locationReplace('/index.do');</script>");
		}
		out.flush();
		return;
	
	}
	
	
	
	//===============================================================================================================
	// * 아이디 찾기
	//===============================================================================================================
	@RequestMapping(value = "/Ajax/idFind.do")
	public String MemberidFind(
			@ModelAttribute("BaseMemberVO") BaseMemberVO baseMemberVO, 
			ModelMap model, 
			HttpServletRequest request, 
			HttpServletResponse response
		) throws Exception {

		String user_nm = request.getParameter("user_nm");
		String user_hp = request.getParameter("user_hp");
		
		String res = "N";
		baseMemberVO.setuser_nm(user_nm);
		baseMemberVO.setuser_hp(user_hp);
		BaseMemberVO res_user_data = baseMemberService.find_user_id(baseMemberVO);
		
		if(res_user_data != null) {
			String res_user_st = res_user_data.getuser_st();
			String res_user_id = res_user_data.getuser_id();
			
			if(res_user_st.equals("Y")) {
				res = res_user_id;
			} else {
				res = "F";
			}
		}
		model.addAttribute("result", res);
		return "/baseScmtour/AjaxResult/findId"; 
	}
	
	//===============================================================================================================
	// * 비밀번호 찾기
	//===============================================================================================================
	@RequestMapping(value = "/Ajax/pwFind.do")
	public String MemberpwFind(
		@ModelAttribute("BaseMemberVO") BaseMemberVO baseMemberVO, 
		@ModelAttribute("AdmgrExtentionVO") AdmgrExtentionVO admgrExtentionVO, 
		ModelMap model, 
		HttpServletRequest request, 
		HttpServletResponse response
		) throws Exception {
		
		String user_id = request.getParameter("user_id");
		String user_nm = request.getParameter("user_nm");
		String user_hp = request.getParameter("user_hp");
		
		String res = "N";
		String new_user_pw = "";
		baseMemberVO.setuser_id(user_id);
		baseMemberVO.setuser_nm(user_nm);
		baseMemberVO.setuser_hp(user_hp);
		BaseMemberVO res_user_data = baseMemberService.find_user_hp(baseMemberVO);
		
		AdmgrConfigVO getConfig = admgrConfigService.get_base_config(null);
		String callback = getConfig.getsms_send();
		
		int rankey1 = (int) (Math.random() * 9)+1;
		int rankey2 = (int) (Math.random() * 9)+1;
		int rankey3 = (int) (Math.random() * 9)+1;
		int rankey4 = (int) (Math.random() * 9)+1;
		int rankey5 = (int) (Math.random() * 9)+1;
		int rankey6 = (int) (Math.random() * 9)+1;
		int rankey7 = (int) (Math.random() * 9)+1;
		int rankey8 = (int) (Math.random() * 9)+1;
		
		
		if(res_user_data != null) {
			String res_user_st = res_user_data.getuser_st();
			String res_user_hp = res_user_data.getuser_hp();
			
			if(res_user_st.equals("Y")) {
				String inuserPw = Integer.toString(rankey1)+Integer.toString(rankey2)+Integer.toString(rankey3)+Integer.toString(rankey4)+Integer.toString(rankey5)+Integer.toString(rankey6)+Integer.toString(rankey7)+Integer.toString(rankey8);
				new_user_pw = BaseService.encPasswd(user_id, inuserPw);
				//새 비밀번호 업데이트
				baseMemberVO.setuser_pwd(new_user_pw);
				baseMemberService.passwd_update(baseMemberVO);
				//문자보내기 - 고객에게 문자를 보낸다.
				String sms_msg = "이롬스토어 - ["+user_id+"]님의 비밀번호가 ["+inuserPw+"]으로 변경되었습니다.";
				admgrExtentionVO.setsms_type("U");
				admgrExtentionVO.setsms_target("I");
				admgrExtentionVO.settr_callback(callback);
				admgrExtentionVO.settr_msg(sms_msg);
				admgrExtentionVO.settr_phone(res_user_hp);
				admgrExtentionService.sms_add(admgrExtentionVO);
				admgrExtentionService.sms_add_log(admgrExtentionVO);
				res = "Y";
			} else {
				res = "F";
			}
		}
		model.addAttribute("result", res);
		return "/baseScmtour/AjaxResult/findPw"; 
		
	}
	
	//===============================================================================================================
	// * 찜하기 - 예약
	//===============================================================================================================
	@RequestMapping(value = "/mypage/favoriteReserveList.do")
	public String MemberfavoriteReserveList(
		@ModelAttribute("BaseMemberVO") BaseMemberVO baseMemberVO, 
		@ModelAttribute("BaseShopVO") BaseShopVO baseShopVO, 
		ModelMap model, 
		HttpServletRequest request, 
		HttpServletResponse response
		) throws Exception {

		HttpSession session = request.getSession(true);
		String user_id = (String) session.getAttribute("user_id");
		if(user_id == null || user_id == "") {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('회원으로 로그인 하셔야 합니다.'); history.back(); </script>");
			out.flush();
			return null;
		} else {
			//페이지 결과는 ajax로 처리함
			return "/baseScmtour/baseMember/favoriteReserveList";
		}
	}

	//===============================================================================================================
	// * 찜하기 - 상품
	//===============================================================================================================
	@RequestMapping(value = "/mypage/favoriteMarketList.do")
	public String MemberfavoriteMarketList(
		@ModelAttribute("BaseMemberVO") BaseMemberVO baseMemberVO, 
		@ModelAttribute("BaseShopVO") BaseShopVO baseShopVO, 
		ModelMap model, 
		HttpServletRequest request, 
		HttpServletResponse response
		) throws Exception {
		
		HttpSession session = request.getSession(true);
		String user_id = (String) session.getAttribute("user_id");
		if(user_id == null || user_id == "") {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('회원으로 로그인 하셔야 합니다.'); history.back(); </script>");
			out.flush();
			return null;
		} else {
			//페이지 결과는 ajax로 처리함
			return "/baseScmtour/baseMember/favoriteMarketList";
		}
	}

	//===============================================================================================================
	// * 네이버로그인 콜백
	//===============================================================================================================
	@RequestMapping(value = "/actionNaverLogin.do")
	public void MemberactionNaverLogin(
		@ModelAttribute("BaseMemberVO") BaseMemberVO baseMemberVO, 
		@ModelAttribute("AdmgrConfigVO") AdmgrConfigVO admgrConfigVO, 
		ModelMap model, 
		HttpServletRequest request, 
		HttpServletResponse response
		) throws Exception {
	
		HttpSession session = request.getSession(true);
		String user_id = (String) session.getAttribute("user_id");
		String return_url = (String) session.getAttribute("return_url");
		
		if(user_id != null && user_id != "") {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('이미 로그인되어 있습니다.'); history.back(); </script>");
			out.flush();
			return;
		} else {
			AdmgrConfigVO SiteBaseConfig = admgrConfigService.get_base_config(null);
			model.addAttribute("SiteBaseConfig",SiteBaseConfig);
			String naver_cid = SiteBaseConfig.getsns_naver_cid();
			String naver_ckey = SiteBaseConfig.getsns_naver_ckey();
			//네이버 로그인 처리
			String clientId = naver_cid;//애플리케이션 클라이언트 아이디값";
		    String clientSecret = naver_ckey;//애플리케이션 클라이언트 시크릿값";
		    String code = request.getParameter("code");
		    String state = request.getParameter("state");
		    String redirectURI = null;
			try {
				redirectURI = URLEncoder.encode("https://www.scmtour.com/actionNaverLogin.do", "UTF-8");
				//redirectURI = URLEncoder.encode("http://220.123.69.229:8888/actionNaverLogin.do", "UTF-8");
			} catch (UnsupportedEncodingException e1) {
				e1.printStackTrace();
			}
		    String apiURL;
		    apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
		    apiURL += "client_id=" + clientId;
		    apiURL += "&client_secret=" + clientSecret;
		    apiURL += "&redirect_uri=" + redirectURI;
		    apiURL += "&code=" + code;
		    apiURL += "&state=" + state;
		    String access_token = "";
		    String refresh_token = "";
//		    System.out.println("apiURL="+apiURL);
		    try {
		      URL url = new URL(apiURL);
		      HttpURLConnection con = (HttpURLConnection)url.openConnection();
		      con.setRequestMethod("GET");
		      int responseCode = con.getResponseCode();
		      BufferedReader br;
//		      System.out.print("responseCode="+responseCode);
		      if(responseCode==200) { // 정상 호출
		        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		      } else {  // 에러 발생
		        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		      }
		      String inputLine;
		      StringBuffer res = new StringBuffer();
		      while ((inputLine = br.readLine()) != null) {
		        res.append(inputLine);
		      }
		      br.close();
			  if(responseCode==200) {
				// access_token 값 추출
				JSONParser parsing = new JSONParser();
				Object resObj = parsing.parse(res.toString());
				JSONObject resJsonObj = (JSONObject)resObj;

				access_token = (String)resJsonObj.get("access_token");
				refresh_token = (String)resJsonObj.get("refresh_token");

				// 회원정보 조회 API 1.
			    String token = access_token; // 네이버 로그인 접근 토큰;
			    String header = "Bearer " + token; // Bearer 다음에 공백 추가
			    String pInfoApiURL = "https://openapi.naver.com/v1/nid/me";

			    Map<String, String> requestHeaders = new HashMap<>();
			    requestHeaders.put("Authorization", header);
			    String responseBody = get(pInfoApiURL,requestHeaders);

			    // 프로필 정보 추출
			    Object responseBodyObj = parsing.parse(responseBody);
			    JSONObject jsonResponseBodyObj = (JSONObject)responseBodyObj;
			    JSONObject jsonresponseObj = (JSONObject) jsonResponseBodyObj.get("response");
			    
			    String naver_id = "";
			    String naver_name = "";
			    String naver_email = "";
			    if(!jsonresponseObj.get("id").equals(null) && !jsonresponseObj.get("id").equals("")) {
			    	naver_id = jsonresponseObj.get("id").toString();
			    }
			    if(!jsonresponseObj.get("name").equals(null) && !jsonresponseObj.get("name").equals("")) {
			    	naver_name = jsonresponseObj.get("name").toString();
			    }
			    /* 널체크가 안된당... 흠..
			    if(!jsonresponseObj.get("email").equals(null) && !jsonresponseObj.get("email").equals("")) {
			    	naver_email = jsonresponseObj.get("email").toString();
			    }
			    */
			    if(naver_id == null || naver_id == "") {
					response.setContentType("text/html; charset=UTF-8");
					PrintWriter out = response.getWriter();
					out.println("<script>alert('네이버로부터 필요정보를 전달받지 못하였습니다. 최소정보는 공개되어야 합니다.'); history.back(); </script>");
					out.flush();
					return;
				}
			    
			    //회원가입시키고 세션발생시키고 첨으로 돌린다.
			    baseMemberVO.setuser_join_fl("naver");
			    baseMemberVO.setuser_id(naver_id);
			    baseMemberVO.setuser_nm(naver_name);

			    String new_user_pw = "";
			    String user_sex_fl = "N";
			    /*
				if(user_pw.equals(user_pw_re)) {
					new_user_pw = BaseService.encPasswd(user_id, user_pw);
				} else {
					
				}
				*/
			    
				String user_hp = "";
				String user_email = "";
				String user_level = "2";
				String user_st = "Y";
				String user_type = "S";	//소셜회원

				//기입된 회원인지 체크한다.
			    int isCnt = baseMemberService.is_member_id(baseMemberVO);
			    if(isCnt == 0 ) {
			    	//가입시키기
					baseMemberVO.setuser_pwd(new_user_pw);
					baseMemberVO.setuser_hp(user_hp);
					baseMemberVO.setuser_email(user_email);
					baseMemberVO.setuser_level(user_level);
					baseMemberVO.setuser_sex_fl(user_sex_fl);
					baseMemberVO.setuser_st(user_st);
					
					baseMemberService.site_insert_member(baseMemberVO);
					
					session.setAttribute("user_id", naver_id);
					session.setAttribute("user_nm", naver_name);
					session.setAttribute("user_level", user_level);
					session.setAttribute("user_hp", user_hp);
					session.setAttribute("user_email", user_email);
					session.setAttribute("user_type", user_type);
					session.setAttribute("user_sns", "naver");
					
					// 로그인 성공했으므로.. 로그를 남긴다.
					baseMemberService.insert_login_member(baseMemberVO);
					
					response.setContentType("text/html; charset=UTF-8");
					PrintWriter out = response.getWriter();
					out.println("<script>function locationReplace(url){ if(history.replaceState){ history.replaceState(null, document.title, url); history.go(0); }else{ location.replace(url); } }</script>");
					out.println("<script>alert('회원가입을 환영합니다.'); locationReplace('"+return_url+"');</script>");
					out.flush();
					return;
				
			    } else { 
			    	
					//이미 회원이니 로그인시키다.
					session.setAttribute("user_id", naver_id);
					session.setAttribute("user_nm", naver_name);
					session.setAttribute("user_level", user_level);
					session.setAttribute("user_hp", user_hp);
					session.setAttribute("user_email", user_email);
					session.setAttribute("user_type", user_type);
					session.setAttribute("user_sns", "naver");
					
					// 로그인 성공했으므로.. 로그를 남긴다.
					baseMemberService.insert_login_member(baseMemberVO);
					
					response.setContentType("text/html; charset=UTF-8");
					PrintWriter out = response.getWriter();
					out.println("<script>function locationReplace(url){ if(history.replaceState){ history.replaceState(null, document.title, url); history.go(0); }else{ location.replace(url); } }</script>");
					out.println("<script>alert('로그인 되었습니다.'); locationReplace('"+return_url+"'); </script>");
					out.flush();
					return;
			    }
			  } // end 200
		    } catch (Exception e) {
		    	//System.out.println(e);
		    	response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('"+e+"'); history.back(); </script>");
				out.flush();
				return;
		    	
		    }
		}
	}
	//===============================================================================================================
	// * 네이버로그인 함수 {
	//===============================================================================================================
	private static String get(String apiUrl, Map<String, String> requestHeaders){ 
	    HttpURLConnection con = connect(apiUrl);
	    try {
	        con.setRequestMethod("GET");
	        for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
	            con.setRequestProperty(header.getKey(), header.getValue());
	        }

	        int responseCode = con.getResponseCode();
	        if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
	            return readBody(con.getInputStream());
	        } else { // 에러 발생
	            return readBody(con.getErrorStream());
	        }
	    } catch (IOException e) {
	        throw new RuntimeException("API 요청과 응답 실패", e);
	    } finally {
	        con.disconnect();
	    }
	} 
	private static HttpURLConnection connect(String apiUrl){ 
	    try {
	        URL url = new URL(apiUrl);
	        return (HttpURLConnection)url.openConnection();
	    } catch (MalformedURLException e) {
	        throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
	    } catch (IOException e) {
	        throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
	    }
	}
	private static String readBody(InputStream body){ 
	    InputStreamReader streamReader = new InputStreamReader(body);

	    try (BufferedReader lineReader = new BufferedReader(streamReader)) {
	        StringBuilder responseBody = new StringBuilder();

	        String line;
	        while ((line = lineReader.readLine()) != null) {
	            responseBody.append(line);
	        }

	        return responseBody.toString();
	    } catch (IOException e) {
	        throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
	    }
	}
	//===============================================================================================================
	// * } 네이버로그인 함수 
	//===============================================================================================================

	
	//===============================================================================================================
	// * 카카오로그인 콜백
	//===============================================================================================================
	@RequestMapping(value = "/actionKakaoLogin.do")
	public void MemberactionkakaoLogin(
		@ModelAttribute("BaseMemberVO") BaseMemberVO baseMemberVO, 
		@ModelAttribute("AdmgrConfigVO") AdmgrConfigVO admgrConfigVO, 
		ModelMap model, 
		HttpServletRequest request, 
		HttpServletResponse response
		) throws Exception {
	
		HttpSession session = request.getSession(true);
		String user_id = (String) session.getAttribute("user_id");
		String return_url = (String) session.getAttribute("return_url");
		
		if(user_id != null && user_id != "") {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('이미 로그인되어 있습니다.'); history.back(); </script>");
			out.flush();
			return;
		} else {
			AdmgrConfigVO SiteBaseConfig = admgrConfigService.get_base_config(null);
			String client_id = SiteBaseConfig.getsns_daum_ckey();
			
			model.addAttribute("SiteBaseConfig",SiteBaseConfig);
			String code = request.getParameter("code");
			
			JsonNode accessToken;
			 
	        // JsonNode트리형태로 토큰받아온다
	        JsonNode jsonToken = getKakaoAccessToken(code, client_id);
	        // 여러 json객체 중 access_token을 가져온다
	        accessToken = jsonToken.get("access_token");

	        JsonNode userInfo = getKakaoUserInfo(accessToken);
	        /*
	        System.out.println("==================");
		    System.out.println(userInfo);
		    System.out.println("==================");
		    */
	        
	        // Get id
	        String kakao_id = userInfo.path("id").asText();
	        String kakao_name = null;
	        String kakao_email = null;
	        
	        if(kakao_id == null || kakao_id == "") {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('카카오로부터 필요정보를 전달받지 못하였습니다. 최소정보는 공개되어야 합니다.'); history.back(); </script>");
				out.flush();
				return;
			}
	 
	        // 유저정보 카카오에서 가져오기 Get properties
	        JsonNode properties = userInfo.path("properties");
	        JsonNode kakao_account = userInfo.path("kakao_account");
	 
	        kakao_name = properties.path("nickname").asText();
	        kakao_email = kakao_account.path("email").asText();
	 
	        baseMemberVO.setuser_join_fl("kakao");
		    baseMemberVO.setuser_id(kakao_id);
		    baseMemberVO.setuser_nm(kakao_name);
		    baseMemberVO.setuser_email(kakao_email);
		    
		    String new_user_pw = "";
		    String user_sex_fl = "N";
		    
		    String user_hp = "";
			String user_email = "";
			String user_level = "2";
			String user_st = "Y";
			String user_type = "S";	//소셜회원
			
			//기입된 회원인지 체크한다.
		    int isCnt = baseMemberService.is_member_id(baseMemberVO);
		    if(isCnt == 0 ) {
		    	//가입시키기
				baseMemberVO.setuser_pwd(new_user_pw);
				baseMemberVO.setuser_hp(user_hp);
				baseMemberVO.setuser_email(user_email);
				baseMemberVO.setuser_level(user_level);
				baseMemberVO.setuser_sex_fl(user_sex_fl);
				baseMemberVO.setuser_st(user_st);
				
				baseMemberService.site_insert_member(baseMemberVO);
				
				session.setAttribute("user_id", kakao_id);
				session.setAttribute("user_nm", kakao_name);
				session.setAttribute("user_level", user_level);
				session.setAttribute("user_hp", user_hp);
				session.setAttribute("user_email", kakao_email);
				session.setAttribute("user_type", user_type);
				session.setAttribute("user_sns", "kakao");
				
				// 로그인 성공했으므로.. 로그를 남긴다.
				baseMemberService.insert_login_member(baseMemberVO);
				
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>function locationReplace(url){ if(history.replaceState){ history.replaceState(null, document.title, url); history.go(0); }else{ location.replace(url); } }</script>");
				out.println("<script>alert('회원가입을 환영합니다.'); locationReplace('"+return_url+"');</script>");
				out.flush();
				return;
			
		    } else { 
		    	
				//이미 회원이니 로그인시키다.
				session.setAttribute("user_id", kakao_id);
				session.setAttribute("user_nm", kakao_name);
				session.setAttribute("user_level", user_level);
				session.setAttribute("user_hp", user_hp);
				session.setAttribute("user_email", kakao_email);
				session.setAttribute("user_type", user_type);
				session.setAttribute("user_sns", "kakao");
				
				// 로그인 성공했으므로.. 로그를 남긴다.
				baseMemberService.insert_login_member(baseMemberVO);

				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>function locationReplace(url){ if(history.replaceState){ history.replaceState(null, document.title, url); history.go(0); }else{ location.replace(url); } }</script>");
				out.println("<script>alert('로그인 되었습니다.'); locationReplace('"+return_url+"'); </script>");
				out.flush();
				return;
		    }

		}
	}
	//===============================================================================================================
	// * 카카오로그인 함수 {
	//===============================================================================================================
	public static JsonNode getKakaoAccessToken(String code, String client_id) {
		 
        final String RequestUrl = "https://kauth.kakao.com/oauth/token"; // Host
        final List<NameValuePair> postParams = new ArrayList<NameValuePair>();
 
        postParams.add(new BasicNameValuePair("grant_type", "authorization_code"));
        postParams.add(new BasicNameValuePair("client_id", client_id)); // REST API KEY
        postParams.add(new BasicNameValuePair("redirect_uri", "https://www.scmtour.com/actionKakaoLogin.do")); // 리다이렉트 URI
        //postParams.add(new BasicNameValuePair("redirect_uri", "http://220.123.69.229:8888/actionKakaoLogin.do")); // 리다이렉트 URI
        postParams.add(new BasicNameValuePair("code", code)); // 로그인 과정중 얻은 code 값
 
        final HttpClient client = HttpClientBuilder.create().build();
        final HttpPost post = new HttpPost(RequestUrl);
 
        JsonNode returnNode = null;
 
        try {
            post.setEntity(new UrlEncodedFormEntity(postParams));
 
            final HttpResponse response = client.execute(post);
            final int responseCode = response.getStatusLine().getStatusCode();
            /*
            System.out.println("\nSending 'POST' request to URL : " + RequestUrl);
            System.out.println("Post parameters : " + postParams);
            System.out.println("Response Code : " + responseCode);
            */
 
            // JSON 형태 반환값 처리
            ObjectMapper mapper = new ObjectMapper();
 
            returnNode = mapper.readTree(response.getEntity().getContent());
 
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (ClientProtocolException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
        }
 
        return returnNode;
    }
	public static JsonNode getKakaoUserInfo(JsonNode accessToken) {
		 
        final String RequestUrl = "https://kapi.kakao.com/v2/user/me";
        final HttpClient client = HttpClientBuilder.create().build();
        final HttpPost post = new HttpPost(RequestUrl);
 
        // add header
        post.addHeader("Authorization", "Bearer " + accessToken);
 
        JsonNode returnNode = null;
 
        try {
            final HttpResponse response = client.execute(post);
            final int responseCode = response.getStatusLine().getStatusCode();
 
            System.out.println("\nSending 'POST' request to URL : " + RequestUrl);
            System.out.println("Response Code : " + responseCode);
 
            // JSON 형태 반환값 처리
            ObjectMapper mapper = new ObjectMapper();
            returnNode = mapper.readTree(response.getEntity().getContent());
 
        } catch (ClientProtocolException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            // clear resources
        }
 
        return returnNode;
    }
	//===============================================================================================================
	// * } 카카오로그인 함수 
	//===============================================================================================================


	//===============================================================================================================
	// * 페이스북 콜백
	//===============================================================================================================
	@RequestMapping(value = "/actionFacebookLogin.do")
	public void MemberactionfacebookLogin(
		@ModelAttribute("BaseMemberVO") BaseMemberVO baseMemberVO, 
		@ModelAttribute("AdmgrConfigVO") AdmgrConfigVO admgrConfigVO, 
		ModelMap model, 
		HttpServletRequest request, 
		HttpServletResponse response
		) throws Exception {
	
		HttpSession session = request.getSession(true);
		String user_id = (String) session.getAttribute("user_id");
		String return_url = (String) session.getAttribute("return_url");
		
		if(user_id != null && user_id != "") {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('이미 로그인되어 있습니다.'); history.back(); </script>");
			out.flush();
			return;
		} else {
			AdmgrConfigVO SiteBaseConfig = admgrConfigService.get_base_config(null);
			
			String user_hp = "";
			String user_email = "";
			String user_level = "2";
			String user_st = "Y";
			String user_type = "S";	//소셜회원
			String new_user_pw = "";
			String user_sex_fl = "N";
			
			String code = request.getParameter("code");
			
			try {
	            String redirectUri = oAuth2Parameters.getRedirectUri();
	            /*
	            System.out.println("Redirect URI : " + redirectUri);
	            System.out.println("Code : " + code);
	            */
	 
	            OAuth2Operations oauthOperations = connectionFactory.getOAuthOperations();
	            AccessGrant accessGrant = oauthOperations.exchangeForAccess(code, redirectUri, null);
	            String accessToken = accessGrant.getAccessToken();
	            System.out.println("AccessToken: " + accessToken);
	            Long expireTime = accessGrant.getExpireTime();
	            
	            if (expireTime != null && expireTime < System.currentTimeMillis()) {
	                accessToken = accessGrant.getRefreshToken();
	                //logger.info("accessToken is expired. refresh token = {}", accessToken);
	            };
	            
	            Connection<Facebook> connection = connectionFactory.createConnection(accessGrant);
	            Facebook facebook = connection == null ? new FacebookTemplate(accessToken) : connection.getApi();
	            UserOperations userOperations = facebook.userOperations();
	            
	            try
	            {            
	                String [] fields = { "id", "email",  "name"};
	                User userProfile = facebook.fetchObject("me", User.class, fields);
	                /*
	                System.out.println("유저이메일 : " + userProfile.getEmail());
	                System.out.println("유저 id : " + userProfile.getId());
	                System.out.println("유저 name : " + userProfile.getName());
	                */
	                
	                //가입 및 로그인처리
	                String fb_id =  userProfile.getId();
	                String fb_name =  userProfile.getName();
	                String fb_email =  userProfile.getEmail();
	                
	                //회원가입시키고 세션발생시키고 첨으로 돌린다.
				    baseMemberVO.setuser_join_fl("facebook");
				    baseMemberVO.setuser_id(fb_id);
				    baseMemberVO.setuser_nm(fb_name);
				    baseMemberVO.setuser_nm(fb_email);
				    
				    //기입된 회원인지 체크한다.
				    int isCnt = baseMemberService.is_member_id(baseMemberVO);
				    
				    if(isCnt == 0 ) {
				    	//가입시키기
						baseMemberVO.setuser_pwd(new_user_pw);
						baseMemberVO.setuser_hp(user_hp);
						baseMemberVO.setuser_email(user_email);
						baseMemberVO.setuser_level(user_level);
						baseMemberVO.setuser_sex_fl(user_sex_fl);
						baseMemberVO.setuser_st(user_st);
						
						baseMemberService.site_insert_member(baseMemberVO);
						
						session.setAttribute("user_id", fb_id);
						session.setAttribute("user_nm", fb_name);
						session.setAttribute("user_level", user_level);
						session.setAttribute("user_hp", user_hp);
						session.setAttribute("user_email", fb_email);
						session.setAttribute("user_type", user_type);
						session.setAttribute("user_sns", "facebook");
						
						// 로그인 성공했으므로.. 로그를 남긴다.
						baseMemberService.insert_login_member(baseMemberVO);
						
						response.setContentType("text/html; charset=UTF-8");
						PrintWriter out = response.getWriter();
						out.println("<script>function locationReplace(url){ if(history.replaceState){ history.replaceState(null, document.title, url); history.go(0); }else{ location.replace(url); } }</script>");
						out.println("<script>alert('회원가입을 환영합니다.'); locationReplace('"+return_url+"');</script>");
						out.flush();
						return;
					
				    } else { 
				    	
						//이미 회원이니 로그인시키다.
				    	session.setAttribute("user_id", fb_id);
						session.setAttribute("user_nm", fb_name);
						session.setAttribute("user_level", user_level);
						session.setAttribute("user_hp", user_hp);
						session.setAttribute("user_email", fb_email);
						session.setAttribute("user_type", user_type);
						session.setAttribute("user_sns", "facebook");
						
						// 로그인 성공했으므로.. 로그를 남긴다.
						baseMemberService.insert_login_member(baseMemberVO);
						
						response.setContentType("text/html; charset=UTF-8");
						PrintWriter out = response.getWriter();
						out.println("<script>function locationReplace(url){ if(history.replaceState){ history.replaceState(null, document.title, url); history.go(0); }else{ location.replace(url); } }</script>");
						out.println("<script>alert('로그인 되었습니다.'); locationReplace('"+return_url+"'); </script>");
						out.flush();
						return;
				    }
	                
	            } catch (MissingAuthorizationException e) {
	            	response.setContentType("text/html; charset=UTF-8");
					PrintWriter out = response.getWriter();
					out.println("<script>function locationReplace(url){ if(history.replaceState){ history.replaceState(null, document.title, url); history.go(0); }else{ location.replace(url); } }</script>");
					out.println("<script>alert('데이터가 없습니다.(0)'); locationReplace('/member/joinLogin.do?return_url="+URLEncoder.encode(return_url, "UTF-8")+"'); </script>");
					out.flush();
					return;
	            }
	 
	        
	        } catch (Exception e) {
	        	response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>function locationReplace(url){ if(history.replaceState){ history.replaceState(null, document.title, url); history.go(0); }else{ location.replace(url); } }</script>");
				out.println("<script>alert('데이터가 없습니다.(1)'); locationReplace('/member/joinLogin.do?return_url="+URLEncoder.encode(return_url, "UTF-8")+"'); </script>");
				out.flush();
				return;
	        }
			
		}
	}

	//===============================================================================================================
	// * 애플로그인 콜백
	//===============================================================================================================
	@RequestMapping(value = "/actionAppleLogin.do")
	public void MemberactionappleLogin(
		@ModelAttribute("BaseMemberVO") BaseMemberVO baseMemberVO, 
		@ModelAttribute("AdmgrConfigVO") AdmgrConfigVO admgrConfigVO, 
		ModelMap model, 
		HttpServletRequest request, 
		HttpServletResponse response
		) throws Exception {
	
		HttpSession session = request.getSession(true);
		String user_id = (String) session.getAttribute("user_id");
		String return_url = (String) session.getAttribute("return_url");
		
		if(user_id != null && user_id != "") {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('이미 로그인되어 있습니다.'); history.back(); </script>");
			out.flush();
			return;
		} else {
			AdmgrConfigVO SiteBaseConfig = admgrConfigService.get_base_config(null);
			
			String user_hp = "";
			String user_email = "";
			String user_level = "2";
			String user_st = "Y";
			String user_type = "S";	//소셜회원
			String new_user_pw = "";
			String user_sex_fl = "N";
			
			String user = request.getParameter("user");
			String id_token = request.getParameter("id_token");
			
	        String apple_id = "";
		    String apple_name = "";
		    String apple_email = "";
		    
	        String apple_user_email = "";
	        String apple_user_fname = "";
	        String apple_user_lname = "";
	        
	        if(user != null && user != "") {	// 이 정보는 맨처음 가입시만 나오는 데이터.. appleid.apple.com에서 초기화하면 다시 넘어옴.
	        	String json_user = user.toString();
			    JSONParser parsing = new JSONParser();
			    Object resUser = parsing.parse(json_user);
				JSONObject resJsonUser = (JSONObject)resUser;

				apple_id = resJsonUser.get("email").toString();
				
				JSONObject userNameObject = (JSONObject)resJsonUser.get("name");
				apple_user_fname = userNameObject.get("firstName").toString();
				apple_user_lname = userNameObject.get("lastName").toString();

		        apple_name = apple_user_fname+apple_user_lname;
				apple_email = apple_id;
				
	        } else {
	        	//id_token = "eyJraWQiOiJlWGF1bm1MIiwiYWxnIjoiUlMyNTYifQ.eyJpc3MiOiJodHRwczovL2FwcGxlaWQuYXBwbGUuY29tIiwiYXVkIjoiY29tLmR0b3Vyc2MuZFRvdXJTQ1NlcnYiLCJleHAiOjE1ODkxOTE4NDAsImlhdCI6MTU4OTE5MTI0MCwic3ViIjoiMDAxNDIzLjliMGFjNDhjMDdjOTQyYTQ5MjJmMThmZDQ5NjZlYjk0LjA1MTkiLCJjX2hhc2giOiJpcG45azcwOTZsOTBVN3FDeXVfUFhBIiwiZW1haWwiOiJ6aWkzNGo3ZGZlQHByaXZhdGVyZWxheS5hcHBsZWlkLmNvbSIsImVtYWlsX3ZlcmlmaWVkIjoidHJ1ZSIsImlzX3ByaXZhdGVfZW1haWwiOiJ0cnVlIiwiYXV0aF90aW1lIjoxNTg5MTkxMjQwLCJub25jZV9zdXBwb3J0ZWQiOnRydWV9.mKKLfkl-q4iIUTRa8CVfuYp9bToLzjE9ZAt_3_S8qZGYBvlv67LotDydJYPGxVHxe1bZ0lc2vqnl-ObQU9eRJTiu-94qOI3mGz3GNWAGUbP2sdteSL1pxlSEOmGV43HvZkyNx3S0zv5sfI6fsSBh2gXsIadsEyD-NOMb9xyHdJJBihUVO9-V8sT8Oxf5DQDl1gd1arrP_utdWG4-3FSUPLF7HLa_HWCNlXfyIVVz9W_qxiSAUOSV0vQv4frytX6xtBtTRJljw98V8AMioC23sjmgs9ex3Z1PczD0NTvoqFt0u5lyOPBkd-fXpEgz3BXToy7bSTmnirHMCJu8NEfIDw";
	        	String[] split_string = id_token.split("\\.");
	            String base64EncodedHeader = split_string[0];
	            String base64EncodedBody = split_string[1];
	            String base64EncodedSignature = split_string[2];

	            System.out.println("~~~~~~~~~ JWT Header ~~~~~~~");
	            Base64 base64Url = new Base64();
	            String header = new String(base64Url.decode(base64EncodedHeader.getBytes()));
	            System.out.println("JWT Header : " + header);


	            System.out.println("~~~~~~~~~ JWT Body ~~~~~~~");
	            String body = new String(base64Url.decode(base64EncodedBody.getBytes()));
	            System.out.println("JWT Body : "+body);        

	        	String json_user = body.toString();
			    JSONParser parsing = new JSONParser();
			    Object resUser = parsing.parse(json_user);
				JSONObject resJsonUser = (JSONObject)resUser;

				apple_id = resJsonUser.get("email").toString();
				
	        }
	        /*
			System.out.println("==================");
			System.out.println(apple_id);
			System.out.println("==================");
			System.out.println("==================");
			System.out.println(apple_name);
			System.out.println("==================");
			System.out.println("==================");
			System.out.println(apple_email);
			System.out.println("==================");
			*/
	
	        if(apple_id != null && apple_id != "") { //얘는 항상 있다.
	        	
				baseMemberVO.setuser_join_fl("apple");
			    baseMemberVO.setuser_id(apple_id);
			    baseMemberVO.setuser_nm(apple_name);
			    baseMemberVO.setuser_nm(apple_email);
			    
			  //기입된 회원인지 체크한다.
			    int isCnt = baseMemberService.is_member_id(baseMemberVO);
			    
			    if(isCnt == 0 ) {
			    	//가입시키기
					baseMemberVO.setuser_pwd(new_user_pw);
					baseMemberVO.setuser_hp(user_hp);
					baseMemberVO.setuser_email(user_email);
					baseMemberVO.setuser_level(user_level);
					baseMemberVO.setuser_sex_fl(user_sex_fl);
					baseMemberVO.setuser_st(user_st);
					
					baseMemberService.site_insert_member(baseMemberVO);
					
					session.setAttribute("user_id", apple_id);
					session.setAttribute("user_nm", apple_name);
					session.setAttribute("user_level", user_level);
					session.setAttribute("user_hp", user_hp);
					session.setAttribute("user_email", apple_email);
					session.setAttribute("user_type", user_type);
					session.setAttribute("user_sns", "apple");
					
					// 로그인 성공했으므로.. 로그를 남긴다.
					baseMemberService.insert_login_member(baseMemberVO);
					
					response.setContentType("text/html; charset=UTF-8");
					PrintWriter out = response.getWriter();
					out.println("<script>function locationReplace(url){ if(history.replaceState){ history.replaceState(null, document.title, url); history.go(0); }else{ location.replace(url); } }</script>");
					out.println("<script>alert('회원가입을 환영합니다.'); locationReplace('"+return_url+"');</script>");
					out.flush();
					return;
				
			    } else { 
					//이미 회원이니 로그인시키다.
			    	session.setAttribute("user_id", apple_id);
					session.setAttribute("user_nm", apple_name);
					session.setAttribute("user_level", user_level);
					session.setAttribute("user_hp", user_hp);
					session.setAttribute("user_email", apple_email);
					session.setAttribute("user_type", user_type);
					session.setAttribute("user_sns", "apple");
					
					// 로그인 성공했으므로.. 로그를 남긴다.
					baseMemberService.insert_login_member(baseMemberVO);
					
					response.setContentType("text/html; charset=UTF-8");
					PrintWriter out = response.getWriter();
					out.println("<script>function locationReplace(url){ if(history.replaceState){ history.replaceState(null, document.title, url); history.go(0); }else{ location.replace(url); } }</script>");
					out.println("<script>alert('로그인 되었습니다.'); locationReplace('"+return_url+"'); </script>");
					out.flush();
					return;
			    }
				 
				 
			} else {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>function locationReplace(url){ if(history.replaceState){ history.replaceState(null, document.title, url); history.go(0); }else{ location.replace(url); } }</script>");
				out.println("<script>alert('데이터가 없습니다.(0)'); locationReplace('/member/joinLogin.do?return_url="+URLEncoder.encode(return_url, "UTF-8")+"'); </script>");
				out.flush();
				return;
			}

        }
	}

	
	//===============================================================================================================
	// * 회원정보수정
	//===============================================================================================================
	@RequestMapping(value = "/member/modify.do")
	public String Membermodify(
			@ModelAttribute("BaseMemberVO") BaseMemberVO baseMemberVO, 
			ModelMap model, 
			HttpServletRequest request, 
			HttpServletResponse response
		) throws Exception {
		
		//------------------------------------------------------------------------------------------------------------------------------
		// 세션체크한다. - 로그인전 페이지용
		HttpSession session = request.getSession(true);
		String user_sess_id = (String) session.getAttribute("user_id");
		if(user_sess_id != null && user_sess_id != "" ) {
		
			baseMemberVO.setuser_id(user_sess_id);
			
			model.addAttribute("memberInfo", baseMemberService.get_site_user_info(baseMemberVO));
			model.addAttribute("addrList", baseMemberService.get_order_addr_list(baseMemberVO));
			
			String addr_seq = request.getParameter("addr_seq");
			model.addAttribute("addr_seq", addr_seq);
			if(addr_seq != null && addr_seq !="") {
				baseMemberVO.setaddr_seq(addr_seq);
				model.addAttribute("addrInfo", baseMemberService.get_addr_info(baseMemberVO));
			}
		
		}
		return "/baseScmtour/baseMember/modify";
	}
	
	//===============================================================================================================
	// * 회원정보수정
	//===============================================================================================================
	@RequestMapping(value = "/member/modifyAction.do")
	public void MembermodifyAction(
			@ModelAttribute("BaseMemberVO") BaseMemberVO baseMemberVO, 
			ModelMap model, 
			HttpServletRequest request, 
			HttpServletResponse response
			) throws Exception {
		
		//------------------------------------------------------------------------------------------------------------------------------
		// 세션체크한다. - 로그인전 페이지용
		HttpSession session = request.getSession(true);
		String user_sess_id = (String) session.getAttribute("user_id");
		if(user_sess_id != null && user_sess_id != "" ) {
			
			String user_nm = request.getParameter("user_nm").trim();
			String user_passwd = request.getParameter("user_passwd").trim();
			String user_passwd_re = request.getParameter("user_passwd_re").trim();
			String user_email = request.getParameter("user_email").trim();
			String user_hp = request.getParameter("user_hp").trim();
			String newPw = "";
			if(user_passwd != null && user_passwd != "") {
				//비밀번호 발급
				newPw = BaseService.encPasswd(user_sess_id, user_passwd);
			}

			baseMemberVO.setuser_id(user_sess_id);
			baseMemberVO.setuser_nm(user_nm);
			baseMemberVO.setuser_pwd(newPw);
			baseMemberVO.setuser_hp(user_hp);					
			baseMemberVO.setuser_email(user_email);
			baseMemberService.set_member_update(baseMemberVO);
			
			if(user_passwd != null && user_passwd != "") {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>function locationReplace(url){ if(history.replaceState){ history.replaceState(null, document.title, url); history.go(0); }else{ location.replace(url); } }</script>");
				out.println("<script>alert('회원정보가 수정되었습니다. 다시 로그인이 필요합니다.'); locationReplace('/member/logOut.do'); </script>");
				out.flush();
				return;
			} else {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>function locationReplace(url){ if(history.replaceState){ history.replaceState(null, document.title, url); history.go(0); }else{ location.replace(url); } }</script>");
				out.println("<script>alert('회원정보가 수정되었습니다.'); locationReplace('/member/modify.do'); </script>");
				out.flush();
				return;
			}
			
		}
	}
	
	//===============================================================================================================
	// * 주소록 액션
	//===============================================================================================================
	@RequestMapping(value = "/member/addrAction.do")
	public void MemberaddrAction(
			@ModelAttribute("BaseMemberVO") BaseMemberVO baseMemberVO, 
			ModelMap model, 
			HttpServletRequest request, 
			HttpServletResponse response
			) throws Exception {
		
		//------------------------------------------------------------------------------------------------------------------------------
		// 세션체크한다. - 로그인전 페이지용
		HttpSession session = request.getSession(true);
		String user_sess_id = (String) session.getAttribute("user_id");
		if(user_sess_id != null && user_sess_id != "" ) {
			
			//수정모드
			String user_id  = user_sess_id;
			String action_mode = request.getParameter("action_mode");
			String addr_seq = request.getParameter("addr_seq");
			String addr_nm = request.getParameter("addr_nm");
			String addr_zip = request.getParameter("addr_zip");
			String addr_addr1 = request.getParameter("addr_addr1");
			String addr_addr2 = request.getParameter("addr_addr2");
			
			baseMemberVO.setuser_id(user_id);
			baseMemberVO.setaddr_seq(addr_seq);
			baseMemberVO.setaddr_nm(addr_nm);
			baseMemberVO.setaddr_zip(addr_zip);
			baseMemberVO.setaddr_1(addr_addr1);
			baseMemberVO.setaddr_2(addr_addr2);
			
			System.out.println("==================");
			System.out.println(action_mode);
			System.out.println("==================");

			switch(action_mode) {
				case "insert" : baseMemberService.set_addr_insert(baseMemberVO); break;
				case "modify" : baseMemberService.set_addr_update(baseMemberVO); break;
				case "delete" : baseMemberService.set_addr_delete(baseMemberVO); break;
			}
			
			baseMemberVO.setuser_id(user_sess_id);
			BaseMemberVO member_info = baseMemberService.get_site_user_info(baseMemberVO);
			model.addAttribute("memberInfo", member_info);
			
			List<BaseMemberVO> addr_list = baseMemberService.get_order_addr_list(baseMemberVO);
			model.addAttribute("addrList", addr_list);
			
			String add_seq = "";
			if(!action_mode.equals("modify")) {
				add_seq = "?addr_seq="+addr_seq;
			}
				
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>function locationReplace(url){ if(history.replaceState){ history.replaceState(null, document.title, url); history.go(0); }else{ location.replace(url); } }</script>");
			out.println("<script>alert('처리되었습니다.'); locationReplace('/member/modify.do"+add_seq+"'); </script>");
			out.flush();
			return;
			
		}
		
	}
	
	//===============================================================================================================
	// * 회원탈퇴
	//===============================================================================================================
	@RequestMapping(value = "/member/withdraw.do")
	public String Memberwithdraw(
			@ModelAttribute("BaseMemberVO") BaseMemberVO baseMemberVO, 
			ModelMap model, 
			HttpServletRequest request, 
			HttpServletResponse response
		) throws Exception {
		
		//------------------------------------------------------------------------------------------------------------------------------
		// 세션체크한다. - 로그인전 페이지용
		HttpSession session = request.getSession(true);
		String user_sess_id = (String) session.getAttribute("user_id");
		if(user_sess_id != null && user_sess_id != "" ) {
			
			baseMemberVO.setuser_id(user_sess_id);
			BaseMemberVO member_info = baseMemberService.get_site_user_info(baseMemberVO);
			model.addAttribute("memberInfo", member_info);
		
		}
		
		return "/baseScmtour/baseMember/withdraw";
	}
	
	//===============================================================================================================
	// * 회원탈퇴 액션
	//===============================================================================================================
	@RequestMapping(value = "/member/withdrawAction.do")
	public void MemberwithdrawAction(
			@ModelAttribute("BaseMemberVO") BaseMemberVO baseMemberVO, 
			ModelMap model, 
			HttpServletRequest request, 
			HttpServletResponse response
		) throws Exception {
		
		//------------------------------------------------------------------------------------------------------------------------------
		// 세션체크한다. - 로그인전 페이지용
		HttpSession session = request.getSession(true);
		String user_sess_id = (String) session.getAttribute("user_id");
		
		if(user_sess_id != null && user_sess_id != "" ) {
			
			String withdraw_reason = request.getParameter("withdraw_reason");
			String withdraw_reason_text = request.getParameter("withdraw_reason_text");
			
			baseMemberVO.setuser_id(user_sess_id);
			baseMemberVO.setwithdraw_reason(withdraw_reason);
			baseMemberVO.setwithdraw_reason_text(withdraw_reason_text);
			baseMemberService.set_member_out(baseMemberVO);
			//처리
			
			//세션날림 - 로그아웃으로 이동
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>function locationReplace(url){ if(history.replaceState){ history.replaceState(null, document.title, url); history.go(0); }else{ location.replace(url); } }</script>");
			out.println("<script>alert('탈퇴가 완료되었습니다.'); locationReplace('/member/logOut.do'); </script>");
			out.flush();
			return;
			
		} else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>function locationReplace(url){ if(history.replaceState){ history.replaceState(null, document.title, url); history.go(0); }else{ location.replace(url); } }</script>");
			out.println("<script>alert('로그인 상태가 아닙니다.'); locationReplace('/'); </script>");
			out.flush();
			return;
		}
		
	}
}
