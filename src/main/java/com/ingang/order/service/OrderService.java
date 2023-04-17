package com.ingang.order.service;

import java.util.List;

import com.ingang.order.vo.OrderVO;
import com.webjjang.util.PageObject;

public interface OrderService {

	// 1. 교재 구매 목록 리스트
	public List<OrderVO> myList(String id, PageObject pageObject);
	
	// 1-1. 모든 구매 리스트 
	public List<OrderVO> list(PageObject pageObject);
	
	// 2. 구매 내역 상세보기 - 텍스트 정보 가져오기. 이미지 파일 가져오기
	public List<OrderVO> view(long ordNo);
	
	// 3. 구매 하기  - 교재 정보 가져오기. 구매정보 가져오기
	public int buy(OrderVO vo); // 먼저 시퀀스에서 글번호를 받아서 vo.no에 세팅하게 처리해 주게 한다. selectKey 태그 이용
	
	// 4. 배송 상태 수정(관리자) - 배송 상태변경 (배송 준비중, 배송중, 배송완료)
	public int update(OrderVO vo);
	
	// 5. 구매 내역 삭제 - 내역,상세정보 삭제
	public int delete(long ordNo);

	
}
