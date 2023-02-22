package egovframework.base.shop.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.base.shop.service.BaseShopService;
import egovframework.base.shop.service.BaseShopVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;


@Service("BaseShopService")
public class BaseShopServiceImpl extends EgovAbstractServiceImpl implements BaseShopService {

	@Resource(name="BaseShopDAO")
	private BaseShopDAO baseShopDAO;

	/** ID Generation */
	@Resource(name = "egovIdGnrService")
	private EgovIdGnrService egovIdGnrService;
	
	@Override
	public List<BaseShopVO> get_main_item_top(BaseShopVO baseShopVO) {
    	return baseShopDAO.get_main_item_top(baseShopVO);
    }

	@Override
	public BaseShopVO get_site_prod_info(BaseShopVO baseShopVO) {
		return baseShopDAO.get_site_prod_info(baseShopVO);
	}
	
	@Override
	public BaseShopVO get_site_store_info(BaseShopVO baseShopVO) {
		return baseShopDAO.get_site_store_info(baseShopVO);
	}
	
	@Override
	public List<BaseShopVO> get_site_prod_list(BaseShopVO baseShopVO) {
    	return baseShopDAO.get_site_prod_list(baseShopVO);
    }
	
	@Override
	public List<BaseShopVO> get_site_prod_list_special(BaseShopVO baseShopVO) {
    	return baseShopDAO.get_site_prod_list_special(baseShopVO);
    }	

	@Override
	public List<BaseShopVO> get_index_prod_list(BaseShopVO baseShopVO) {
    	return baseShopDAO.get_index_prod_list(baseShopVO);
    }
	
	@Override
	public List<BaseShopVO> get_index_prod_list_1(BaseShopVO baseShopVO) {
    	return baseShopDAO.get_index_prod_list_1(baseShopVO);
    }

	@Override
	public List<BaseShopVO> get_index_prod_list_2(BaseShopVO baseShopVO) {
    	return baseShopDAO.get_index_prod_list_2(baseShopVO);
    }

	@Override
	public List<BaseShopVO> get_index_prod_list_3(BaseShopVO baseShopVO) {
    	return baseShopDAO.get_index_prod_list_3(baseShopVO);
    }

	@Override
	public List<BaseShopVO> get_index_prod_list_4(BaseShopVO baseShopVO) {
    	return baseShopDAO.get_index_prod_list_4(baseShopVO);
    }
	
	@Override
	public List<BaseShopVO> get_index_prod_list_5(BaseShopVO baseShopVO) {
    	return baseShopDAO.get_index_prod_list_5(baseShopVO);
    }
		
	
	@Override
	public int get_site_prod_list_cnt(BaseShopVO baseShopVO) {
		return baseShopDAO.get_site_prod_list_cnt(baseShopVO);
	}
	
	@Override
	public int get_site_prod_list_cnt_special(BaseShopVO baseShopVO) {
		return baseShopDAO.get_site_prod_list_cnt_special(baseShopVO);
	}
	
	@Override
	public List<BaseShopVO> get_prod_room_list(BaseShopVO baseShopVO) {
		return baseShopDAO.get_prod_room_list(baseShopVO);
	}

	@Override
	public List<BaseShopVO> get_site_prod_ajax_list(BaseShopVO baseShopVO) {
		return baseShopDAO.get_site_prod_ajax_list(baseShopVO);
	}
	
	@Override
	public int get_site_prod_ajax_list_cnt(BaseShopVO baseShopVO) {
		return baseShopDAO.get_site_prod_ajax_list_cnt(baseShopVO);
	}
	
	@Override
	public List<BaseShopVO> get_site_main_prod_list_recom_travel(BaseShopVO baseShopVO) {
		return baseShopDAO.get_site_main_prod_list_recom_travel(baseShopVO);
	}
	@Override
	public int get_site_main_prod_list_recom_travel_cnt(BaseShopVO baseShopVO) {
		return baseShopDAO.get_site_main_prod_list_recom_travel_cnt(baseShopVO);
	}
	
	@Override
	public List<BaseShopVO> get_option_list(BaseShopVO baseShopVO) {
		return baseShopDAO.get_option_list(baseShopVO);
	}
	
	@Override
	public void pick_plus(BaseShopVO baseShopVO) {
		baseShopDAO.pick_plus(baseShopVO);
	}
	
	@Override
	public void pick_minus(BaseShopVO baseShopVO) {
		baseShopDAO.pick_minus(baseShopVO);
	}
	
	@Override
	public BaseShopVO get_cp_info(BaseShopVO baseShopVO) {
		return baseShopDAO.get_cp_info(baseShopVO);
	}
	
	@Override
	public BaseShopVO get_site_room_info(BaseShopVO baseShopVO) {
		return baseShopDAO.get_site_room_info(baseShopVO);
	}
	
	@Override
	public List<BaseShopVO> get_fav_zone_list(BaseShopVO baseShopVO) {
		return baseShopDAO.get_fav_zone_list(baseShopVO);
	}
	@Override
	public int get_fav_zone_list_cnt(BaseShopVO baseShopVO) {
		return baseShopDAO.get_fav_zone_list_cnt(baseShopVO);
	}
	
	@Override
	public List<BaseShopVO> get_fav_market_list(BaseShopVO baseShopVO) {
		return baseShopDAO.get_fav_market_list(baseShopVO);
	}
	@Override
	public int get_fav_market_list_cnt(BaseShopVO baseShopVO) {
		return baseShopDAO.get_fav_market_list_cnt(baseShopVO);
	}
	
	@Override
	public int get_has_coupon(BaseShopVO baseShopVO) {
		return baseShopDAO.get_has_coupon(baseShopVO);
	}
	
	@Override
	public void issue_coupon(BaseShopVO baseShopVO) {
		baseShopDAO.issue_coupon(baseShopVO);
	}
	
	@Override
	public BaseShopVO get_day_check(BaseShopVO baseShopVO) {
		return baseShopDAO.get_day_check(baseShopVO);
	}
	
	@Override
	public int cart_save(BaseShopVO baseShopVO) {
		return baseShopDAO.cart_save(baseShopVO);
	}
	
	@Override
	public List<BaseShopVO> get_cart_list(BaseShopVO baseShopVO) {
		return baseShopDAO.get_cart_list(baseShopVO);
	}
	
	@Override
	public int get_cart_cnt(BaseShopVO baseShopVO) {
		return baseShopDAO.get_cart_cnt(baseShopVO);
	}
	
	@Override
	public List<BaseShopVO> get_member_coupon_list(BaseShopVO baseShopVO) {
		return baseShopDAO.get_member_coupon_list(baseShopVO);
	}
	
	@Override
	public List<BaseShopVO> get_site_order_list(BaseShopVO baseShopVO) {
		return baseShopDAO.get_site_order_list(baseShopVO);
	}
	
	@Override
	public List<BaseShopVO> get_site_order_detail_list(BaseShopVO baseShopVO) {
		return baseShopDAO.get_site_order_detail_list(baseShopVO);
	}
	
	@Override
	public List<BaseShopVO> get_site_order_reserve_list(BaseShopVO baseShopVO) {
		return baseShopDAO.get_site_order_reserve_list(baseShopVO);
	}
	
	@Override
	public List<BaseShopVO> get_site_my_order_no_market_detail_list(BaseShopVO baseShopVO) {
		return baseShopDAO.get_site_my_order_no_market_detail_list(baseShopVO);
	}
	
	@Override
	public List<BaseShopVO> get_site_my_order_market_detail_list(BaseShopVO baseShopVO) {
		return baseShopDAO.get_site_my_order_market_detail_list(baseShopVO);
	}
	
	@Override
	public List<BaseShopVO> get_cart4_store_list(BaseShopVO baseShopVO) {
		return baseShopDAO.get_cart4_store_list(baseShopVO);
	}
	
	@Override
	public List<BaseShopVO> get_cart_addr_list(BaseShopVO baseShopVO) {
		return baseShopDAO.get_cart_addr_list(baseShopVO);
	}
	
	@Override
	public void del_cart_category(BaseShopVO baseShopVO) {
		baseShopDAO.del_cart_category(baseShopVO);
	}

	@Override
	public void del_cart_item(BaseShopVO baseShopVO) {
		baseShopDAO.del_cart_item(baseShopVO);
	}
	
	@Override
	public BaseShopVO get_cart_info(BaseShopVO baseShopVO) {
		return baseShopDAO.get_cart_info(baseShopVO);
	}
	
	@Override
	public void set_order_master(BaseShopVO baseShopVO) {
		baseShopDAO.set_order_master(baseShopVO);
	}

	@Override
	public void set_order_detail(BaseShopVO baseShopVO) {
		baseShopDAO.set_order_detail(baseShopVO);
	}
	
	@Override
	public void set_cart_delete(BaseShopVO baseShopVO) {
		baseShopDAO.set_cart_delete(baseShopVO);
	}
	
	@Override
	public BaseShopVO get_site_coupon_info(BaseShopVO baseShopVO) {
		return baseShopDAO.get_site_coupon_info(baseShopVO);
	}

	@Override
	public int is_order_use(BaseShopVO baseShopVO) {
		return baseShopDAO.is_order_use(baseShopVO);
	}

	@Override
	public void use_save(BaseShopVO baseShopVO) {
		baseShopDAO.use_save(baseShopVO);
	}
	
	@Override
	public void delete_delivery_price(BaseShopVO baseShopVO) {
		baseShopDAO.delete_delivery_price(baseShopVO);
	}

	@Override
	public void insert_delivery_price(BaseShopVO baseShopVO) {
		baseShopDAO.insert_delivery_price(baseShopVO);
	}
	
	@Override
	public void add_addr_info(BaseShopVO baseShopVO) {
		baseShopDAO.add_addr_info(baseShopVO);
	}
	
	@Override
	public void add_member_info(BaseShopVO baseShopVO) {
		baseShopDAO.add_member_info(baseShopVO);
	}

	@Override
	public int get_order_id_check(BaseShopVO baseShopVO) {
		return baseShopDAO.get_order_id_check(baseShopVO);
	}
	
	@Override
	public BaseShopVO get_cart_opt_data(BaseShopVO baseShopVO) {
		return baseShopDAO.get_cart_opt_data(baseShopVO);
	}
	
	@Override
	public void update_option(BaseShopVO baseShopVO) {
		baseShopDAO.update_option(baseShopVO);
	}
	
	@Override
	public BaseShopVO get_site_order_master_info(BaseShopVO baseShopVO) {
		return baseShopDAO.get_site_order_master_info(baseShopVO);
	}
	@Override
	public int get_site_order_all_list_cnt(BaseShopVO baseShopVO) {
		return baseShopDAO.get_site_order_all_list_cnt(baseShopVO);
	}
	@Override
	public List<BaseShopVO> get_site_order_all_list(BaseShopVO baseShopVO) {
		return baseShopDAO.get_site_order_all_list(baseShopVO);
	}
	
	@Override
	public List<BaseShopVO> get_site_order_detail_all_list(BaseShopVO baseShopVO) {
		return baseShopDAO.get_site_order_detail_all_list(baseShopVO);
	}
	
	@Override
	public void set_update_order_master(BaseShopVO baseShopVO) {
		baseShopDAO.set_update_order_master(baseShopVO);
	}
	
	@Override
	public void set_update_order_detail(BaseShopVO baseShopVO) {
		baseShopDAO.set_update_order_detail(baseShopVO);
	}
	
	@Override
	public BaseShopVO get_vbank_info(BaseShopVO baseShopVO) {
		return baseShopDAO.get_vbank_info(baseShopVO);
	}
	
	@Override
	public void order_all_cancel(BaseShopVO baseShopVO) {
		baseShopDAO.order_all_cancel(baseShopVO);
	}
	@Override
	public void orderdetail_all_cancel(BaseShopVO baseShopVO) {
		baseShopDAO.orderdetail_all_cancel(baseShopVO);
	}
	@Override
	public void orderdetail_sel_cancel(BaseShopVO baseShopVO) {
		baseShopDAO.orderdetail_sel_cancel(baseShopVO);
	}
}



