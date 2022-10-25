/* [p_category] ******************/
desc p_category;
/*
이름          널?       유형           
----------- -------- ------------ 
P_CTGR_NO   NOT NULL NUMBER(10)   
P_CTGR_NAME          VARCHAR2(50) 
*/

insert into p_category(p_ctgr_no, p_ctgr_name) values(p_category_p_ctgr_no_SEQ.nextval, '디지털기기');
insert into p_category(p_ctgr_no, p_ctgr_name) values(p_category_p_ctgr_no_SEQ.nextval, '생활가전');
insert into p_category(p_ctgr_no, p_ctgr_name) values(p_category_p_ctgr_no_SEQ.nextval, '가구/인테리어');
insert into p_category(p_ctgr_no, p_ctgr_name) values(p_category_p_ctgr_no_SEQ.nextval, '생활/주방');
insert into p_category(p_ctgr_no, p_ctgr_name) values(p_category_p_ctgr_no_SEQ.nextval, '유아동');
insert into p_category(p_ctgr_no, p_ctgr_name) values(p_category_p_ctgr_no_SEQ.nextval, '유아도서');
insert into p_category(p_ctgr_no, p_ctgr_name) values(p_category_p_ctgr_no_SEQ.nextval, '여성의류');
insert into p_category(p_ctgr_no, p_ctgr_name) values(p_category_p_ctgr_no_SEQ.nextval, '여성잡화');
insert into p_category(p_ctgr_no, p_ctgr_name) values(p_category_p_ctgr_no_SEQ.nextval, '남성패션/잡화');
insert into p_category(p_ctgr_no, p_ctgr_name) values(p_category_p_ctgr_no_SEQ.nextval, '뷰티/미용');
insert into p_category(p_ctgr_no, p_ctgr_name) values(p_category_p_ctgr_no_SEQ.nextval, '스포츠레저');
insert into p_category(p_ctgr_no, p_ctgr_name) values(p_category_p_ctgr_no_SEQ.nextval, '취미/게임/음반');
insert into p_category(p_ctgr_no, p_ctgr_name) values(p_category_p_ctgr_no_SEQ.nextval, '도서');
insert into p_category(p_ctgr_no, p_ctgr_name) values(p_category_p_ctgr_no_SEQ.nextval, '티켓/교환권');
insert into p_category(p_ctgr_no, p_ctgr_name) values(p_category_p_ctgr_no_SEQ.nextval, '가공식품');
insert into p_category(p_ctgr_no, p_ctgr_name) values(p_category_p_ctgr_no_SEQ.nextval, '반려동물용품');
insert into p_category(p_ctgr_no, p_ctgr_name) values(p_category_p_ctgr_no_SEQ.nextval, '식물');
insert into p_category(p_ctgr_no, p_ctgr_name) values(p_category_p_ctgr_no_SEQ.nextval, '기타 중고물품');
insert into p_category(p_ctgr_no, p_ctgr_name) values(p_category_p_ctgr_no_SEQ.nextval, '삽니다');

/* [town_category] ******************/
desc town_category;

/*
이름          널?       유형           
----------- -------- ------------ 
T_CTGR_NO   NOT NULL NUMBER(10)   
T_CTGR_NAME          VARCHAR2(10) 
*/

insert into town_category(t_ctgr_no, t_ctgr_name) values(town_category_t_ctgr_no_SEQ.nextval, '동네소식');
insert into town_category(t_ctgr_no, t_ctgr_name) values(town_category_t_ctgr_no_SEQ.nextval, '같이해요');
insert into town_category(t_ctgr_no, t_ctgr_name) values(town_category_t_ctgr_no_SEQ.nextval, '동네질문');
insert into town_category(t_ctgr_no, t_ctgr_name) values(town_category_t_ctgr_no_SEQ.nextval, '동네맛집');
insert into town_category(t_ctgr_no, t_ctgr_name) values(town_category_t_ctgr_no_SEQ.nextval, '취미생활');
insert into town_category(t_ctgr_no, t_ctgr_name) values(town_category_t_ctgr_no_SEQ.nextval, '일상');
insert into town_category(t_ctgr_no, t_ctgr_name) values(town_category_t_ctgr_no_SEQ.nextval, '분실/실종센터');
insert into town_category(t_ctgr_no, t_ctgr_name) values(town_category_t_ctgr_no_SEQ.nextval, '동네사건사고');
insert into town_category(t_ctgr_no, t_ctgr_name) values(town_category_t_ctgr_no_SEQ.nextval, '해주세요');
insert into town_category(t_ctgr_no, t_ctgr_name) values(town_category_t_ctgr_no_SEQ.nextval, '동네사진전');
