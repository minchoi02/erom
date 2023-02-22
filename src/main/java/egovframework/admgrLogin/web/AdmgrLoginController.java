package egovframework.admgrLogin.web;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdmgrLoginController {
	
	@RequestMapping(value = "/admgr/admgrLogin/admgrLogin.do")
	public String admgrLogin(ModelMap model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		return "/admgr/admgrLogin/admgrLogin";
	}

	@RequestMapping(value = "/admgr/admgrLogin/admgrLoginOk.do")
	public String admgrLoginOk(ModelMap model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		return "/admgr/admgrLogin/admgrLoginOk";
	}

	@RequestMapping(value = "/admgr/admgrLogin/admgrLoginOut.do")
	public String admgrLoginOut(ModelMap model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		return "/admgr/admgrLogin/admgrLoginOut";
	}

}
