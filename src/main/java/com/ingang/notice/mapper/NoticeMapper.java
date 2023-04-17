package com.ingang.notice.mapper;

import java.util.List;

import com.ingang.notice.vo.NoticeVO;
import com.webjjang.util.PageObject;

public interface NoticeMapper {
	
		// 모든 list
		public List<NoticeVO> list(PageObject pageObject);
		// 에약된 list
		public List<NoticeVO> reservedList(PageObject pageObject);
		// 지난 list
		public List<NoticeVO> lastList(PageObject pageObject);
		// 현재
		public List<NoticeVO> currentList(PageObject pageObject);
		
		// 페이징처리
		public long getTotalRow(PageObject pageObject);
		public long getTotalRow1(PageObject pageObject);
		
		// view 리턴타입 NoticeVO
		public NoticeVO view(long no);

		// 조회수
		public int increase(long no);
		
		// 공지등록
		public int write(NoticeVO vo);

		// 공지수정
		public Integer update(NoticeVO vo);
		
		// 공지삭제
		public Integer delete(long no);
}
