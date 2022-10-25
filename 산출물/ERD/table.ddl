
DROP TABLE review_img CASCADE CONSTRAINTS;
DROP TABLE promise CASCADE CONSTRAINTS;
DROP TABLE review CASCADE CONSTRAINTS;
DROP TABLE town_reaction CASCADE CONSTRAINTS;
DROP TABLE town_reply CASCADE CONSTRAINTS;
DROP TABLE town_img CASCADE CONSTRAINTS;
DROP TABLE town_wishlist CASCADE CONSTRAINTS;
DROP TABLE town_board CASCADE CONSTRAINTS;
DROP TABLE town_category CASCADE CONSTRAINTS;
DROP TABLE chat_contents CASCADE CONSTRAINTS;
DROP TABLE chat_room CASCADE CONSTRAINTS;
DROP TABLE notice CASCADE CONSTRAINTS;
DROP TABLE invitation CASCADE CONSTRAINTS;
DROP TABLE address CASCADE CONSTRAINTS;
DROP TABLE wishlist CASCADE CONSTRAINTS;
DROP TABLE product_img CASCADE CONSTRAINTS;
DROP TABLE transfer CASCADE CONSTRAINTS;
DROP TABLE orders CASCADE CONSTRAINTS;
DROP TABLE payment CASCADE CONSTRAINTS;
DROP TABLE product CASCADE CONSTRAINTS;
DROP TABLE p_category CASCADE CONSTRAINTS;
DROP TABLE userinfo CASCADE CONSTRAINTS;

CREATE TABLE userinfo(
		user_id                       		VARCHAR2(30)		 NULL ,
		user_pw                       		VARCHAR2(50)		 NULL ,
		user_name                     		VARCHAR2(50)		 NULL ,
		user_email                    		VARCHAR2(100)		 NULL ,
		user_phone                    		VARCHAR2(15)		 NULL ,
		user_freshness                		NUMBER(10,1)		 DEFAULT 36.5		 NULL ,
		user_point                    		NUMBER(10)		 NULL ,
		user_profile                  		VARCHAR2(200)		 NULL 
);


CREATE TABLE p_category(
		p_ctgr_no                     		NUMBER(10)		 NULL ,
		p_ctgr_name                   		VARCHAR2(50)		 NULL 
);

DROP SEQUENCE p_category_p_ctgr_no_SEQ;

CREATE SEQUENCE p_category_p_ctgr_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;

CREATE TABLE product(
		p_no                          		NUMBER(20)		 NULL ,
		p_title                       		VARCHAR2(500)		 NULL ,
		p_desc                        		VARCHAR2(500)		 NULL ,
		p_price                       		NUMBER(20)		 NULL ,
		p_date                        		DATE		 NULL ,
		p_sell                        		NUMBER(10)		 NULL ,
		p_count                       		NUMBER(10)		 NULL ,
		p_wish                        		NUMBER(10)		 NULL ,
		p_address_name                		VARCHAR2(100)		 NULL ,
		p_address_lat                 		NUMBER(20,10)		 NULL ,
		p_address_lng                 		NUMBER(20,10)		 NULL ,
		p_ctgr_no                     		NUMBER(10)		 NULL ,
		user_id                       		VARCHAR2(30)		 NULL 
);

DROP SEQUENCE product_p_no_SEQ;

CREATE SEQUENCE product_p_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;


CREATE TABLE payment(
		payment_no                    		VARCHAR2(30)		 NULL ,
		payment_method                		VARCHAR2(30)		 NULL ,
		payment_amount                		NUMBER(10)		 NULL ,
		payment_date                  		DATE		 NULL ,
		user_id                       		VARCHAR2(30)		 NULL 
);


CREATE TABLE orders(
		orders_no                     		NUMBER(10)		 NULL ,
		p_no                          		NUMBER(20)		 NULL ,
		user_id                       		VARCHAR2(10)		 NULL ,
		orders_date                   		DATE		 NULL 
);

DROP SEQUENCE orders_orders_no_SEQ;

CREATE SEQUENCE orders_orders_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;


CREATE TABLE transfer(
		transfer_no                   		NUMBER(10)		 NULL ,
		transfer_deposit              		NUMBER(10)		 NULL ,
		transfer_withdraw             		NUMBER(10)		 NULL ,
		transfer_date                 		DATE		 NULL ,
		user_id                       		VARCHAR2(30)		 NULL ,
		orders_no                     		NUMBER(10)		 NULL ,
		p_no                          		NUMBER(20)		 NULL 
);

DROP SEQUENCE transfer_transfer_no_SEQ;

CREATE SEQUENCE transfer_transfer_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;

CREATE TABLE product_img(
		pi_no                         		NUMBER(10)		 NULL ,
		pi_name                       		VARCHAR2(50)		 NULL ,
		p_no                          		NUMBER(20)		 NULL 
);

DROP SEQUENCE product_img_pi_no_SEQ;

CREATE SEQUENCE product_img_pi_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;

CREATE TABLE wishlist(
		wishlist_no                   		NUMBER(10)		 NULL ,
		p_no                          		NUMBER(20)		 NULL ,
		user_id                       		VARCHAR2(30)		 NULL 
);

DROP SEQUENCE wishlist_wishlist_no_SEQ;

CREATE SEQUENCE wishlist_wishlist_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;


CREATE TABLE address(
		address_no                    		NUMBER(30)		 NULL ,
		address_name                  		VARCHAR2(100)		 NULL ,
		address_lat                   		NUMBER(20,10)		 NULL ,
		address_lng                   		NUMBER(20,10)		 NULL ,
		address_range                 		NUMBER(20)		 NULL ,
		user_id                       		VARCHAR2(30)		 NULL 
);

DROP SEQUENCE address_address_no_SEQ;

CREATE SEQUENCE address_address_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;

CREATE TABLE invitation(
		invi_no                       		NUMBER(10)		 NULL ,
		invi_email                    		VARCHAR2(100)		 NULL ,
		user_id                       		VARCHAR2(30)		 NULL 
);

DROP SEQUENCE invitation_invi_no_SEQ;

CREATE SEQUENCE invitation_invi_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;


CREATE TABLE notice(
		notice_no                     		NUMBER(10)		 NULL ,
		notice_title                  		VARCHAR2(100)		 NULL ,
		notice_content                		VARCHAR2(1000)		 NULL ,
		notice_date                   		DATE		 NULL ,
		notice_count                  		NUMBER(10)		 NULL ,
		notice_fix                    		NUMBER(10)		 DEFAULT 0		 NULL 
);

DROP SEQUENCE notice_notice_no_SEQ;

CREATE SEQUENCE notice_notice_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;


CREATE TABLE chat_room(
		c_room_no                     		NUMBER(10)		 NULL ,
		from_id                       		VARCHAR2(20)		 NULL ,
		to_id                         		VARCHAR2(20)		 NULL ,
		from_id_in                     		NUMBER(10)		 NULL ,
		to_id_in                            NUMBER(10)		 NULL ,
		p_no                          		NUMBER(20)		 NULL 
);

DROP SEQUENCE chat_room_c_room_no_SEQ;

CREATE SEQUENCE chat_room_c_room_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;

CREATE TABLE chat_contents(
		c_content_no                  		NUMBER(10)		 NULL ,
		c_content                     		VARCHAR2(100)		 NULL ,
		send_time                     		DATE		 NULL ,
		c_read                        		NUMBER(10)		 NULL ,
		user_id                       		VARCHAR2(30)		 NULL ,
		c_room_no                     		NUMBER(10)		 NULL 
);

DROP SEQUENCE chat_contents_c_content_no_SEQ;

CREATE SEQUENCE chat_contents_c_content_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;

CREATE TABLE town_category(
		t_ctgr_no                     		NUMBER(10)		 NULL ,
		t_ctgr_name                   		VARCHAR2(100)		 NULL 
);

DROP SEQUENCE town_category_t_ctgr_no_SEQ;

CREATE SEQUENCE town_category_t_ctgr_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;



CREATE TABLE town_board(
		t_no                          		NUMBER(10)		 NULL ,
		t_title                       		VARCHAR2(300)		 NULL ,
		t_content                     		VARCHAR2(1000)		 NULL ,
		t_date                        		DATE		 NULL ,
		t_count                       		NUMBER(10)		 NULL ,
		t_ctgr_no                     		NUMBER(10)		 NULL ,
		t_address_name                		VARCHAR2(100)		 NULL ,
		t_address_lat                 		NUMBER(20,10)		 NULL ,
		t_address_lng                 		NUMBER(20,10)		 NULL ,
		user_id                       		VARCHAR2(30)		 NULL 
);

DROP SEQUENCE town_board_t_no_SEQ;

CREATE SEQUENCE town_board_t_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;

CREATE TABLE town_wishlist(
		t_wl_no                       		NUMBER(10)		 NULL ,
		user_id                       		VARCHAR2(10)		 NULL ,
		t_no                          		NUMBER(10)		 NULL 
);

DROP SEQUENCE town_wishlist_t_wl_no_SEQ;

CREATE SEQUENCE town_wishlist_t_wl_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;

CREATE TABLE town_img(
		t_img_no                      		NUMBER(10)		 NULL ,
		t_img_name                    		VARCHAR2(100)		 NULL ,
		t_no                          		NUMBER(10)		 NULL 
);

DROP SEQUENCE town_img_t_img_no_SEQ;

CREATE SEQUENCE town_img_t_img_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;

CREATE TABLE town_reply(
		t_reply_no                    		NUMBER(10)		 NULL ,
		t_reply_title                 		VARCHAR2(300)		 NULL ,
		t_reply_content               		VARCHAR2(1000)		 NULL ,
		t_reply_date                  		DATE		 NULL ,
		groupno                       		NUMBER(10)		 NULL ,
		step                          		NUMBER(10)		 NULL ,
		depth                         		NUMBER(10)		 NULL ,
		user_id                       		VARCHAR2(30)		 NULL ,
		t_no                          		NUMBER(10)		 NULL 
);

DROP SEQUENCE town_reply_t_reply_no_SEQ;

CREATE SEQUENCE town_reply_t_reply_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;

CREATE TABLE town_reaction(
		t_reac_no                     		NUMBER(10)		 NULL ,
		t_reac_type                   		NUMBER(10)		 NULL ,
		t_no                          		NUMBER(10)		 NULL ,
		user_id                       		VARCHAR2(30)		 NULL 
);

DROP SEQUENCE town_reaction_t_reac_no_SEQ;

CREATE SEQUENCE town_reaction_t_reac_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;

CREATE TABLE review(
		review_no                     		NUMBER(10)		 NULL ,
		review_desc                   		VARCHAR2(100)		 NULL ,
		review_image                  		VARCHAR2(100)		 NULL ,
		review_point                  		NUMBER(10,1)		 NULL ,
		orders_no                     		NUMBER(10)		 NULL ,
		user_id                       		VARCHAR2(30)		 NULL 
);

DROP SEQUENCE review_review_no_SEQ;

CREATE SEQUENCE review_review_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;


CREATE TABLE promise(
		c_room_no                     		NUMBER(10)		 NULL ,
		c_app_lat                     		NUMBER(20,10)		 NULL ,
		c_app_lng                     		NUMBER(20,10)		 NULL ,
		c_app_spot                    		VARCHAR2(80)		 NULL ,
		c_app_date                    		DATE		 NULL 
);


CREATE TABLE review_img(
		review_img_no                 		NUMBER(10)		 NULL ,
		review_img_name               		VARCHAR2(200)		 NOT NULL,
		review_no                     		NUMBER(10)		 NULL 
);

DROP SEQUENCE review_img_review_img_no_SEQ;

CREATE SEQUENCE review_img_review_img_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;


ALTER TABLE userinfo ADD CONSTRAINT IDX_userinfo_PK PRIMARY KEY (user_id);

ALTER TABLE p_category ADD CONSTRAINT IDX_p_category_PK PRIMARY KEY (p_ctgr_no);

ALTER TABLE product ADD CONSTRAINT IDX_product_PK PRIMARY KEY (p_no);
ALTER TABLE product ADD CONSTRAINT IDX_product_FK0 FOREIGN KEY (p_ctgr_no) REFERENCES p_category (p_ctgr_no);
ALTER TABLE product ADD CONSTRAINT IDX_product_FK1 FOREIGN KEY (user_id) REFERENCES userinfo (user_id);

ALTER TABLE payment ADD CONSTRAINT IDX_payment_PK PRIMARY KEY (payment_no);
ALTER TABLE payment ADD CONSTRAINT IDX_payment_FK0 FOREIGN KEY (user_id) REFERENCES userinfo (user_id);

ALTER TABLE orders ADD CONSTRAINT IDX_orders_PK PRIMARY KEY (orders_no);
ALTER TABLE orders ADD CONSTRAINT IDX_orders_FK0 FOREIGN KEY (p_no) REFERENCES product (p_no);
ALTER TABLE orders ADD CONSTRAINT IDX_orders_FK1 FOREIGN KEY (user_id) REFERENCES userinfo (user_id);

ALTER TABLE transfer ADD CONSTRAINT IDX_transfer_PK PRIMARY KEY (transfer_no);
ALTER TABLE transfer ADD CONSTRAINT IDX_transfer_FK0 FOREIGN KEY (user_id) REFERENCES userinfo (user_id);
ALTER TABLE transfer ADD CONSTRAINT IDX_transfer_FK1 FOREIGN KEY (orders_no) REFERENCES orders (orders_no);
ALTER TABLE transfer ADD CONSTRAINT IDX_transfer_FK2 FOREIGN KEY (p_no) REFERENCES product (p_no);

ALTER TABLE product_img ADD CONSTRAINT IDX_product_img_PK PRIMARY KEY (pi_no);
ALTER TABLE product_img ADD CONSTRAINT IDX_product_img_FK0 FOREIGN KEY (p_no) REFERENCES product (p_no);

ALTER TABLE wishlist ADD CONSTRAINT IDX_wishlist_PK PRIMARY KEY (wishlist_no);
ALTER TABLE wishlist ADD CONSTRAINT IDX_wishlist_FK0 FOREIGN KEY (p_no) REFERENCES product (p_no);
ALTER TABLE wishlist ADD CONSTRAINT IDX_wishlist_FK1 FOREIGN KEY (user_id) REFERENCES userinfo (user_id);

ALTER TABLE address ADD CONSTRAINT IDX_address_PK PRIMARY KEY (address_no);
ALTER TABLE address ADD CONSTRAINT IDX_address_FK0 FOREIGN KEY (user_id) REFERENCES userinfo (user_id);

ALTER TABLE invitation ADD CONSTRAINT IDX_invitation_PK PRIMARY KEY (invi_no);
ALTER TABLE invitation ADD CONSTRAINT IDX_invitation_FK0 FOREIGN KEY (user_id) REFERENCES userinfo (user_id);

ALTER TABLE notice ADD CONSTRAINT IDX_notice_PK PRIMARY KEY (notice_no);

ALTER TABLE chat_room ADD CONSTRAINT IDX_chat_room_PK PRIMARY KEY (c_room_no);
ALTER TABLE chat_room ADD CONSTRAINT IDX_chat_room_FK0 FOREIGN KEY (from_id) REFERENCES userinfo (user_id);
ALTER TABLE chat_room ADD CONSTRAINT IDX_chat_room_FK1 FOREIGN KEY (p_no) REFERENCES product (p_no);
ALTER TABLE chat_room ADD CONSTRAINT IDX_chat_room_FK2 FOREIGN KEY (to_id) REFERENCES userinfo (user_id);

ALTER TABLE chat_contents ADD CONSTRAINT IDX_chat_contents_PK PRIMARY KEY (c_content_no);
ALTER TABLE chat_contents ADD CONSTRAINT IDX_chat_contents_FK0 FOREIGN KEY (user_id) REFERENCES userinfo (user_id);
ALTER TABLE chat_contents ADD CONSTRAINT IDX_chat_contents_FK1 FOREIGN KEY (c_room_no) REFERENCES chat_room (c_room_no);

ALTER TABLE town_category ADD CONSTRAINT IDX_town_category_PK PRIMARY KEY (t_ctgr_no);

ALTER TABLE town_board ADD CONSTRAINT IDX_town_board_PK PRIMARY KEY (t_no);
ALTER TABLE town_board ADD CONSTRAINT IDX_town_board_FK0 FOREIGN KEY (t_ctgr_no) REFERENCES town_category (t_ctgr_no);
ALTER TABLE town_board ADD CONSTRAINT IDX_town_board_FK1 FOREIGN KEY (user_id) REFERENCES userinfo (user_id);

ALTER TABLE town_wishlist ADD CONSTRAINT IDX_town_wishlist_PK PRIMARY KEY (t_wl_no);
ALTER TABLE town_wishlist ADD CONSTRAINT IDX_town_wishlist_FK0 FOREIGN KEY (user_id) REFERENCES userinfo (user_id);
ALTER TABLE town_wishlist ADD CONSTRAINT IDX_town_wishlist_FK1 FOREIGN KEY (t_no) REFERENCES town_board (t_no);

ALTER TABLE town_img ADD CONSTRAINT IDX_town_img_PK PRIMARY KEY (t_img_no);
ALTER TABLE town_img ADD CONSTRAINT IDX_town_img_FK0 FOREIGN KEY (t_no) REFERENCES town_board (t_no);

ALTER TABLE town_reply ADD CONSTRAINT IDX_town_reply_PK PRIMARY KEY (t_reply_no);
ALTER TABLE town_reply ADD CONSTRAINT IDX_town_reply_FK0 FOREIGN KEY (user_id) REFERENCES userinfo (user_id);
ALTER TABLE town_reply ADD CONSTRAINT IDX_town_reply_FK1 FOREIGN KEY (t_no) REFERENCES town_board (t_no);

ALTER TABLE town_reaction ADD CONSTRAINT IDX_town_reaction_PK PRIMARY KEY (t_reac_no);
ALTER TABLE town_reaction ADD CONSTRAINT IDX_town_reaction_FK0 FOREIGN KEY (t_no) REFERENCES town_board (t_no);
ALTER TABLE town_reaction ADD CONSTRAINT IDX_town_reaction_FK1 FOREIGN KEY (user_id) REFERENCES userinfo (user_id);

ALTER TABLE review ADD CONSTRAINT IDX_review_PK PRIMARY KEY (review_no);
ALTER TABLE review ADD CONSTRAINT IDX_review_FK0 FOREIGN KEY (orders_no) REFERENCES orders (orders_no);
ALTER TABLE review ADD CONSTRAINT IDX_review_FK1 FOREIGN KEY (user_id) REFERENCES userinfo (user_id);

ALTER TABLE promise ADD CONSTRAINT IDX_promise_PK PRIMARY KEY (c_room_no);
ALTER TABLE promise ADD CONSTRAINT IDX_promise_FK0 FOREIGN KEY (c_room_no) REFERENCES chat_room (c_room_no);

ALTER TABLE review_img ADD CONSTRAINT IDX_review_img_PK PRIMARY KEY (review_img_no);
ALTER TABLE review_img ADD CONSTRAINT IDX_review_img_FK0 FOREIGN KEY (review_no) REFERENCES review (review_no);

