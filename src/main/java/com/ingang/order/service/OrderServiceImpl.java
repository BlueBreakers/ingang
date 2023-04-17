package com.ingang.order.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.ingang.order.mapper.OrderMapper;
import com.ingang.order.vo.OrderVO;
import com.webjjang.util.PageObject;

import lombok.Setter;

@Service
@Qualifier("orderServiceImpl")
public class OrderServiceImpl implements OrderService{

	@Setter(onMethod_ = @Autowired)
	private OrderMapper mapper;
	
	// 본인 구매 리스트
	@Override
	public List<OrderVO> myList(String id, PageObject pageObject) {
		// TODO Auto-generated method stub
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("pageObject", pageObject);
		
		// 페이지 계산을 위한 세팅
		pageObject.setTotalRow(mapper.getTotalRow(map));
		
		return mapper.myList(map);
	}
	
	@Override
	public List<OrderVO> list(PageObject pageObject) {
		// TODO Auto-generated method stub
		// 페이지 계산을 위한 세팅
		pageObject.setTotalRow(mapper.getTotalRowAll(pageObject));

		return mapper.list(pageObject);
	}
	


	@Override
	public List<OrderVO> view(long ordNo) {
		// TODO Auto-generated method stub
		return mapper.view(ordNo);
	}

	@Override
	public int buy(OrderVO vo) {
		// TODO Auto-generated method stub
		mapper.buy(vo);
		mapper.buyDetail(vo);
		mapper.updateQ(vo);
		return 1;
	}

	@Override
	public int update(OrderVO vo) {
		// TODO Auto-generated method stub
		mapper.update(vo);
		return 1;
	}

	@Override
	public int delete(long ordNo) {
		// TODO Auto-generated method stub
		mapper.delete(ordNo);
		return 1;
	}

}
