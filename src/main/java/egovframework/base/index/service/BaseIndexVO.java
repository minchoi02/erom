package egovframework.base.index.service;

import egovframework.base.service.BasePagingVO;

public class BaseIndexVO extends BasePagingVO {
	
	private int insert_id;
	private String user_id;
	private String prod_id;
	
	private String map_type;
	private int map_size;
	private Double user_lat;
	private Double user_lng;
	
	private String store_id;
	private String store_nm;
	private String store_lat;
	private String store_lng;
	private String store_zip;
	private String store_addr_1;
	private String store_addr_2;
	private String store_tel;
	private String distance;
	
	//============================================
	
	public int getinsert_id() { return insert_id; }
	public void setinsert_id(int insert_id) { this.insert_id = insert_id; }
	
	public String getuser_id() { return user_id; }
	public void setuser_id(String user_id) { this.user_id = user_id; }
	
	public String getprod_id() { return prod_id; }
	public void setprod_id(String prod_id) { this.prod_id = prod_id; }
	
	public String getmap_type() { return map_type; }
	public void setmap_type(String map_type) { this.map_type = map_type; }
	
	public int getmap_size() { return map_size; }
	public void setmap_size(int map_size) { this.map_size = map_size; }

	public Double getuser_lat() { return user_lat; }
	public void setuser_lat(Double user_lat) { this.user_lat = user_lat; }

	public Double getuser_lng() { return user_lng; }
	public void setuser_lng(Double user_lng) { this.user_lng = user_lng; }
	
	public String getstore_id() { return store_id; }
	public void setstore_id(String store_id) { this.store_id = store_id; }

	public String getstore_nm() { return store_nm; }
	public void setstore_nm(String store_nm) { this.store_nm = store_nm; }

	public String getstore_lat() { return store_lat; }
	public void setstore_lat(String store_lat) { this.store_lat = store_lat; }

	public String getstore_lng() { return store_lng; }
	public void setstore_lng(String store_lng) { this.store_lng = store_lng; }

	public String getstore_zip() { return store_zip; }
	public void setstore_zip(String store_zip) { this.store_zip = store_zip; }

	public String getstore_addr_1() { return store_addr_1; }
	public void setstore_addr_1(String store_addr_1) { this.store_addr_1 = store_addr_1; }

	public String getstore_addr_2() { return store_addr_2; }
	public void setstore_addr_2(String store_addr_2) { this.store_addr_2 = store_addr_2; }

	public String getstore_tel() { return store_tel; }
	public void setstore_tel(String store_tel) { this.store_tel = store_tel; }

	public String getdistance() { return distance; }
	public void setdistance(String distance) { this.distance = distance; }
	
	
}