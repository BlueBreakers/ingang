package com.ingang.book.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import com.ingang.course.vo.CourseVO;

import lombok.Data;

@Data
public class BookVO {
	
	// bookNo : 교재번호
	private long bookNo;
	// fileName : 교재사진,책이름, bookIntroduce : 책소개 
	// bookDiv : JAVA/JSP&Servlet,Spring
	private String fileName, bookName, bookIntroduce, bookDiv;
	private MultipartFile imageFile;
	// 출판사
	private String publisher;
	// 재고 
	private long quantity;
	// 상태 판매중 / 품절 0 일시 자동 품절상태변경되도록
	private String status;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	// 발행일
	private Date pubDate;
	private String pubDate1;
	// 가격
	private long price;
	private String price1;
	// 삭제할 이미지 파일명
	private String deleteName;
	// 강의쪽 데이터 - 강의명, 담당자, 이미지, 시작일, 종료일, 교재번호
	private CourseVO courseVO;
	private String title, teacher, image;
	private Date startDate, endDate;
	private long cbno;
	// 강의 번호
	private long no;
}
