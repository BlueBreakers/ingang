package com.ingang.enroll.vo;

import java.util.Date;

import lombok.Data;

@Data
public class EnrollVO {
	
	// eno:수강신청번호, pno:수강상세번호, no:강의등록번호
	private long eno, pno, no;
	// no[]:no리스트 - 여러개 한번에결제
	private long[] noList;
	// pnoList[]:pno리스트 -- 여러개 한번에 취소
	private long[] pnoList;
	// id:주문자아이디, name:주문자명, payStatus:결제상태(결제완료,취소), payMethod:결제수단(카드결제...), status:(결제완료,취소)
	private String id,name, payStatus, payMethod, status;
	// price:강의가격, totalprice:총 결제금액
	private long price, totalprice;
	// title:강의명, image:강의이미지, teacher:강사
	private String title, image, teacher;
	private String teacher_id, teacher_name;
	// eDate:수강결제일, viewDate:최종수강일
	private Date payDate;
	private Date viewDate;
	// viewRatio:학습진행률
	private long viewRatio;
	// allCancel:모두취소 or 부분취소 확인변수 - 0:부분취소, 1:전체취소
	private long allCancel;
	// listTitle:리스트제목
	private String listtitle;
	// startDate:강의시작일
	private Date startDate;
	// priceList:취소할항목의 가격 리스트
	private long[] priceList;
	// cancelprice:취소할항목의 가격
	private long cancelprice;
	
}
