package egovframework.base.order.web;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.base.order.service.BaseOrderService;
import egovframework.base.order.service.BaseOrderVO;
import egovframework.base.service.BaseService;
import egovframework.base.shop.service.BaseShopService;
import egovframework.base.shop.service.BaseShopVO;

@Controller
public class BaseOrderController {

	@Resource(name = "BaseOrderService")
	private BaseOrderService baseOrderService;	
	
	@Resource(name = "BaseShopService")
	private BaseShopService baseShopService;	
	
	
	//=========================================================

	
	//결제
	@RequestMapping(value = "/order.do")
	public String order(
			@ModelAttribute("BaseShopVO") BaseShopVO baseShopVO, 
			ModelMap model, 
			HttpServletRequest request, 
			HttpServletResponse response
			) throws Exception {
			
			HttpSession session = request.getSession(true);
			String user_id = (String) session.getAttribute("user_id");
			String user_nm = (String) session.getAttribute("user_nm");
			String sess_id = (String) session.getId();
			String user_ip = BaseService.getRemoteIP(request);
			model.addAttribute("user_ip", user_ip);

			String order_user_zip_teset = request.getParameter("order_user_zip");
			System.out.println("==================");
			System.out.println("order_user_zip_teset : "+order_user_zip_teset);
			System.out.println("==================");

			
			String[] check_item = request.getParameterValues("check_item");
			if(check_item == null) {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('선택된 상품이 없습니다.'); location.href='/shop/cart.do'; </script>");
				out.flush();
				return null;
			}
			
			String sql_or = "(";
			String seq_or = "";
			int i = 0;
			String or = "";
			for(String val : check_item) {
				if(i == 0) { or = ""; } 
				else { or = ","; }
				sql_or += or + val;  
				seq_or += or + val;  
				i++;
			}
			sql_or += ")";
			
			if(user_id != null && user_id != "") {
				
				SimpleDateFormat todate = new SimpleDateFormat();
				SimpleDateFormat today = new SimpleDateFormat();
				
				Calendar cal = Calendar.getInstance(); 
				
				todate.applyPattern("yyyyMMddHHmmss");
				today.applyPattern("yyyy-MM-dd");
				
				String todateformat = todate.format(cal.getTime()); 
				String todayformat = today.format(cal.getTime()); 
				// 주문번호 랜덤값 만들기
				int rankey1 = (int) (Math.random() * 9)+1;
				int rankey2 = (int) (Math.random() * 9)+1;
				int rankey3 = (int) (Math.random() * 9)+1;
				int rankey4 = (int) (Math.random() * 9)+1;
				int rankey5 = (int) (Math.random() * 9)+1;
				
				//주문번호 생성
				String Order_id = "O"+todateformat+rankey1+rankey2+rankey3+rankey4+rankey5;
				model.addAttribute("order_id", Order_id);
				
				//배송비를 업데이트 하자 - 현재 생성된 주문코드로 작업
				String[] d_store_id = request.getParameterValues("d_store_id");
				String[] d_store_base = request.getParameterValues("d_store_base");
				String[] d_store_order = request.getParameterValues("d_store_order");
				String[] d_store_delivery = request.getParameterValues("d_store_delivery");
				
				
				//배송비데이터 삭제
				baseShopVO.setorder_id(Order_id);
				if(d_store_id != null) {
					for(int j=0; j<d_store_id.length; j++) {
						if(d_store_id[j] != "" && d_store_id[j] != null ) {
							baseShopVO.setstore_id(d_store_id[j]);
							baseShopVO.setosd_base(d_store_base[j]);
							baseShopVO.setosd_order_price(d_store_order[j]);
							baseShopVO.setosd_delivery_price(d_store_delivery[j]);
							baseShopService.insert_delivery_price(baseShopVO);
						}
					}
				}

				//장바구니 정보
				baseShopVO.setuser_id(user_id);
				baseShopVO.setsql_or(sql_or);
				model.addAttribute("cartcnt", baseShopService.get_cart_cnt(baseShopVO));
				
				baseShopVO.setstore_category("CD002001");
				model.addAttribute("cartList1", baseShopService.get_cart_list(baseShopVO));
				baseShopVO.setstore_category("CD002002");
				model.addAttribute("cartList2", baseShopService.get_cart_list(baseShopVO));
				baseShopVO.setstore_category("CD002003");
				model.addAttribute("cartList3", baseShopService.get_cart_list(baseShopVO));
				baseShopVO.setstore_category("CD002004");
				model.addAttribute("cartList4", baseShopService.get_cart_list(baseShopVO));
				
				String member_nm = request.getParameter("order_user_nm");
				String member_email = request.getParameter("order_user_email");
				String member_hp = request.getParameter("order_user_hp");
				String member_call = request.getParameter("order_user_call");
				String member_addr_nm = request.getParameter("addr_nm");
				String member_zip = request.getParameter("order_user_zip");
				String member_addr1 = request.getParameter("order_user_addr1");
				String member_addr2 = request.getParameter("order_user_addr2");
				String member_msg= request.getParameter("order_user_msg");
				String member_paytype= request.getParameter("order_paytype");
				String member_mileage = request.getParameter("order_mileage");
				String order_user_pay = request.getParameter("order_user_pay");
				String order_time = request.getParameter("order_time");
				
				model.addAttribute("forder_cart_seq", seq_or);
				model.addAttribute("forder_user_nm", member_nm);
				model.addAttribute("forder_user_email", member_email);
				model.addAttribute("forder_user_hp", member_hp);
				model.addAttribute("forder_user_call", member_call);
				model.addAttribute("forder_user_zip", member_zip);
				model.addAttribute("forder_user_addr1", member_addr1);
				model.addAttribute("forder_user_addr2", member_addr2);
				model.addAttribute("forder_user_message", member_msg);
				model.addAttribute("forder_paytype", member_paytype);
				model.addAttribute("forder_mileage", member_mileage);
				model.addAttribute("order_user_pay", order_user_pay);
				model.addAttribute("order_time", order_time);
				
				
				//얼렁 주소록에 저장하자.. 동의시..
				baseShopVO.setuser_id(user_id);
				String member_save = request.getParameter("member_save");
				String addr_save = request.getParameter("addr_save");
				
				if(("Y").equals(member_save)) {
					baseShopVO.setuser_nm(member_nm);
					baseShopVO.setuser_hp(member_hp);
					baseShopVO.setuser_email(member_email);
					baseShopService.add_member_info(baseShopVO);
				}
				if(("Y").equals(addr_save)) {
					baseShopVO.setaddr_nm(member_addr_nm);
					baseShopVO.setaddr_zip(member_zip);
					baseShopVO.setaddr_1(member_addr1);
					baseShopVO.setaddr_2(member_addr2);
					baseShopService.add_addr_info(baseShopVO);
				}
				
				
				//쿠폰정보
				String coupon_id = request.getParameter("order_user_coupon");
				model.addAttribute("coupon_id", coupon_id);
				baseShopVO.setcoupon_id(coupon_id);
				BaseShopVO coupon_info = baseShopService.get_site_coupon_info(baseShopVO);
				model.addAttribute("couponInfo", coupon_info);
				
				String all_total_price = request.getParameter("all_total_price");
				model.addAttribute("all_total_price", all_total_price);
				String coupon_sale_price = request.getParameter("coupon_sale_price");
				model.addAttribute("coupon_sale_price", coupon_sale_price);
				String delivery_price = request.getParameter("delivery_price");
				model.addAttribute("delivery_price", delivery_price);
			}
		return "/baseScmtour/E_order/order";
	}
		
	
	//장바구니
		@RequestMapping(value = "/cart.do")
		public String cart(
				@ModelAttribute("BaseShopVO") BaseShopVO baseShopVO,
				ModelMap model,
				HttpServletRequest request,
				HttpServletResponse response
				) throws Exception {
				System.out.println();
				HttpSession session = request.getSession(true);
				String user_id = (String) session.getAttribute("user_id");
				String sess_id = (String) session.getId();
				
				if(user_id != null && user_id != "") {
					
					//장바구니 정보
					baseShopVO.setuser_id(user_id);
					model.addAttribute("cartcnt", baseShopService.get_cart_cnt(baseShopVO));
					
					baseShopVO.setstore_category("CD002001");
					model.addAttribute("cartList1", baseShopService.get_cart_list(baseShopVO));
					baseShopVO.setstore_category("CD002002");
					model.addAttribute("cartList2", baseShopService.get_cart_list(baseShopVO));
					baseShopVO.setstore_category("CD002003");
					model.addAttribute("cartList3", baseShopService.get_cart_list(baseShopVO));
					baseShopVO.setstore_category("CD002004");
					model.addAttribute("cartList4", baseShopService.get_cart_list(baseShopVO));
					
					//장바구니의 장터상품 상점별 합 및 상점별 배송비정책 가져오기
					model.addAttribute("cartStore4", baseShopService.get_cart4_store_list(baseShopVO));
					
					//쿠폰정보
					model.addAttribute("couponList", baseShopService.get_member_coupon_list(baseShopVO));
					
					//회원주소록 정보를 호출한다.
					model.addAttribute("addrList", baseShopService.get_cart_addr_list(baseShopVO));
					
				}
			
			return "/baseScmtour/E_order/cart";
		}
		
	
	//결제완료
	@RequestMapping(value = "/order_completion.do")
	public String order_completion(
			ModelMap model, 
			HttpServletRequest request, 
			HttpServletResponse response
			
		)throws Exception {
		
		
		
		
		
		return "/baseScmtour/E_order/order_completion";
	}
		
	
	
		
	
	
	
	
}
