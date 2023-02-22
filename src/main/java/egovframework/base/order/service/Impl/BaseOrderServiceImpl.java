package egovframework.base.order.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.base.order.service.BaseOrderService;
import egovframework.base.order.service.BaseOrderVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;


@Service("BaseOrderService")
public class BaseOrderServiceImpl extends EgovAbstractServiceImpl implements BaseOrderService {

	@Resource(name="BaseOrderDAO")
	private BaseOrderDAO baseOrderDAO;

	/** ID Generation */
	@Resource(name = "egovIdGnrService")
	private EgovIdGnrService egovIdGnrService;
	
}
