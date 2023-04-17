
DROP SEQUENCE book_review_file;



CREATE SEQUENCE book_review_file;



DROP SEQUENCE book_review_seq;



CREATE SEQUENCE book_review_seq;



DROP SEQUENCE book_seq;



CREATE SEQUENCE book_seq;



DROP SEQUENCE cart_seq;



CREATE SEQUENCE cart_seq;



DROP SEQUENCE course_seq;



CREATE SEQUENCE course_seq;



DROP SEQUENCE enroll_seq;



CREATE SEQUENCE enroll_seq;



DROP SEQUENCE mentoring_seq;



CREATE SEQUENCE mentoring_seq;



DROP SEQUENCE message_seq;



CREATE SEQUENCE message_seq;



DROP SEQUENCE messageRoom_seq;



CREATE SEQUENCE messageRoom_seq;



DROP SEQUENCE notice_seq;



CREATE SEQUENCE notice_seq;



DROP SEQUENCE order_detail_seq;



CREATE SEQUENCE order_detail_seq;



DROP SEQUENCE ordertable_seq;



CREATE SEQUENCE ordertable_seq;



DROP SEQUENCE reservation_seq;



CREATE SEQUENCE reservation_seq;



DROP TABLE rlike CASCADE CONSTRAINTS PURGE;



DROP TABLE review CASCADE CONSTRAINTS PURGE;



DROP TABLE eDetail CASCADE CONSTRAINTS PURGE;



DROP TABLE enroll CASCADE CONSTRAINTS PURGE;



DROP TABLE cart CASCADE CONSTRAINTS PURGE;



DROP TABLE course CASCADE CONSTRAINTS PURGE;



DROP TABLE book_review CASCADE CONSTRAINTS PURGE;



DROP TABLE order_detail CASCADE CONSTRAINTS PURGE;



DROP TABLE book CASCADE CONSTRAINTS PURGE;



DROP TABLE ordertable CASCADE CONSTRAINTS PURGE;



DROP TABLE reservation CASCADE CONSTRAINTS PURGE;



DROP TABLE mentoring CASCADE CONSTRAINTS PURGE;



DROP TABLE message CASCADE CONSTRAINTS PURGE;



DROP TABLE messageRoom CASCADE CONSTRAINTS PURGE;



DROP TABLE member CASCADE CONSTRAINTS PURGE;



DROP TABLE grade CASCADE CONSTRAINTS PURGE;



DROP TABLE notice CASCADE CONSTRAINTS PURGE;



CREATE TABLE book
(
	bookNo                NUMBER  NOT NULL ,
	fileName              VARCHAR2(100)  NOT NULL ,
	bookName              VARCHAR2(300)  NOT NULL ,
	bookIntroduce         VARCHAR2(3000)  NOT NULL ,
	bookDiv               VARCHAR2(20)  NOT NULL ,
	publisher             VARCHAR2(100)  NOT NULL ,
	quantity              NUMBER  NOT NULL ,
	status                VARCHAR2(20)   DEFAULT  '판매중' NOT NULL  CONSTRAINT  status2 CHECK (status in ('판매중', '품절')),
	pubDate               DATE  NOT NULL ,
	price                 NUMBER  NOT NULL 
);



CREATE UNIQUE INDEX XPK교재관리 ON book
(bookNo  ASC);



ALTER TABLE book
	ADD CONSTRAINT  XPK교재관리 PRIMARY KEY (bookNo);



CREATE TABLE book_review
(
	reviewNo              NUMBER  NOT NULL ,
	id                    VARCHAR2(30)  NULL ,
	content               VARCHAR2(1000)  NOT NULL ,
	writeDate             DATE   DEFAULT  sysdate NOT NULL ,
	star                  NUMBER(3)  NOT NULL  CONSTRAINT  star CHECK (star in (1,2,3,4,5)),
	detailNo              NUMBER  NULL ,
	bookNo                NUMBER  NULL 
);



CREATE UNIQUE INDEX XPK교재리뷰 ON book_review
(reviewNo  ASC);



ALTER TABLE book_review
	ADD CONSTRAINT  XPK교재리뷰 PRIMARY KEY (reviewNo);



CREATE TABLE cart
(
	cartNo                NUMBER  NOT NULL ,
	piNo                  NUMBER(20)  NOT NULL ,
	id                    VARCHAR2(30)  NULL ,
	bookNo                NUMBER  NULL ,
	no                    NUMBER  NULL ,
	quantity              NUMBER   DEFAULT  1 NOT NULL 
);



CREATE UNIQUE INDEX XPK장바구니 ON cart
(cartNo  ASC);



ALTER TABLE cart
	ADD CONSTRAINT  XPK장바구니 PRIMARY KEY (cartNo);



CREATE TABLE course
(
	no                    NUMBER  NOT NULL ,
	title                 VARCHAR2(300)  NOT NULL ,
	content               VARCHAR2(1000)  NOT NULL ,
	writeDate             DATE   DEFAULT  sysdate NULL ,
	startDate             DATE   DEFAULT  sysdate NULL ,
	endDate               DATE   DEFAULT  '9999-12-30' NULL ,
	updateDate            DATE   DEFAULT  sysdate NULL ,
	vid                   VARCHAR2(100)  NULL ,
	image                 VARCHAR2(50)  NULL ,
	price                 NUMBER(10)   DEFAULT  0 NULL ,
	cbno                  NUMBER  NULL ,
	writer                VARCHAR2(30)  NOT NULL ,
	teacher               VARCHAR2(30)  NOT NULL ,
	vidlength             NUMBER  NULL 
);



CREATE UNIQUE INDEX XPK강의관리 ON course
(no  ASC);



ALTER TABLE course
	ADD CONSTRAINT  XPK강의관리 PRIMARY KEY (no);



CREATE TABLE eDetail
(
	pno                   NUMBER  NOT NULL ,
	eno                   NUMBER  NOT NULL ,
	viewDate              DATE  NULL ,
	status                VARCHAR2(15)  NULL  CONSTRAINT  status3 CHECK (status in ('학습중', '학습완료')),
	viewTime              NUMBER(10)  NULL ,
	viewRatio             NUMBER(4,1)  NULL ,
	no                    NUMBER  NULL ,
	payStatus             VARCHAR2(15)  NULL  CONSTRAINT  payStatus CHECK (payStatus in ('결제완료', '취소'))
);



CREATE UNIQUE INDEX XPK강의결제상세 ON eDetail
(pno  ASC);



ALTER TABLE eDetail
	ADD CONSTRAINT  XPK강의결제상세 PRIMARY KEY (pno);



CREATE TABLE enroll
(
	eno                   NUMBER  NOT NULL ,
	id                    VARCHAR2(30)  NOT NULL ,
	totalprice            NUMBER(8)  NOT NULL ,
	eDate                 DATE   DEFAULT  sysdate NULL ,
	payMethod             VARCHAR2(30)  NOT NULL  CONSTRAINT  payMethod CHECK (payMethod in ('카드결제' , '네이버페이' , '카카오페이')),
	status                VARCHAR2(30)  NULL ,
	title                 VARCHAR2(50)  NULL ,
	cancelPrice           NUMBER(8)  NULL 
);



CREATE UNIQUE INDEX XPK강의결제 ON enroll
(eno  ASC);



ALTER TABLE enroll
	ADD CONSTRAINT  XPK강의결제 PRIMARY KEY (eno);



CREATE TABLE grade
(
	gradeName             VARCHAR2(10)  NOT NULL ,
	gradeNo               NUMBER(3)  NOT NULL 
);



CREATE UNIQUE INDEX XPK등급 ON grade
(gradeNo  ASC);



ALTER TABLE grade
	ADD CONSTRAINT  XPK등급 PRIMARY KEY (gradeNo);



CREATE TABLE member
(
	id                    VARCHAR2(30)  NOT NULL ,
	pw                    VARCHAR2(30)  NOT NULL ,
	name                  VARCHAR2(30)  NOT NULL ,
	email                 VARCHAR2(30)  NOT NULL ,
	regdate               VARCHAR2(30)   DEFAULT  sysdate NULL ,
	teacher               VARCHAR2(10)   DEFAULT  'X' NULL  CONSTRAINT  teacher CHECK (teacher in ('o' ,'x','신청중')),
	mento                 VARCHAR2(10)   DEFAULT  'X' NULL  CONSTRAINT  mento CHECK (mento in ('o' ,'x','신청중')),
	status                VARCHAR2(10)  NULL  CONSTRAINT  status CHECK (status in ('휴면', '정상' , '탈퇴')),
	gradeNo               NUMBER(3)   DEFAULT  1 NULL  CONSTRAINT  gradeNo CHECK (gradeNo in (1, 9)),
	address               VARCHAR2(20)  NULL ,
	memberImg             VARCHAR2(30)  NULL ,
	conDate               DATE  NULL ,
	tel                   VARCHAR2(30)  NULL ,
	introduce             VARCHAR2(200)  NULL 
);



CREATE UNIQUE INDEX XPK회원관리 ON member
(id  ASC);



ALTER TABLE member
	ADD CONSTRAINT  XPK회원관리 PRIMARY KEY (id);



CREATE TABLE mentoring
(
	mno                   NUMBER(10)  NOT NULL ,
	field                 VARCHAR2(30)  NOT NULL ,
	career                VARCHAR2(100)  NOT NULL ,
	incumbent             VARCHAR2(100)  NOT NULL ,
	intro                 VARCHAR2(2000)  NOT NULL ,
	price                 NUMBER(10)  NOT NULL ,
	aStartDate            DATE  NOT NULL ,
	aEndDate              DATE  NOT NULL ,
	aStartTime            DATE  NOT NULL ,
	aEndTime              DATE  NOT NULL ,
	id                    VARCHAR2(30)  NULL ,
	head                  VARCHAR2(100)  NULL ,
	status                VARCHAR2(30)  NOT NULL 
);



CREATE UNIQUE INDEX XPK멘토링 ON mentoring
(mno  ASC);



ALTER TABLE mentoring
	ADD CONSTRAINT  XPK멘토링 PRIMARY KEY (mno);



CREATE TABLE message
(
	no                    NUMBER  NOT NULL ,
	content               VARCHAR2(2000)  NOT NULL ,
	sendDate              DATE   DEFAULT  sysdate NOT NULL ,
	acceptDate            DATE  NULL ,
	roomNo                NUMBER  NULL ,
	sender                VARCHAR2(30)  NULL ,
	accepter              VARCHAR2(30)  NULL 
);



CREATE UNIQUE INDEX XPK메시지 ON message
(no  ASC);



ALTER TABLE message
	ADD CONSTRAINT  XPK메시지 PRIMARY KEY (no);



CREATE TABLE messageRoom
(
	roomNo                NUMBER  NOT NULL ,
	lmContent             VARCHAR2(2000)  NULL ,
	Cdate                 TIMESTAMP  NULL ,
	roomstatus            VARCHAR2(10)  NOT NULL ,
	unreadcount1          NUMBER(10)   DEFAULT  0 NULL ,
	unreadcount2          NUMBER(10)   DEFAULT  0 NULL ,
	par1                  VARCHAR2(30)  NULL ,
	par2                  VARCHAR2(30)  NULL ,
	field                 VARCHAR2(30)  NULL ,
	memberimg             VARCHAR2(30)  NULL 
);



CREATE UNIQUE INDEX XPK메시지대화방 ON messageRoom
(roomNo  ASC);



ALTER TABLE messageRoom
	ADD CONSTRAINT  XPK메시지대화방 PRIMARY KEY (roomNo);



CREATE TABLE notice
(
	no                    NUMBER  NOT NULL ,
	title                 VARCHAR2(300)  NOT NULL ,
	content               VARCHAR2(4000)  NOT NULL ,
	startDate             DATE   DEFAULT  sysdate NULL ,
	endDate               DATE   DEFAULT  '9999-12-30' NULL ,
	writeDate             DATE   DEFAULT  sysdate NULL ,
	updateDate            DATE   DEFAULT  sysdate NULL ,
	hit                   NUMBER   DEFAULT  0 NULL 
);



CREATE UNIQUE INDEX XPK공지사항 ON notice
(no  ASC);



ALTER TABLE notice
	ADD CONSTRAINT  XPK공지사항 PRIMARY KEY (no);



CREATE TABLE order_detail
(
	detailNo              NUMBER  NOT NULL ,
	ordNo                 NUMBER  NULL ,
	quantity              NUMBER  NOT NULL ,
	bookNo                NUMBER  NULL 
);



CREATE UNIQUE INDEX XPK교재주문상세 ON order_detail
(detailNo  ASC);



ALTER TABLE order_detail
	ADD CONSTRAINT  XPK교재주문상세 PRIMARY KEY (detailNo);



CREATE TABLE ordertable
(
	ordNo                 NUMBER  NOT NULL ,
	id                    VARCHAR2(30)  NOT NULL ,
	arriveDate            DATE  NULL ,
	orderDate             DATE   DEFAULT  sysdate NULL ,
	dlvAdress             VARCHAR2(100)  NOT NULL ,
	name                  VARCHAR2(30)  NOT NULL ,
	tel                   VARCHAR2(13)  NULL ,
	dlvCondition          VARCHAR2(20)  NULL  CONSTRAINT  dlvContdition CHECK (dlvCondition in ('배송준비중', '배송중', '배송완료')),
	totalPrice            VARCHAR2(30)  NOT NULL ,
	payMethod             VARCHAR2(20)  NULL 
);



CREATE UNIQUE INDEX XPK교재주문 ON ordertable
(ordNo  ASC);



ALTER TABLE ordertable
	ADD CONSTRAINT  XPK교재주문 PRIMARY KEY (ordNo);



CREATE TABLE reservation
(
	rno                   NUMBER(10)  NOT NULL ,
	mno                   NUMBER(10)  NULL ,
	id                    VARCHAR2(30)  NOT NULL ,
	resDate               DATE  NOT NULL ,
	resTime               NUMBER(10)  NULL ,
	greetings             VARCHAR2(100)  NOT NULL ,
	resStatus             VARCHAR2(30)  NULL 
);



CREATE UNIQUE INDEX XPK멘토링예약 ON reservation
(rno  ASC);



ALTER TABLE reservation
	ADD CONSTRAINT  XPK멘토링예약 PRIMARY KEY (rno);



CREATE TABLE review
(
	rno                   NUMBER  NOT NULL ,
	id                    VARCHAR2(30)  NOT NULL ,
	content               VARCHAR2(700)  NOT NULL ,
	writeDate             DATE   DEFAULT  sysdate NULL ,
	score                 NUMBER(3)  NOT NULL  CONSTRAINT  score CHECK (score in (1, 2, 3, 4, 5)),
	likecnt               NUMBER(5)  NULL ,
	pno                   NUMBER  NOT NULL 
);



CREATE UNIQUE INDEX XPK수강평 ON review
(rno  ASC);



ALTER TABLE review
	ADD CONSTRAINT  XPK수강평 PRIMARY KEY (rno);



CREATE TABLE rlike
(
	id                    VARCHAR2(30)  NOT NULL ,
	rno                   NUMBER  NOT NULL 
);



CREATE UNIQUE INDEX XPK수강평좋아요 ON rlike
(id  ASC,rno  ASC);



ALTER TABLE rlike
	ADD CONSTRAINT  XPK수강평좋아요 PRIMARY KEY (id,rno);



ALTER TABLE book_review
	ADD (CONSTRAINT  R_19 FOREIGN KEY (detailNo) REFERENCES order_detail(detailNo) ON DELETE SET NULL);



ALTER TABLE book_review
	ADD (CONSTRAINT  R_23 FOREIGN KEY (id) REFERENCES member(id) ON DELETE SET NULL);



ALTER TABLE book_review
	ADD (CONSTRAINT  R_54 FOREIGN KEY (bookNo) REFERENCES book(bookNo) ON DELETE SET NULL);



ALTER TABLE cart
	ADD (CONSTRAINT  R_14 FOREIGN KEY (bookNo) REFERENCES book(bookNo) ON DELETE SET NULL);



ALTER TABLE cart
	ADD (CONSTRAINT  R_15 FOREIGN KEY (no) REFERENCES course(no) ON DELETE SET NULL);



ALTER TABLE cart
	ADD (CONSTRAINT  R_24 FOREIGN KEY (id) REFERENCES member(id) ON DELETE SET NULL);



ALTER TABLE course
	ADD (CONSTRAINT  R_2 FOREIGN KEY (writer) REFERENCES member(id) ON DELETE SET NULL);



ALTER TABLE course
	ADD (CONSTRAINT  R_3 FOREIGN KEY (cbno) REFERENCES book(bookNo) ON DELETE SET NULL);



ALTER TABLE course
	ADD (CONSTRAINT  R_12 FOREIGN KEY (teacher) REFERENCES member(id) ON DELETE SET NULL);



ALTER TABLE eDetail
	ADD (CONSTRAINT  R_6 FOREIGN KEY (no) REFERENCES course(no) ON DELETE SET NULL);



ALTER TABLE eDetail
	ADD (CONSTRAINT  R_7 FOREIGN KEY (eno) REFERENCES enroll(eno) ON DELETE SET NULL);



ALTER TABLE enroll
	ADD (CONSTRAINT  R_5 FOREIGN KEY (id) REFERENCES member(id) ON DELETE SET NULL);



ALTER TABLE member
	ADD (CONSTRAINT  R_1 FOREIGN KEY (gradeNo) REFERENCES grade(gradeNo) ON DELETE SET NULL);



ALTER TABLE mentoring
	ADD (CONSTRAINT  R_43 FOREIGN KEY (id) REFERENCES member(id) ON DELETE SET NULL);



ALTER TABLE message
	ADD (CONSTRAINT  R_48 FOREIGN KEY (roomNo) REFERENCES messageRoom(roomNo) ON DELETE SET NULL);



ALTER TABLE message
	ADD (CONSTRAINT  R_49 FOREIGN KEY (sender) REFERENCES member(id) ON DELETE SET NULL);



ALTER TABLE message
	ADD (CONSTRAINT  R_51 FOREIGN KEY (accepter) REFERENCES member(id) ON DELETE SET NULL);



ALTER TABLE messageRoom
	ADD (CONSTRAINT  R_52 FOREIGN KEY (par1) REFERENCES member(id) ON DELETE SET NULL);



ALTER TABLE messageRoom
	ADD (CONSTRAINT  R_53 FOREIGN KEY (par2) REFERENCES member(id) ON DELETE SET NULL);



ALTER TABLE order_detail
	ADD (CONSTRAINT  R_17 FOREIGN KEY (ordNo) REFERENCES ordertable(ordNo) ON DELETE SET NULL);



ALTER TABLE order_detail
	ADD (CONSTRAINT  R_18 FOREIGN KEY (bookNo) REFERENCES book(bookNo) ON DELETE SET NULL);



ALTER TABLE ordertable
	ADD (CONSTRAINT  R_16 FOREIGN KEY (id) REFERENCES member(id) ON DELETE SET NULL);



ALTER TABLE reservation
	ADD (CONSTRAINT  R_44 FOREIGN KEY (mno) REFERENCES mentoring(mno) ON DELETE SET NULL);



ALTER TABLE reservation
	ADD (CONSTRAINT  R_45 FOREIGN KEY (id) REFERENCES member(id) ON DELETE SET NULL);



ALTER TABLE review
	ADD (CONSTRAINT  R_8 FOREIGN KEY (pno) REFERENCES eDetail(pno) ON DELETE SET NULL);



ALTER TABLE review
	ADD (CONSTRAINT  R_13 FOREIGN KEY (id) REFERENCES member(id) ON DELETE SET NULL);



ALTER TABLE rlike
	ADD (CONSTRAINT  R_9 FOREIGN KEY (id) REFERENCES member(id));



ALTER TABLE rlike
	ADD (CONSTRAINT  R_10 FOREIGN KEY (rno) REFERENCES review(rno));


