package com.ingang.coReview.mapper;

import java.util.List;
import java.util.Map;

import com.ingang.coReview.vo.CoReviewVO;


public interface CoReviewMapper {

	// 리뷰 리스트
	public List<CoReviewVO> reviewList(Map<String, Object> map);

	public long getTotalRow(CoReviewVO vo);
	
	// 리뷰 작성
	public int write(CoReviewVO vo);
	
	// 해당강의에 내가 리뷰 쓴 개수 가져오기
	public long selectCount(CoReviewVO vo);
	
	// pno 가져오기
	public long selectPno(CoReviewVO vo);
	
	// 리뷰 수정
	public int update(CoReviewVO vo);
	
	// 리뷰 삭제
	public int delete(CoReviewVO vo);
	
	// 삭제할 리뷰 좋아요 삭제
	public int deleteLike(CoReviewVO vo);
	
	// 좋아요 하기
	public int like(CoReviewVO vo);

	// 좋아요 취소
	public int cancelLike(CoReviewVO vo);
	
	// 내가 좋아요한 리뷰번호 가져오기
	public List<Long> myLike(CoReviewVO vo);
	
	
}
