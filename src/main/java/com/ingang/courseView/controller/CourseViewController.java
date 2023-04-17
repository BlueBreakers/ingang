package com.ingang.courseView.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ingang.courseView.service.CourseViewService;
import com.ingang.courseView.vo.CourseViewVO;

import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/courseView")
@Log4j
public class CourseViewController {

	@Autowired
	@Qualifier("courseViewServiceImpl")
	private CourseViewService service;

	@PostMapping(value = "/update.do", consumes = "application/json; charset=UTF-8", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> update(@RequestBody CourseViewVO vo) {
		log.info(vo);
		int result = service.update(vo);
		
		if(result == 1)
			return new ResponseEntity<String>("200" ,HttpStatus.OK) ;
		else
			return new ResponseEntity<String>("500" ,HttpStatus.INTERNAL_SERVER_ERROR) ;
		
	}
	
}
