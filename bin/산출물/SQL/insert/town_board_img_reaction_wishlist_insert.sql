--#############[town_board],[town_img],[town_reaction]
desc town_board;
desc town_img;
desc town_reaction;
/*
이름             널?       유형             
-------------- -------- -------------- 
T_NO           NOT NULL NUMBER(10)     
T_TITLE                 VARCHAR2(300)  
T_CONTENT               VARCHAR2(1000) 
T_DATE                  DATE           
T_COUNT                 NUMBER(10)     
T_CTGR_NO               NUMBER(10)     
T_ADDRESS_NAME          VARCHAR2(100)  
T_ADDRESS_LAT           NUMBER(20,10)  
T_ADDRESS_LNG           NUMBER(20,10)  
USER_ID                 VARCHAR2(30) 
*/

--[town_reaction]
/*
insert into town_reaction(t_reac_no,t_reac_type,t_no,user_id) values(TOWN_REACTION_T_REAC_NO_SEQ.nextval,1,6,'carrot3');
insert into town_reaction(t_reac_no,t_reac_type,t_no,user_id) values(TOWN_REACTION_T_REAC_NO_SEQ.nextval,1,6,'carrot2');
insert into town_reaction(t_reac_no,t_reac_type,t_no,user_id) values(TOWN_REACTION_T_REAC_NO_SEQ.nextval,1,6,'carrot1');
insert into town_reaction(t_reac_no,t_reac_type,t_no,user_id) values(TOWN_REACTION_T_REAC_NO_SEQ.nextval,4,6,'carrot5');
insert into town_reaction(t_reac_no,t_reac_type,t_no,user_id) values(TOWN_REACTION_T_REAC_NO_SEQ.nextval,4,6,'carrot6');
insert into town_reaction(t_reac_no,t_reac_type,t_no,user_id) values(TOWN_REACTION_T_REAC_NO_SEQ.nextval,4,6,'carrot7');
insert into town_reaction(t_reac_no,t_reac_type,t_no,user_id) values(TOWN_REACTION_T_REAC_NO_SEQ.nextval,4,6,'carrot8');
*/

--****** 3개의 table에 insert를 동시에 하는 경우
--(1set)
--[town_board]carrot7, 서초동, 동네소식
insert into town_board(t_no, t_title, t_content, t_date, t_count, t_ctgr_no,t_address_name, t_address_lat,t_address_lng,user_id)
values(TOWN_BOARD_T_NO_SEQ.nextval, '미용실 추천해주세요','기분전환 겸 염색하고 싶은데 추천할만한 곳 있을까요?',sysdate-6,10,1,'역삼동',37.4923615, 127.0292881,'carrot1');
--[town_img]
insert into town_img(t_img_no, t_img_name, t_no) values(TOWN_IMG_T_IMG_NO_SEQ.nextval,'미용실.jpg',TOWN_BOARD_T_NO_SEQ.currval);
--[town_reaction]
insert into town_reaction(t_reac_no,t_reac_type,t_no,user_id) values(TOWN_REACTION_T_REAC_NO_SEQ.nextval,1,TOWN_BOARD_T_NO_SEQ.currval,'carrot7');
insert into town_reaction(t_reac_no,t_reac_type,t_no,user_id) values(TOWN_REACTION_T_REAC_NO_SEQ.nextval,1,TOWN_BOARD_T_NO_SEQ.currval,'carrot2');
insert into town_reaction(t_reac_no,t_reac_type,t_no,user_id) values(TOWN_REACTION_T_REAC_NO_SEQ.nextval,1,TOWN_BOARD_T_NO_SEQ.currval,'carrot3');
insert into town_reaction(t_reac_no,t_reac_type,t_no,user_id) values(TOWN_REACTION_T_REAC_NO_SEQ.nextval,4,TOWN_BOARD_T_NO_SEQ.currval,'carrot4');
insert into town_reaction(t_reac_no,t_reac_type,t_no,user_id) values(TOWN_REACTION_T_REAC_NO_SEQ.nextval,4,TOWN_BOARD_T_NO_SEQ.currval,'carrot5');
insert into town_reaction(t_reac_no,t_reac_type,t_no,user_id) values(TOWN_REACTION_T_REAC_NO_SEQ.nextval,4,TOWN_BOARD_T_NO_SEQ.currval,'carrot6');
insert into town_reaction(t_reac_no,t_reac_type,t_no,user_id) values(TOWN_REACTION_T_REAC_NO_SEQ.nextval,4,TOWN_BOARD_T_NO_SEQ.currval,'carrot8');
--[town_wishlist]
insert into town_wishlist(t_wl_no,user_id,t_no) values(TOWN_WISHLIST_T_WL_NO_SEQ.nextval,'carrot3',TOWN_BOARD_T_NO_SEQ.currval);
insert into town_wishlist(t_wl_no,user_id,t_no) values(TOWN_WISHLIST_T_WL_NO_SEQ.nextval,'carrot2',TOWN_BOARD_T_NO_SEQ.currval);
insert into town_wishlist(t_wl_no,user_id,t_no) values(TOWN_WISHLIST_T_WL_NO_SEQ.nextval,'carrot1',TOWN_BOARD_T_NO_SEQ.currval);

--(1set)
--[town_board]
insert into town_board(t_no, t_title, t_content, t_date, t_count, t_ctgr_no,t_address_name, t_address_lat,t_address_lng,user_id)
values(TOWN_BOARD_T_NO_SEQ.nextval, '날씨가 나빠요~','비가 너무 많이와요',sysdate-3,10,1,'서초동',37.4923615, 127.0292881,'carrot2');
--[town_img]
insert into town_img(t_img_no, t_img_name, t_no) values(TOWN_IMG_T_IMG_NO_SEQ.nextval,'미용실.jpg',TOWN_BOARD_T_NO_SEQ.currval);
--[town_reaction]
insert into town_reaction(t_reac_no,t_reac_type,t_no,user_id) values(TOWN_REACTION_T_REAC_NO_SEQ.nextval,1,TOWN_BOARD_T_NO_SEQ.currval,'carrot1');
insert into town_reaction(t_reac_no,t_reac_type,t_no,user_id) values(TOWN_REACTION_T_REAC_NO_SEQ.nextval,1,TOWN_BOARD_T_NO_SEQ.currval,'carrot7');
insert into town_reaction(t_reac_no,t_reac_type,t_no,user_id) values(TOWN_REACTION_T_REAC_NO_SEQ.nextval,1,TOWN_BOARD_T_NO_SEQ.currval,'carrot3');
insert into town_reaction(t_reac_no,t_reac_type,t_no,user_id) values(TOWN_REACTION_T_REAC_NO_SEQ.nextval,4,TOWN_BOARD_T_NO_SEQ.currval,'carrot4');
insert into town_reaction(t_reac_no,t_reac_type,t_no,user_id) values(TOWN_REACTION_T_REAC_NO_SEQ.nextval,4,TOWN_BOARD_T_NO_SEQ.currval,'carrot5');
insert into town_reaction(t_reac_no,t_reac_type,t_no,user_id) values(TOWN_REACTION_T_REAC_NO_SEQ.nextval,4,TOWN_BOARD_T_NO_SEQ.currval,'carrot6');
insert into town_reaction(t_reac_no,t_reac_type,t_no,user_id) values(TOWN_REACTION_T_REAC_NO_SEQ.nextval,4,TOWN_BOARD_T_NO_SEQ.currval,'carrot8');
--[town_wishlist]
insert into town_wishlist(t_wl_no,user_id,t_no) values(TOWN_WISHLIST_T_WL_NO_SEQ.nextval,'carrot3',TOWN_BOARD_T_NO_SEQ.currval);
insert into town_wishlist(t_wl_no,user_id,t_no) values(TOWN_WISHLIST_T_WL_NO_SEQ.nextval,'carrot2',TOWN_BOARD_T_NO_SEQ.currval);
insert into town_wishlist(t_wl_no,user_id,t_no) values(TOWN_WISHLIST_T_WL_NO_SEQ.nextval,'carrot1',TOWN_BOARD_T_NO_SEQ.currval);
--(1set)
--[town_board]
insert into town_board(t_no, t_title, t_content, t_date, t_count, t_ctgr_no,t_address_name, t_address_lat,t_address_lng,user_id)
values(TOWN_BOARD_T_NO_SEQ.nextval, '좋은날씨~','한강가서 라면 먹고싶어요',sysdate-8,10,1,'역삼동',37.4923615, 127.0292881,'carrot2');
--[town_img]
insert into town_img(t_img_no, t_img_name, t_no) values(TOWN_IMG_T_IMG_NO_SEQ.nextval,'미용실.jpg',TOWN_BOARD_T_NO_SEQ.currval);
--[town_reaction]
insert into town_reaction(t_reac_no,t_reac_type,t_no,user_id) values(TOWN_REACTION_T_REAC_NO_SEQ.nextval,1,TOWN_BOARD_T_NO_SEQ.currval,'carrot1');
insert into town_reaction(t_reac_no,t_reac_type,t_no,user_id) values(TOWN_REACTION_T_REAC_NO_SEQ.nextval,1,TOWN_BOARD_T_NO_SEQ.currval,'carrot7');
insert into town_reaction(t_reac_no,t_reac_type,t_no,user_id) values(TOWN_REACTION_T_REAC_NO_SEQ.nextval,1,TOWN_BOARD_T_NO_SEQ.currval,'carrot3');
insert into town_reaction(t_reac_no,t_reac_type,t_no,user_id) values(TOWN_REACTION_T_REAC_NO_SEQ.nextval,4,TOWN_BOARD_T_NO_SEQ.currval,'carrot4');
insert into town_reaction(t_reac_no,t_reac_type,t_no,user_id) values(TOWN_REACTION_T_REAC_NO_SEQ.nextval,4,TOWN_BOARD_T_NO_SEQ.currval,'carrot5');
insert into town_reaction(t_reac_no,t_reac_type,t_no,user_id) values(TOWN_REACTION_T_REAC_NO_SEQ.nextval,4,TOWN_BOARD_T_NO_SEQ.currval,'carrot6');
insert into town_reaction(t_reac_no,t_reac_type,t_no,user_id) values(TOWN_REACTION_T_REAC_NO_SEQ.nextval,4,TOWN_BOARD_T_NO_SEQ.currval,'carrot8');
--[town_wishlist]
insert into town_wishlist(t_wl_no,user_id,t_no) values(TOWN_WISHLIST_T_WL_NO_SEQ.nextval,'carrot3',TOWN_BOARD_T_NO_SEQ.currval);
insert into town_wishlist(t_wl_no,user_id,t_no) values(TOWN_WISHLIST_T_WL_NO_SEQ.nextval,'carrot2',TOWN_BOARD_T_NO_SEQ.currval);
insert into town_wishlist(t_wl_no,user_id,t_no) values(TOWN_WISHLIST_T_WL_NO_SEQ.nextval,'carrot1',TOWN_BOARD_T_NO_SEQ.currval);
--(1set)
--[town_board]
insert into town_board(t_no, t_title, t_content, t_date, t_count, t_ctgr_no,t_address_name, t_address_lat,t_address_lng,user_id)
values(TOWN_BOARD_T_NO_SEQ.nextval, '배고파요!','허니콤보를 먹고싶어요',sysdate-10,10,1,'서초동',37.4923615, 127.0292881,'carrot4');
--[town_img]
insert into town_img(t_img_no, t_img_name, t_no) values(TOWN_IMG_T_IMG_NO_SEQ.nextval,'미용실.jpg',TOWN_BOARD_T_NO_SEQ.currval);
--[town_reaction]
insert into town_reaction(t_reac_no,t_reac_type,t_no,user_id) values(TOWN_REACTION_T_REAC_NO_SEQ.nextval,1,TOWN_BOARD_T_NO_SEQ.currval,'carrot1');
insert into town_reaction(t_reac_no,t_reac_type,t_no,user_id) values(TOWN_REACTION_T_REAC_NO_SEQ.nextval,1,TOWN_BOARD_T_NO_SEQ.currval,'carrot2');
insert into town_reaction(t_reac_no,t_reac_type,t_no,user_id) values(TOWN_REACTION_T_REAC_NO_SEQ.nextval,1,TOWN_BOARD_T_NO_SEQ.currval,'carrot3');
insert into town_reaction(t_reac_no,t_reac_type,t_no,user_id) values(TOWN_REACTION_T_REAC_NO_SEQ.nextval,4,TOWN_BOARD_T_NO_SEQ.currval,'carrot7');
insert into town_reaction(t_reac_no,t_reac_type,t_no,user_id) values(TOWN_REACTION_T_REAC_NO_SEQ.nextval,4,TOWN_BOARD_T_NO_SEQ.currval,'carrot5');
insert into town_reaction(t_reac_no,t_reac_type,t_no,user_id) values(TOWN_REACTION_T_REAC_NO_SEQ.nextval,4,TOWN_BOARD_T_NO_SEQ.currval,'carrot6');
insert into town_reaction(t_reac_no,t_reac_type,t_no,user_id) values(TOWN_REACTION_T_REAC_NO_SEQ.nextval,4,TOWN_BOARD_T_NO_SEQ.currval,'carrot8');
--[town_wishlist]
insert into town_wishlist(t_wl_no,user_id,t_no) values(TOWN_WISHLIST_T_WL_NO_SEQ.nextval,'carrot3',TOWN_BOARD_T_NO_SEQ.currval);
insert into town_wishlist(t_wl_no,user_id,t_no) values(TOWN_WISHLIST_T_WL_NO_SEQ.nextval,'carrot2',TOWN_BOARD_T_NO_SEQ.currval);
insert into town_wishlist(t_wl_no,user_id,t_no) values(TOWN_WISHLIST_T_WL_NO_SEQ.nextval,'carrot1',TOWN_BOARD_T_NO_SEQ.currval);
--(1set)
--[town_board]
insert into town_board(t_no, t_title, t_content, t_date, t_count, t_ctgr_no,t_address_name, t_address_lat,t_address_lng,user_id)
values(TOWN_BOARD_T_NO_SEQ.nextval, '목말라요','물이 필요해요',sysdate-7,10,1,'서초동',37.4923615, 127.0292881,'carrot5');
--[town_img]
insert into town_img(t_img_no, t_img_name, t_no) values(TOWN_IMG_T_IMG_NO_SEQ.nextval,'미용실.jpg',TOWN_BOARD_T_NO_SEQ.currval);
--[town_reaction]
insert into town_reaction(t_reac_no,t_reac_type,t_no,user_id) values(TOWN_REACTION_T_REAC_NO_SEQ.nextval,1,TOWN_BOARD_T_NO_SEQ.currval,'carrot1');
insert into town_reaction(t_reac_no,t_reac_type,t_no,user_id) values(TOWN_REACTION_T_REAC_NO_SEQ.nextval,1,TOWN_BOARD_T_NO_SEQ.currval,'carrot2');
insert into town_reaction(t_reac_no,t_reac_type,t_no,user_id) values(TOWN_REACTION_T_REAC_NO_SEQ.nextval,1,TOWN_BOARD_T_NO_SEQ.currval,'carrot3');
insert into town_reaction(t_reac_no,t_reac_type,t_no,user_id) values(TOWN_REACTION_T_REAC_NO_SEQ.nextval,4,TOWN_BOARD_T_NO_SEQ.currval,'carrot4');
insert into town_reaction(t_reac_no,t_reac_type,t_no,user_id) values(TOWN_REACTION_T_REAC_NO_SEQ.nextval,4,TOWN_BOARD_T_NO_SEQ.currval,'carrot7');
insert into town_reaction(t_reac_no,t_reac_type,t_no,user_id) values(TOWN_REACTION_T_REAC_NO_SEQ.nextval,4,TOWN_BOARD_T_NO_SEQ.currval,'carrot6');
insert into town_reaction(t_reac_no,t_reac_type,t_no,user_id) values(TOWN_REACTION_T_REAC_NO_SEQ.nextval,4,TOWN_BOARD_T_NO_SEQ.currval,'carrot8');
--[town_wishlist]
insert into town_wishlist(t_wl_no,user_id,t_no) values(TOWN_WISHLIST_T_WL_NO_SEQ.nextval,'carrot3',TOWN_BOARD_T_NO_SEQ.currval);
insert into town_wishlist(t_wl_no,user_id,t_no) values(TOWN_WISHLIST_T_WL_NO_SEQ.nextval,'carrot2',TOWN_BOARD_T_NO_SEQ.currval);
insert into town_wishlist(t_wl_no,user_id,t_no) values(TOWN_WISHLIST_T_WL_NO_SEQ.nextval,'carrot1',TOWN_BOARD_T_NO_SEQ.currval);

--(1set)
--[town_board]
insert into town_board(t_no, t_title, t_content, t_date, t_count, t_ctgr_no,t_address_name, t_address_lat,t_address_lng,user_id)
values(TOWN_BOARD_T_NO_SEQ.nextval, '과자가 맛있어!','허니버터칩 흰색이 너무 맛있어',sysdate-5,10,1,'논현동',37.4923615, 127.0292881,'carrot5');
--[town_img]
insert into town_img(t_img_no, t_img_name, t_no) values(TOWN_IMG_T_IMG_NO_SEQ.nextval,'미용실.jpg',TOWN_BOARD_T_NO_SEQ.currval);
--[town_reaction]
insert into town_reaction(t_reac_no,t_reac_type,t_no,user_id) values(TOWN_REACTION_T_REAC_NO_SEQ.nextval,1,TOWN_BOARD_T_NO_SEQ.currval,'carrot1');
insert into town_reaction(t_reac_no,t_reac_type,t_no,user_id) values(TOWN_REACTION_T_REAC_NO_SEQ.nextval,1,TOWN_BOARD_T_NO_SEQ.currval,'carrot2');
insert into town_reaction(t_reac_no,t_reac_type,t_no,user_id) values(TOWN_REACTION_T_REAC_NO_SEQ.nextval,1,TOWN_BOARD_T_NO_SEQ.currval,'carrot3');
insert into town_reaction(t_reac_no,t_reac_type,t_no,user_id) values(TOWN_REACTION_T_REAC_NO_SEQ.nextval,4,TOWN_BOARD_T_NO_SEQ.currval,'carrot4');
insert into town_reaction(t_reac_no,t_reac_type,t_no,user_id) values(TOWN_REACTION_T_REAC_NO_SEQ.nextval,4,TOWN_BOARD_T_NO_SEQ.currval,'carrot7');
insert into town_reaction(t_reac_no,t_reac_type,t_no,user_id) values(TOWN_REACTION_T_REAC_NO_SEQ.nextval,4,TOWN_BOARD_T_NO_SEQ.currval,'carrot6');
insert into town_reaction(t_reac_no,t_reac_type,t_no,user_id) values(TOWN_REACTION_T_REAC_NO_SEQ.nextval,4,TOWN_BOARD_T_NO_SEQ.currval,'carrot8');
--[town_wishlist]
insert into town_wishlist(t_wl_no,user_id,t_no) values(TOWN_WISHLIST_T_WL_NO_SEQ.nextval,'carrot3',TOWN_BOARD_T_NO_SEQ.currval);
insert into town_wishlist(t_wl_no,user_id,t_no) values(TOWN_WISHLIST_T_WL_NO_SEQ.nextval,'carrot2',TOWN_BOARD_T_NO_SEQ.currval);
insert into town_wishlist(t_wl_no,user_id,t_no) values(TOWN_WISHLIST_T_WL_NO_SEQ.nextval,'carrot1',TOWN_BOARD_T_NO_SEQ.currval);






--[town_img]
--insert into town_img(t_img_no, t_img_name, t_no) values(TOWN_IMG_T_IMG_NO_SEQ.nextval,'미용실.jpg',TOWN_BOARD_T_NO_SEQ.currval);

--[town_reaction]
/*
insert into town_reaction(t_reac_no,t_reac_type,t_no,user_id) values(TOWN_REACTION_T_REAC_NO_SEQ.nextval,1,TOWN_BOARD_T_NO_SEQ.currval,'carrot1');
insert into town_reaction(t_reac_no,t_reac_type,t_no,user_id) values(TOWN_REACTION_T_REAC_NO_SEQ.nextval,1,TOWN_BOARD_T_NO_SEQ.currval,'carrot2');
insert into town_reaction(t_reac_no,t_reac_type,t_no,user_id) values(TOWN_REACTION_T_REAC_NO_SEQ.nextval,1,TOWN_BOARD_T_NO_SEQ.currval,'carrot3');
insert into town_reaction(t_reac_no,t_reac_type,t_no,user_id) values(TOWN_REACTION_T_REAC_NO_SEQ.nextval,4,TOWN_BOARD_T_NO_SEQ.currval,'carrot4');
insert into town_reaction(t_reac_no,t_reac_type,t_no,user_id) values(TOWN_REACTION_T_REAC_NO_SEQ.nextval,4,TOWN_BOARD_T_NO_SEQ.currval,'carrot5');
insert into town_reaction(t_reac_no,t_reac_type,t_no,user_id) values(TOWN_REACTION_T_REAC_NO_SEQ.nextval,4,TOWN_BOARD_T_NO_SEQ.currval,'carrot6');
insert into town_reaction(t_reac_no,t_reac_type,t_no,user_id) values(TOWN_REACTION_T_REAC_NO_SEQ.nextval,4,TOWN_BOARD_T_NO_SEQ.currval,'carrot8');
*/


--######################[town_wishlist]
desc town_wishlist;

/*
이름      널?       유형           
------- -------- ------------ 
T_WL_NO NOT NULL NUMBER(10)   
USER_ID          VARCHAR2(10) 
T_NO             NUMBER(10) 
*/
select * from town_wishlist;
/*
insert into town_wishlist(t_wl_no,user_id,t_no) values(TOWN_WISHLIST_T_WL_NO_SEQ.nextval,'carrot3',6);
insert into town_wishlist(t_wl_no,user_id,t_no) values(TOWN_WISHLIST_T_WL_NO_SEQ.nextval,'carrot2',6);
insert into town_wishlist(t_wl_no,user_id,t_no) values(TOWN_WISHLIST_T_WL_NO_SEQ.nextval,'carrot1',6);

insert into town_wishlist(t_wl_no,user_id,t_no) values(TOWN_WISHLIST_T_WL_NO_SEQ.nextval,'carrot3',5);
insert into town_wishlist(t_wl_no,user_id,t_no) values(TOWN_WISHLIST_T_WL_NO_SEQ.nextval,'carrot2',5);
insert into town_wishlist(t_wl_no,user_id,t_no) values(TOWN_WISHLIST_T_WL_NO_SEQ.nextval,'carrot1',5);
*/






--######################[town_reply]
--[town_reply] --> 미완료. 은비가 마무리할 예정
desc town_reply;
/*
이름              널?       유형             
--------------- -------- -------------- 
T_REPLY_NO      NOT NULL NUMBER(10)     
T_REPLY_TITLE            VARCHAR2(300)  
T_REPLY_CONTENT          VARCHAR2(1000) 
T_REPLY_DATE             DATE           
GROUPNO                  NUMBER(10)     
STEP                     NUMBER(10)     
DEPTH                    NUMBER(10)     
USER_ID                  VARCHAR2(10)   
T_NO                     NUMBER(10)  
*/
select * from town_board;
