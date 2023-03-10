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
	// * ????????? ??????
	//===============================================================================================================
	@Autowired
    private FacebookConnectionFactory connectionFactory;
    @Autowired
    private OAuth2Parameters oAuth2Parameters;
    
    
    
	//mypage ????????????
	@RequestMapping(value = "/mypage.do")
	public String mypage(
			ModelMap model, 
			HttpServletRequest request, 
			HttpServletResponse response
			
		)throws Exception {
		
		
		
		
		
		return "/baseScmtour/E_mypage/mypage";
	}
	
	//mypage ??????????????????
	@RequestMapping(value = "/mypage_detail.do")
	public String mypage_detail(
			ModelMap model, 
			HttpServletRequest request, 
			HttpServletResponse response
			
		)throws Exception {
		
		
		
		
		
		return "/baseScmtour/E_mypage/mypage_detail";
	}
	
	//mypage ????????????
	@RequestMapping(value = "/mypage_coupon.do")
	public String mypage_coupon(
			ModelMap model, 
			HttpServletRequest request, 
			HttpServletResponse response
			
		)throws Exception {
		
		
		
		
		
		return "/baseScmtour/E_mypage/mypage_coupon";
	}
	
	//mypage ?????????
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
	
	//mypage ????????????
	@RequestMapping(value = "/mypage_review.do")
	public String mypage_review(
			ModelMap model, 
			HttpServletRequest request, 
			HttpServletResponse response
			
		)throws Exception {
		
		
		
		
		
		return "/baseScmtour/E_mypage/mypage_review";
	}
	
	//mypage ????????????
	@RequestMapping(value = "/mypage_cancel.do")
	public String mypage_cancel(
			ModelMap model, 
			HttpServletRequest request, 
			HttpServletResponse response
			
		)throws Exception {
		
		
		
		
		
		return "/baseScmtour/E_mypage/mypage_cancel";
	}
    
    
	//mypage ??????????????????
	@RequestMapping(value = "/mypage_modify.do")
	public String mypage_modify(
			@ModelAttribute("BaseShopVO") BaseShopVO baseShopVO, 
			@ModelAttribute("BaseMemberVO") BaseMemberVO baseMemberVO, 
			ModelMap model, 
			HttpServletRequest request, 
			HttpServletResponse response
			
		)throws Exception {
		// ??????????????????. - ???????????? ????????????
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
			//??????????????? ????????? ????????????.
			model.addAttribute("addrList", baseShopService.get_cart_addr_list(baseShopVO));
		System.out.println("11111111111111111");
		
		}
		return "/baseScmtour/E_mypage/mypage_modify";
	}
    	
	
	//??????????????????
	@RequestMapping(value = "/join_step1.do")
	public String join_step1(
			@ModelAttribute("BaseMemberVO") BaseMemberVO baseMemberVO, 
			ModelMap model, 
			HttpServletRequest request, 
			HttpServletResponse response
		) throws Exception {

		//------------------------------------------------------------------------------------------------------------------------------
		// ??????????????????. - ???????????? ????????????
		HttpSession session = request.getSession(true);
		String user_sess_id = (String) session.getAttribute("user_id");
		if(user_sess_id != null && user_sess_id != "" ) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('?????? ??????????????? ????????????.'); history.back(); </script>");
			out.flush();
			return null;
		}
		//------------------------------------------------------------------------------------------------------------------------------
		
		
		
		
		
		return "/baseScmtour/E_member/join_step1";
	}

	
	//??????????????????
	@RequestMapping(value = "/join_step2.do")
	public String join_step2(
			@ModelAttribute("BaseMemberVO") BaseMemberVO baseMemberVO, 
			ModelMap model, 
			HttpServletRequest request, 
			HttpServletResponse response
		) throws Exception {

		//------------------------------------------------------------------------------------------------------------------------------
		// ??????????????????. - ???????????? ????????????
		HttpSession session = request.getSession(true);
		String user_sess_id = (String) session.getAttribute("user_id");
		if(user_sess_id != null && user_sess_id != "" ) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('?????? ??????????????? ????????????.'); history.back(); </script>");
			out.flush();
			return null;
		}
		//------------------------------------------------------------------------------------------------------------------------------
		
		
		
		return "/baseScmtour/E_member/join_step2";
	}
	
	//?????????
	@RequestMapping(value = "/login.do")
	public String login(
			@ModelAttribute("BaseMemberVO") BaseMemberVO baseMemberVO, 
			@ModelAttribute("AdmgrConfigVO") AdmgrConfigVO admgrConfigVO, 
			ModelMap model, 
			HttpServletRequest request, 
			HttpServletResponse response
		) throws Exception {
		
		//------------------------------------------------------------------------------------------------------------------------------
		// ??????????????????. - ???????????? ????????????
		HttpSession session = request.getSession(true);
		String user_sess_id = (String) session.getAttribute("user_id");
		if(user_sess_id != null && user_sess_id != "" ) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('?????? ??????????????? ????????????.'); history.back(); </script>");
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
		
		// ???????????? ??????
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
		// ??????????????????. - ???????????? ????????????
		HttpSession session = request.getSession(true);
		String user_sess_id = (String) session.getAttribute("user_id");
		if(user_sess_id != null && user_sess_id != "" ) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('?????? ??????????????? ????????????.'); history.back(); </script>");
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
		
		// ???????????? ??????
		 OAuth2Operations oauthOperations = connectionFactory.getOAuthOperations();
        String facebook_url = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, oAuth2Parameters);
    
        model.addAttribute("facebook_url", facebook_url);
        //System.out.println("/facebook" + facebook_url);
        
		return "/baseScmtour/baseMember/joinLogin";
	}
	
	//===============================================================================================================
	// * ?????????
	//===============================================================================================================
	@RequestMapping(value = "/member/login.do")
	public String Memberlogin(
			@ModelAttribute("BaseMemberVO") BaseMemberVO baseMemberVO, 
			ModelMap model, 
			HttpServletRequest request, 
			HttpServletResponse response
		) throws Exception {

		//------------------------------------------------------------------------------------------------------------------------------
		// ??????????????????. - ???????????? ????????????
		HttpSession session = request.getSession(true);
		String user_sess_id = (String) session.getAttribute("user_id");
		if(user_sess_id != null && user_sess_id != "" ) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('?????? ??????????????? ????????????.'); history.back(); </script>");
			out.flush();
			return null;
		}
		//------------------------------------------------------------------------------------------------------------------------------
		
		return "/baseScmtour/baseMember/login";
	}

	//===============================================================================================================
	// * ????????????
	//===============================================================================================================
	@RequestMapping(value = "/member/join.do")
	public String Memberjoin(
			@ModelAttribute("BaseMemberVO") BaseMemberVO baseMemberVO, 
			ModelMap model, 
			HttpServletRequest request, 
			HttpServletResponse response
		) throws Exception {

		//------------------------------------------------------------------------------------------------------------------------------
		// ??????????????????. - ???????????? ????????????
		HttpSession session = request.getSession(true);
		String user_sess_id = (String) session.getAttribute("user_id");
		if(user_sess_id != null && user_sess_id != "" ) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('?????? ??????????????? ????????????.'); history.back(); </script>");
			out.flush();
			return null;
		}
		//------------------------------------------------------------------------------------------------------------------------------
		
		return "/baseScmtour/baseMember/join";
	}

	//===============================================================================================================
	// * ??????????????? - ????????????
	//===============================================================================================================
	@RequestMapping(value = "/member/loginAction.do")
	public void MemberloginAction(
			@ModelAttribute("BaseMemberVO") BaseMemberVO baseMemberVO, 
			ModelMap model, 
			HttpServletRequest request, 
			HttpServletResponse response
		) throws Exception {

		//------------------------------------------------------------------------------------------------------------------------------
		// ??????????????????. - ???????????? ????????????
		System.out.println("111111111111111111111111111111111111111111111111111");
		System.out.println("111111111111111111111111111111111111111111111111111");


		
		HttpSession session = request.getSession(true);
		String isMobile = (String) session.getAttribute("isMobile");
		String isApp = (String) session.getAttribute("isApp");
		System.out.println(isApp);
		String user_sess_id = (String) session.getAttribute("user_id");
		System.out.println("111111111111111111111111111111111111111111111111111");
		System.out.println("???????????????????????????????");
		if(user_sess_id != null && user_sess_id != "" ) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('?????? ??????????????? ????????????.'); history.back(); </script>");
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
			out.println("<script>alert('???????????? ??????????????? ????????? ????????? ?????????.'); history.back(); </script>");
			out.flush();
			return;
		}
		if(inuserPw == null || inuserPw == "") {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('???????????? ??????????????? ????????? ????????? ?????????.'); history.back(); </script>");
			out.flush();
			return;
		}
		//?????? ?????????
		if(inuserPw != "" && inuserPw != null) {
			inuserPw = BaseService.encPasswd(inuserId, inuserPw);
		}
		
		baseMemberVO.setuser_id(inuserId);
		baseMemberVO.setuser_pwd(inuserPw);
		BaseMemberVO loginCheck = baseMemberService.normal_login_check(baseMemberVO);
		
		//????????? ??????
		if(loginCheck != null) {
			String user_id = loginCheck.getuser_id();
			String user_nm = loginCheck.getuser_nm();
			String user_level = loginCheck.getuser_level();
			String user_hp = loginCheck.getuser_hp();
			String user_email = loginCheck.getuser_email();
			String user_type = loginCheck.getuser_join_fl();
	
			if(user_type.equals("normal")) {
				user_type = "N";	//?????????????????????
			} else {
				user_type = "S";	//????????????
			}

			// ????????? ??????????????????.. ????????? ?????????.
			baseMemberService.insert_login_member(baseMemberVO);

			// ????????????
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
				System.out.println("???????????????");
			} else {
				//out.println("<script>function locationReplace(url){ if(history.replaceState){ history.replaceState(null, document.title, url); history.go(0); }else{ location.replace(url); } }</script>");
				out.println("<script>locationReplace('/index.do');</script>");
				System.out.println("???????????????11111111111111111");
			}
			out.flush();
			return;
			
		} else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('?????????????????? ?????? ????????????\\n\\n?????? ??????????????? ?????????.'); history.back(); </script>");
			out.flush();
			return;
		}
		
	}
	//===============================================================================================================
	// * ??????????????? - ????????????
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
				user_type = "N";	//?????????????????????
			} else {
				user_type = "S";	//
			}
	
			// ????????? ??????????????????.. ????????? ?????????.
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
			out.println("{\"msg\":\"???????????? ?????????????????????.\",\"result\":\"success\"}");
			out.flush();
			return;
			
		} else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("{\"msg\":\"????????? ????????? ????????????.\",\"result\":\"fail\"}");
			out.flush();
			return;
		}
		
	}
	
	//===============================================================================================================
	// * ???????????? ??????
	//===============================================================================================================
	@RequestMapping(value = "/member/joinAction.do")
	public void MemberjoinAction(
			@ModelAttribute("BaseMemberVO") BaseMemberVO baseMemberVO, 
			ModelMap model, 
			HttpServletRequest request, 
			HttpServletResponse response
		) throws Exception {

		//------------------------------------------------------------------------------------------------------------------------------
		// ??????????????????. - ???????????? ????????????
		HttpSession session = request.getSession(true);
		String user_sess_id = (String) session.getAttribute("user_id");
		if(user_sess_id != null && user_sess_id != "" ) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('?????? ??????????????? ????????????.'); history.back(); </script>");
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
			out.println("<script>alert('?????????????????? ??????????????????.'); history.back(); </script>");
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
		out.println("<script>alert('?????????????????????. ??????????????? ?????????.'); locationReplace('/login.do');</script>");
		out.flush();
		return;
		
	}

	//===============================================================================================================
	// * ???????????? (????????? ?????? ??????)
	//===============================================================================================================
	@RequestMapping(value = "/Ajax/idCheck.do")
	public String Memberidchek(
			@ModelAttribute("BaseMemberVO") BaseMemberVO baseMemberVO, 
			ModelMap model, 
			HttpServletRequest request, 
			HttpServletResponse response
		) throws Exception {
		
		String res = "?????? ????????? ????????? ?????????.";
		String user_id = request.getParameter("user_id");
		
		baseMemberVO.setuser_id(user_id);
		int idCheck = baseMemberService.is_member_id(baseMemberVO);
		
		
		if(idCheck>0) {
				res = "????????? ????????? ?????????.";
		
		}
		model.addAttribute("result", res);
		
		return "/baseScmtour/AjaxResult/checkid"; 
		
	}

	

	//===============================================================================================================
	// * ????????????
	//===============================================================================================================
	@RequestMapping(value = "/member/logOut.do")
	public void MemberjoinLogOut(
			@ModelAttribute("BaseMemberVO") BaseMemberVO baseMemberVO, 
			ModelMap model, 
			HttpServletRequest request, 
			HttpServletResponse response
		) throws Exception {

		//------------------------------------------------------------------------------------------------------------------------------
		// ???????????? ????????????
		HttpSession session = request.getSession(false);
		String isMobile = (String) session.getAttribute("isMobile");
		String isApp = (String) session.getAttribute("isApp");
		if(session==null || session.isNew()){
			//response.sendError(400);
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('?????????????????? ????????????'); history.back();</script>");
			out.flush();
			return;
		}
		//???????????????
		session.invalidate();
		//------------------------------------------------------------------------------------------------------------------------------
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if(isApp.equals("1")) {
			
			out.println("<script>alert('??????????????? ????????????');location.href='/index.do'</script>");
			//out.println("<script>location.href='app://dtoursc?control=logout'</script>");
		} else {
			out.println("<script>function locationReplace(url){ if(history.replaceState){ history.replaceState(null, document.title, url); history.go(0); }else{ location.replace(url); } }</script>");
			out.println("<script>locationReplace('/index.do');</script>");
		}
		out.flush();
		return;
	
	}
	
	
	
	//===============================================================================================================
	// * ????????? ??????
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
	// * ???????????? ??????
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
				//??? ???????????? ????????????
				baseMemberVO.setuser_pwd(new_user_pw);
				baseMemberService.passwd_update(baseMemberVO);
				//??????????????? - ???????????? ????????? ?????????.
				String sms_msg = "??????????????? - ["+user_id+"]?????? ??????????????? ["+inuserPw+"]?????? ?????????????????????.";
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
	// * ????????? - ??????
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
			out.println("<script>alert('???????????? ????????? ????????? ?????????.'); history.back(); </script>");
			out.flush();
			return null;
		} else {
			//????????? ????????? ajax??? ?????????
			return "/baseScmtour/baseMember/favoriteReserveList";
		}
	}

	//===============================================================================================================
	// * ????????? - ??????
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
			out.println("<script>alert('???????????? ????????? ????????? ?????????.'); history.back(); </script>");
			out.flush();
			return null;
		} else {
			//????????? ????????? ajax??? ?????????
			return "/baseScmtour/baseMember/favoriteMarketList";
		}
	}

	//===============================================================================================================
	// * ?????????????????? ??????
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
			out.println("<script>alert('?????? ??????????????? ????????????.'); history.back(); </script>");
			out.flush();
			return;
		} else {
			AdmgrConfigVO SiteBaseConfig = admgrConfigService.get_base_config(null);
			model.addAttribute("SiteBaseConfig",SiteBaseConfig);
			String naver_cid = SiteBaseConfig.getsns_naver_cid();
			String naver_ckey = SiteBaseConfig.getsns_naver_ckey();
			//????????? ????????? ??????
			String clientId = naver_cid;//?????????????????? ??????????????? ????????????";
		    String clientSecret = naver_ckey;//?????????????????? ??????????????? ????????????";
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
		      if(responseCode==200) { // ?????? ??????
		        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		      } else {  // ?????? ??????
		        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		      }
		      String inputLine;
		      StringBuffer res = new StringBuffer();
		      while ((inputLine = br.readLine()) != null) {
		        res.append(inputLine);
		      }
		      br.close();
			  if(responseCode==200) {
				// access_token ??? ??????
				JSONParser parsing = new JSONParser();
				Object resObj = parsing.parse(res.toString());
				JSONObject resJsonObj = (JSONObject)resObj;

				access_token = (String)resJsonObj.get("access_token");
				refresh_token = (String)resJsonObj.get("refresh_token");

				// ???????????? ?????? API 1.
			    String token = access_token; // ????????? ????????? ?????? ??????;
			    String header = "Bearer " + token; // Bearer ????????? ?????? ??????
			    String pInfoApiURL = "https://openapi.naver.com/v1/nid/me";

			    Map<String, String> requestHeaders = new HashMap<>();
			    requestHeaders.put("Authorization", header);
			    String responseBody = get(pInfoApiURL,requestHeaders);

			    // ????????? ?????? ??????
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
			    /* ???????????? ?????????... ???..
			    if(!jsonresponseObj.get("email").equals(null) && !jsonresponseObj.get("email").equals("")) {
			    	naver_email = jsonresponseObj.get("email").toString();
			    }
			    */
			    if(naver_id == null || naver_id == "") {
					response.setContentType("text/html; charset=UTF-8");
					PrintWriter out = response.getWriter();
					out.println("<script>alert('?????????????????? ??????????????? ???????????? ??????????????????. ??????????????? ??????????????? ?????????.'); history.back(); </script>");
					out.flush();
					return;
				}
			    
			    //????????????????????? ????????????????????? ????????? ?????????.
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
				String user_type = "S";	//????????????

				//????????? ???????????? ????????????.
			    int isCnt = baseMemberService.is_member_id(baseMemberVO);
			    if(isCnt == 0 ) {
			    	//???????????????
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
					
					// ????????? ??????????????????.. ????????? ?????????.
					baseMemberService.insert_login_member(baseMemberVO);
					
					response.setContentType("text/html; charset=UTF-8");
					PrintWriter out = response.getWriter();
					out.println("<script>function locationReplace(url){ if(history.replaceState){ history.replaceState(null, document.title, url); history.go(0); }else{ location.replace(url); } }</script>");
					out.println("<script>alert('??????????????? ???????????????.'); locationReplace('"+return_url+"');</script>");
					out.flush();
					return;
				
			    } else { 
			    	
					//?????? ???????????? ??????????????????.
					session.setAttribute("user_id", naver_id);
					session.setAttribute("user_nm", naver_name);
					session.setAttribute("user_level", user_level);
					session.setAttribute("user_hp", user_hp);
					session.setAttribute("user_email", user_email);
					session.setAttribute("user_type", user_type);
					session.setAttribute("user_sns", "naver");
					
					// ????????? ??????????????????.. ????????? ?????????.
					baseMemberService.insert_login_member(baseMemberVO);
					
					response.setContentType("text/html; charset=UTF-8");
					PrintWriter out = response.getWriter();
					out.println("<script>function locationReplace(url){ if(history.replaceState){ history.replaceState(null, document.title, url); history.go(0); }else{ location.replace(url); } }</script>");
					out.println("<script>alert('????????? ???????????????.'); locationReplace('"+return_url+"'); </script>");
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
	// * ?????????????????? ?????? {
	//===============================================================================================================
	private static String get(String apiUrl, Map<String, String> requestHeaders){ 
	    HttpURLConnection con = connect(apiUrl);
	    try {
	        con.setRequestMethod("GET");
	        for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
	            con.setRequestProperty(header.getKey(), header.getValue());
	        }

	        int responseCode = con.getResponseCode();
	        if (responseCode == HttpURLConnection.HTTP_OK) { // ?????? ??????
	            return readBody(con.getInputStream());
	        } else { // ?????? ??????
	            return readBody(con.getErrorStream());
	        }
	    } catch (IOException e) {
	        throw new RuntimeException("API ????????? ?????? ??????", e);
	    } finally {
	        con.disconnect();
	    }
	} 
	private static HttpURLConnection connect(String apiUrl){ 
	    try {
	        URL url = new URL(apiUrl);
	        return (HttpURLConnection)url.openConnection();
	    } catch (MalformedURLException e) {
	        throw new RuntimeException("API URL??? ?????????????????????. : " + apiUrl, e);
	    } catch (IOException e) {
	        throw new RuntimeException("????????? ??????????????????. : " + apiUrl, e);
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
	        throw new RuntimeException("API ????????? ????????? ??????????????????.", e);
	    }
	}
	//===============================================================================================================
	// * } ?????????????????? ?????? 
	//===============================================================================================================

	
	//===============================================================================================================
	// * ?????????????????? ??????
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
			out.println("<script>alert('?????? ??????????????? ????????????.'); history.back(); </script>");
			out.flush();
			return;
		} else {
			AdmgrConfigVO SiteBaseConfig = admgrConfigService.get_base_config(null);
			String client_id = SiteBaseConfig.getsns_daum_ckey();
			
			model.addAttribute("SiteBaseConfig",SiteBaseConfig);
			String code = request.getParameter("code");
			
			JsonNode accessToken;
			 
	        // JsonNode??????????????? ??????????????????
	        JsonNode jsonToken = getKakaoAccessToken(code, client_id);
	        // ?????? json?????? ??? access_token??? ????????????
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
				out.println("<script>alert('?????????????????? ??????????????? ???????????? ??????????????????. ??????????????? ??????????????? ?????????.'); history.back(); </script>");
				out.flush();
				return;
			}
	 
	        // ???????????? ??????????????? ???????????? Get properties
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
			String user_type = "S";	//????????????
			
			//????????? ???????????? ????????????.
		    int isCnt = baseMemberService.is_member_id(baseMemberVO);
		    if(isCnt == 0 ) {
		    	//???????????????
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
				
				// ????????? ??????????????????.. ????????? ?????????.
				baseMemberService.insert_login_member(baseMemberVO);
				
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>function locationReplace(url){ if(history.replaceState){ history.replaceState(null, document.title, url); history.go(0); }else{ location.replace(url); } }</script>");
				out.println("<script>alert('??????????????? ???????????????.'); locationReplace('"+return_url+"');</script>");
				out.flush();
				return;
			
		    } else { 
		    	
				//?????? ???????????? ??????????????????.
				session.setAttribute("user_id", kakao_id);
				session.setAttribute("user_nm", kakao_name);
				session.setAttribute("user_level", user_level);
				session.setAttribute("user_hp", user_hp);
				session.setAttribute("user_email", kakao_email);
				session.setAttribute("user_type", user_type);
				session.setAttribute("user_sns", "kakao");
				
				// ????????? ??????????????????.. ????????? ?????????.
				baseMemberService.insert_login_member(baseMemberVO);

				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>function locationReplace(url){ if(history.replaceState){ history.replaceState(null, document.title, url); history.go(0); }else{ location.replace(url); } }</script>");
				out.println("<script>alert('????????? ???????????????.'); locationReplace('"+return_url+"'); </script>");
				out.flush();
				return;
		    }

		}
	}
	//===============================================================================================================
	// * ?????????????????? ?????? {
	//===============================================================================================================
	public static JsonNode getKakaoAccessToken(String code, String client_id) {
		 
        final String RequestUrl = "https://kauth.kakao.com/oauth/token"; // Host
        final List<NameValuePair> postParams = new ArrayList<NameValuePair>();
 
        postParams.add(new BasicNameValuePair("grant_type", "authorization_code"));
        postParams.add(new BasicNameValuePair("client_id", client_id)); // REST API KEY
        postParams.add(new BasicNameValuePair("redirect_uri", "https://www.scmtour.com/actionKakaoLogin.do")); // ??????????????? URI
        //postParams.add(new BasicNameValuePair("redirect_uri", "http://220.123.69.229:8888/actionKakaoLogin.do")); // ??????????????? URI
        postParams.add(new BasicNameValuePair("code", code)); // ????????? ????????? ?????? code ???
 
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
 
            // JSON ?????? ????????? ??????
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
 
            // JSON ?????? ????????? ??????
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
	// * } ?????????????????? ?????? 
	//===============================================================================================================


	//===============================================================================================================
	// * ???????????? ??????
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
			out.println("<script>alert('?????? ??????????????? ????????????.'); history.back(); </script>");
			out.flush();
			return;
		} else {
			AdmgrConfigVO SiteBaseConfig = admgrConfigService.get_base_config(null);
			
			String user_hp = "";
			String user_email = "";
			String user_level = "2";
			String user_st = "Y";
			String user_type = "S";	//????????????
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
	                System.out.println("??????????????? : " + userProfile.getEmail());
	                System.out.println("?????? id : " + userProfile.getId());
	                System.out.println("?????? name : " + userProfile.getName());
	                */
	                
	                //?????? ??? ???????????????
	                String fb_id =  userProfile.getId();
	                String fb_name =  userProfile.getName();
	                String fb_email =  userProfile.getEmail();
	                
	                //????????????????????? ????????????????????? ????????? ?????????.
				    baseMemberVO.setuser_join_fl("facebook");
				    baseMemberVO.setuser_id(fb_id);
				    baseMemberVO.setuser_nm(fb_name);
				    baseMemberVO.setuser_nm(fb_email);
				    
				    //????????? ???????????? ????????????.
				    int isCnt = baseMemberService.is_member_id(baseMemberVO);
				    
				    if(isCnt == 0 ) {
				    	//???????????????
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
						
						// ????????? ??????????????????.. ????????? ?????????.
						baseMemberService.insert_login_member(baseMemberVO);
						
						response.setContentType("text/html; charset=UTF-8");
						PrintWriter out = response.getWriter();
						out.println("<script>function locationReplace(url){ if(history.replaceState){ history.replaceState(null, document.title, url); history.go(0); }else{ location.replace(url); } }</script>");
						out.println("<script>alert('??????????????? ???????????????.'); locationReplace('"+return_url+"');</script>");
						out.flush();
						return;
					
				    } else { 
				    	
						//?????? ???????????? ??????????????????.
				    	session.setAttribute("user_id", fb_id);
						session.setAttribute("user_nm", fb_name);
						session.setAttribute("user_level", user_level);
						session.setAttribute("user_hp", user_hp);
						session.setAttribute("user_email", fb_email);
						session.setAttribute("user_type", user_type);
						session.setAttribute("user_sns", "facebook");
						
						// ????????? ??????????????????.. ????????? ?????????.
						baseMemberService.insert_login_member(baseMemberVO);
						
						response.setContentType("text/html; charset=UTF-8");
						PrintWriter out = response.getWriter();
						out.println("<script>function locationReplace(url){ if(history.replaceState){ history.replaceState(null, document.title, url); history.go(0); }else{ location.replace(url); } }</script>");
						out.println("<script>alert('????????? ???????????????.'); locationReplace('"+return_url+"'); </script>");
						out.flush();
						return;
				    }
	                
	            } catch (MissingAuthorizationException e) {
	            	response.setContentType("text/html; charset=UTF-8");
					PrintWriter out = response.getWriter();
					out.println("<script>function locationReplace(url){ if(history.replaceState){ history.replaceState(null, document.title, url); history.go(0); }else{ location.replace(url); } }</script>");
					out.println("<script>alert('???????????? ????????????.(0)'); locationReplace('/member/joinLogin.do?return_url="+URLEncoder.encode(return_url, "UTF-8")+"'); </script>");
					out.flush();
					return;
	            }
	 
	        
	        } catch (Exception e) {
	        	response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>function locationReplace(url){ if(history.replaceState){ history.replaceState(null, document.title, url); history.go(0); }else{ location.replace(url); } }</script>");
				out.println("<script>alert('???????????? ????????????.(1)'); locationReplace('/member/joinLogin.do?return_url="+URLEncoder.encode(return_url, "UTF-8")+"'); </script>");
				out.flush();
				return;
	        }
			
		}
	}

	//===============================================================================================================
	// * ??????????????? ??????
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
			out.println("<script>alert('?????? ??????????????? ????????????.'); history.back(); </script>");
			out.flush();
			return;
		} else {
			AdmgrConfigVO SiteBaseConfig = admgrConfigService.get_base_config(null);
			
			String user_hp = "";
			String user_email = "";
			String user_level = "2";
			String user_st = "Y";
			String user_type = "S";	//????????????
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
	        
	        if(user != null && user != "") {	// ??? ????????? ????????? ???????????? ????????? ?????????.. appleid.apple.com?????? ??????????????? ?????? ?????????.
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
	
	        if(apple_id != null && apple_id != "") { //?????? ?????? ??????.
	        	
				baseMemberVO.setuser_join_fl("apple");
			    baseMemberVO.setuser_id(apple_id);
			    baseMemberVO.setuser_nm(apple_name);
			    baseMemberVO.setuser_nm(apple_email);
			    
			  //????????? ???????????? ????????????.
			    int isCnt = baseMemberService.is_member_id(baseMemberVO);
			    
			    if(isCnt == 0 ) {
			    	//???????????????
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
					
					// ????????? ??????????????????.. ????????? ?????????.
					baseMemberService.insert_login_member(baseMemberVO);
					
					response.setContentType("text/html; charset=UTF-8");
					PrintWriter out = response.getWriter();
					out.println("<script>function locationReplace(url){ if(history.replaceState){ history.replaceState(null, document.title, url); history.go(0); }else{ location.replace(url); } }</script>");
					out.println("<script>alert('??????????????? ???????????????.'); locationReplace('"+return_url+"');</script>");
					out.flush();
					return;
				
			    } else { 
					//?????? ???????????? ??????????????????.
			    	session.setAttribute("user_id", apple_id);
					session.setAttribute("user_nm", apple_name);
					session.setAttribute("user_level", user_level);
					session.setAttribute("user_hp", user_hp);
					session.setAttribute("user_email", apple_email);
					session.setAttribute("user_type", user_type);
					session.setAttribute("user_sns", "apple");
					
					// ????????? ??????????????????.. ????????? ?????????.
					baseMemberService.insert_login_member(baseMemberVO);
					
					response.setContentType("text/html; charset=UTF-8");
					PrintWriter out = response.getWriter();
					out.println("<script>function locationReplace(url){ if(history.replaceState){ history.replaceState(null, document.title, url); history.go(0); }else{ location.replace(url); } }</script>");
					out.println("<script>alert('????????? ???????????????.'); locationReplace('"+return_url+"'); </script>");
					out.flush();
					return;
			    }
				 
				 
			} else {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>function locationReplace(url){ if(history.replaceState){ history.replaceState(null, document.title, url); history.go(0); }else{ location.replace(url); } }</script>");
				out.println("<script>alert('???????????? ????????????.(0)'); locationReplace('/member/joinLogin.do?return_url="+URLEncoder.encode(return_url, "UTF-8")+"'); </script>");
				out.flush();
				return;
			}

        }
	}

	
	//===============================================================================================================
	// * ??????????????????
	//===============================================================================================================
	@RequestMapping(value = "/member/modify.do")
	public String Membermodify(
			@ModelAttribute("BaseMemberVO") BaseMemberVO baseMemberVO, 
			ModelMap model, 
			HttpServletRequest request, 
			HttpServletResponse response
		) throws Exception {
		
		//------------------------------------------------------------------------------------------------------------------------------
		// ??????????????????. - ???????????? ????????????
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
	// * ??????????????????
	//===============================================================================================================
	@RequestMapping(value = "/member/modifyAction.do")
	public void MembermodifyAction(
			@ModelAttribute("BaseMemberVO") BaseMemberVO baseMemberVO, 
			ModelMap model, 
			HttpServletRequest request, 
			HttpServletResponse response
			) throws Exception {
		
		//------------------------------------------------------------------------------------------------------------------------------
		// ??????????????????. - ???????????? ????????????
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
				//???????????? ??????
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
				out.println("<script>alert('??????????????? ?????????????????????. ?????? ???????????? ???????????????.'); locationReplace('/member/logOut.do'); </script>");
				out.flush();
				return;
			} else {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>function locationReplace(url){ if(history.replaceState){ history.replaceState(null, document.title, url); history.go(0); }else{ location.replace(url); } }</script>");
				out.println("<script>alert('??????????????? ?????????????????????.'); locationReplace('/member/modify.do'); </script>");
				out.flush();
				return;
			}
			
		}
	}
	
	//===============================================================================================================
	// * ????????? ??????
	//===============================================================================================================
	@RequestMapping(value = "/member/addrAction.do")
	public void MemberaddrAction(
			@ModelAttribute("BaseMemberVO") BaseMemberVO baseMemberVO, 
			ModelMap model, 
			HttpServletRequest request, 
			HttpServletResponse response
			) throws Exception {
		
		//------------------------------------------------------------------------------------------------------------------------------
		// ??????????????????. - ???????????? ????????????
		HttpSession session = request.getSession(true);
		String user_sess_id = (String) session.getAttribute("user_id");
		if(user_sess_id != null && user_sess_id != "" ) {
			
			//????????????
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
			out.println("<script>alert('?????????????????????.'); locationReplace('/member/modify.do"+add_seq+"'); </script>");
			out.flush();
			return;
			
		}
		
	}
	
	//===============================================================================================================
	// * ????????????
	//===============================================================================================================
	@RequestMapping(value = "/member/withdraw.do")
	public String Memberwithdraw(
			@ModelAttribute("BaseMemberVO") BaseMemberVO baseMemberVO, 
			ModelMap model, 
			HttpServletRequest request, 
			HttpServletResponse response
		) throws Exception {
		
		//------------------------------------------------------------------------------------------------------------------------------
		// ??????????????????. - ???????????? ????????????
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
	// * ???????????? ??????
	//===============================================================================================================
	@RequestMapping(value = "/member/withdrawAction.do")
	public void MemberwithdrawAction(
			@ModelAttribute("BaseMemberVO") BaseMemberVO baseMemberVO, 
			ModelMap model, 
			HttpServletRequest request, 
			HttpServletResponse response
		) throws Exception {
		
		//------------------------------------------------------------------------------------------------------------------------------
		// ??????????????????. - ???????????? ????????????
		HttpSession session = request.getSession(true);
		String user_sess_id = (String) session.getAttribute("user_id");
		
		if(user_sess_id != null && user_sess_id != "" ) {
			
			String withdraw_reason = request.getParameter("withdraw_reason");
			String withdraw_reason_text = request.getParameter("withdraw_reason_text");
			
			baseMemberVO.setuser_id(user_sess_id);
			baseMemberVO.setwithdraw_reason(withdraw_reason);
			baseMemberVO.setwithdraw_reason_text(withdraw_reason_text);
			baseMemberService.set_member_out(baseMemberVO);
			//??????
			
			//???????????? - ?????????????????? ??????
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>function locationReplace(url){ if(history.replaceState){ history.replaceState(null, document.title, url); history.go(0); }else{ location.replace(url); } }</script>");
			out.println("<script>alert('????????? ?????????????????????.'); locationReplace('/member/logOut.do'); </script>");
			out.flush();
			return;
			
		} else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>function locationReplace(url){ if(history.replaceState){ history.replaceState(null, document.title, url); history.go(0); }else{ location.replace(url); } }</script>");
			out.println("<script>alert('????????? ????????? ????????????.'); locationReplace('/'); </script>");
			out.flush();
			return;
		}
		
	}
}
