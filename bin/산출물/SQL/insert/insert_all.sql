/* [userinfo] **************************************************/
desc userinfo;
/*
이름             널?       유형            
-------------- -------- ------------- 
USER_ID        NOT NULL VARCHAR2(10)  
USER_PW                 VARCHAR2(10)  
USER_NAME               VARCHAR2(50)  
USER_EMAIL              VARCHAR2(100) 
USER_PHONE              VARCHAR2(15)  
USER_FRESHNESS          NUMBER(10,1)    
USER_POINT              NUMBER(10)    
USER_PROFILE            VARCHAR2(200) 
*/

SELECT
    *
FROM
    userinfo;

INSERT INTO userinfo (
    user_id,
    user_pw,
    user_name,
    user_email,
    user_phone,
    user_freshness,
    user_point,
    user_profile
) VALUES (
    'carrot1',
    '1111',
    '김당근',
    'carrot1@brown.com',
    '010-1111-1111',
    5,
    0,
    'carrot1.png'
);

INSERT INTO userinfo (
    user_id,
    user_pw,
    user_name,
    user_email,
    user_phone,
    user_freshness,
    user_point,
    user_profile
) VALUES (
    'carrot2',
    '2222',
    '이당근',
    'carrot2@brown.com',
    '010-2222-2222',
    0,
    0,
    'carrot2.png'
);

INSERT INTO userinfo (
    user_id,
    user_pw,
    user_name,
    user_email,
    user_phone,
    user_freshness,
    user_point,
    user_profile
) VALUES (
    'carrot3',
    '3333',
    '박당근',
    'carrot3@brown.com',
    '010-3333-3333',
    0,
    0,
    'carrot3.png'
);

INSERT INTO userinfo (
    user_id,
    user_pw,
    user_name,
    user_email,
    user_phone,
    user_freshness,
    user_point,
    user_profile
) VALUES (
    'carrot4',
    '4444',
    '정당근',
    'carrot4@brown.com',
    '010-4444-4444',
    0,
    0,
    'beet.jpg'
);

INSERT INTO userinfo (
    user_id,
    user_pw,
    user_name,
    user_email,
    user_phone,
    user_freshness,
    user_point,
    user_profile
) VALUES (
    'carrot5',
    '5555',
    '최당근',
    'carrot5@brown.com',
    '010-5555-5555',
    0,
    0,
    'carrot5.jpg'
);

INSERT INTO userinfo (
    user_id,
    user_pw,
    user_name,
    user_email,
    user_phone,
    user_freshness,
    user_point,
    user_profile
) VALUES (
    'carrot6',
    '6666',
    '임당근',
    'carrot6@brown.com',
    '010-6666-6666',
    0,
    0,
    'dog1.jpg'
);

INSERT INTO userinfo (
    user_id,
    user_pw,
    user_name,
    user_email,
    user_phone,
    user_freshness,
    user_point,
    user_profile
) VALUES (
    'carrot7',
    '7777',
    '이당근',
    'carrot7@brown.com',
    '010-7777-7777',
    0,
    0,
    'onion.png'
);

INSERT INTO userinfo (
    user_id,
    user_pw,
    user_name,
    user_email,
    user_phone,
    user_freshness,
    user_point,
    user_profile
) VALUES (
    'carrot8',
    '8888',
    '한당근',
    'carrot8@brown.com',
    '010-8888-8888',
    0,
    0,
    'potato.png'
);
INSERT INTO userinfo (
    user_id,
    user_pw,
    user_name,
    user_email,
    user_phone,
    user_freshness,
    user_point,
    user_profile
) VALUES (
    'K2478707404',
    'kakaotest1',
    'kakao1',
    'tjdudg@naver.com',
    '010-1234-5678',
    0,
    0,
    'newCarrot.jpg'
);
INSERT INTO userinfo (
    user_id,
    user_pw,
    user_name,
    user_email,
    user_phone,
    user_freshness,
    user_point,
    user_profile
) VALUES (
    'K2479051437',
    'kakaotest2',
    'kakao2',
    'brv19@hanmail.net',
    '010-1234-5678',
    0,
    0,
    'newCarrot.jpg'
);

INSERT INTO userinfo (
    user_id,
    user_pw,
    user_name,
    user_email,
    user_phone,
    user_freshness,
    user_point,
    user_profile
) VALUES (
    'admin',
    '1111',
    '흙당근관리자',
    'admin@brown.com',
    '010-1234-5678',
    0,
    0,
    'tomato.png'
);    

/* [address] **************************************************/
desc address;
/*
이름            널?       유형            
------------- -------- ------------- 
ADDRESS_NO    NOT NULL NUMBER(30)    
ADDRESS_NAME           VARCHAR2(100) 
ADDRESS_LAT            NUMBER(10,10) 
ADDRESS_LNG            NUMBER(10,10) 
ADDRESS_RANGE          NUMBER(20)    
USER_ID                VARCHAR2(30)    
*/
insert into address(address_no, address_name, address_lat,address_lng, address_range,user_id)
values(address_address_no_seq.nextval, '서울특별시 강남구 개포동', 37.4923615, 127.0292881, 3,'carrot1');
insert into address(address_no, address_name, address_lat,address_lng, address_range,user_id)
values(address_address_no_seq.nextval, '서울특별시 강남구 논현동', 37.50466804467962, 127.02458155935068,5,'carrot1');

insert into address(address_no, address_name, address_lat,address_lng, address_range,user_id)
values(address_address_no_seq.nextval, '서울특별시 강남구 대치동',37.4923615, 127.0292881,2,'carrot2');
insert into address(address_no, address_name, address_lat,address_lng, address_range,user_id)
values(address_address_no_seq.nextval, '서울특별시 강남구 도곡동',37.4923615, 127.0292881,4,'carrot2');

insert into address(address_no, address_name, address_lat,address_lng, address_range,user_id)
values(address_address_no_seq.nextval, '서울특별시 강남구 삼성동',37.50473249687563, 127.04905571787174,2,'carrot3');
insert into address(address_no, address_name, address_lat,address_lng, address_range,user_id)
values(address_address_no_seq.nextval, '서울특별시 강남구 세곡동',37.4923615, 127.0292881,3,'carrot3');

insert into address(address_no, address_name, address_lat,address_lng, address_range,user_id)
values(address_address_no_seq.nextval, '서울특별시 강남구 수서동',37.4923615, 127.0292881,3,'carrot4');
insert into address(address_no, address_name, address_lat,address_lng, address_range,user_id)
values(address_address_no_seq.nextval, '서울특별시 강남구 역삼동',37.4923615, 127.0292881,4,'carrot4');

insert into address(address_no, address_name, address_lat,address_lng, address_range,user_id)
values(address_address_no_seq.nextval, '서울특별시 강남구 역삼동',37.50077258731253, 127.0366018324289,3,'carrot5');
insert into address(address_no, address_name, address_lat,address_lng, address_range,user_id)
values(address_address_no_seq.nextval, '서울특별시 강남구 청담동',37.4923615, 127.0292881,5,'carrot5');

insert into address(address_no, address_name, address_lat,address_lng, address_range,user_id)
values(address_address_no_seq.nextval, '서울특별시 서초구 반포동',37.4923615, 127.0292881,3,'carrot6');
insert into address(address_no, address_name, address_lat,address_lng, address_range,user_id)
values(address_address_no_seq.nextval, '서울특별시 서초구 방배동',37.4923615, 127.0292881,5,'carrot6');

insert into address(address_no, address_name, address_lat,address_lng, address_range,user_id)
values(address_address_no_seq.nextval, '서울특별시 서초구 서초동',37.493965867028095, 127.01358662473638,3,'carrot7');
insert into address(address_no, address_name, address_lat,address_lng, address_range,user_id)
values(address_address_no_seq.nextval, '서울특별시 서초구 양재동',37.4923615, 127.0292881,3,'carrot7');

insert into address(address_no, address_name, address_lat,address_lng, address_range,user_id)
values(address_address_no_seq.nextval, '서울특별시 서초구 우면동',37.4923615, 127.0292881,3,'carrot8');
insert into address(address_no, address_name, address_lat,address_lng, address_range,user_id)
values(address_address_no_seq.nextval, '서울특별시 서초구 잠원동',37.4923615, 127.0292881,5,'carrot8');

/* [invitation] **************************************************/
desc invitation;
select * from invitation;
/*
이름         널?       유형            
---------- -------- ------------- 
INVI_NO    NOT NULL NUMBER(10)    
INVI_EMAIL          VARCHAR2(100) 
USER_ID             VARCHAR2(10) 
*/
insert into invitation(invi_no,invi_email,user_id) values(INVITATION_INVI_NO_SEQ.nextval,'invi1@test.com','carrot1');
insert into invitation(invi_no,invi_email,user_id) values(INVITATION_INVI_NO_SEQ.nextval,'invi2@test.com','carrot1');
insert into invitation(invi_no,invi_email,user_id) values(INVITATION_INVI_NO_SEQ.nextval,'invi3@test.com','carrot1');
insert into invitation(invi_no,invi_email,user_id) values(INVITATION_INVI_NO_SEQ.nextval,'invi4@test.com','carrot2');
insert into invitation(invi_no,invi_email,user_id) values(INVITATION_INVI_NO_SEQ.nextval,'invi5@test.com','carrot2');
insert into invitation(invi_no,invi_email,user_id) values(INVITATION_INVI_NO_SEQ.nextval,'invi6@test.com','carrot2');
insert into invitation(invi_no,invi_email,user_id) values(INVITATION_INVI_NO_SEQ.nextval,'invi7@test.com','carrot3');
insert into invitation(invi_no,invi_email,user_id) values(INVITATION_INVI_NO_SEQ.nextval,'invi8@test.com','carrot3');

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


/* [product] & [product_img]**************************************************/
desc product;
desc product_img;
select * from product;
select * from product_img;

/*
이름             널?       유형            
-------------- -------- ------------- 
P_NO           NOT NULL NUMBER(20)    
P_TITLE                 VARCHAR2(500) 
P_DESC                  VARCHAR2(500) 
P_PRICE                 NUMBER(20)    
P_DATE                  DATE          
P_SELL                  NUMBER(10)    
P_COUNT                 NUMBER(10)    
P_WISH                  NUMBER(10)    
P_ADDRESS_NAME          VARCHAR2(100) 
P_ADDRESS_LAT           NUMBER(20,10) 
P_ADDRESS_LNG           NUMBER(20,10) 
P_CTGR_NO               NUMBER(10)    
USER_ID                 VARCHAR2(30)
*/


insert into product values(PRODUCT_P_NO_SEQ.nextval, '(미개봉)키보드', '선물받았는데 필요없어져서 팝니다. 직거래환영', 20000, sysdate-30, null, 10, 5, '역삼동', 37.4923615, 127.0292881, 1,'carrot1');
insert into product_img values(PRODUCT_IMG_PI_NO_SEQ.nextval, 'keyboard1.jpg', PRODUCT_P_NO_SEQ.currval);
insert into product_img values(PRODUCT_IMG_PI_NO_SEQ.nextval, 'keyboard2.jpg', PRODUCT_P_NO_SEQ.currval);
insert into wishlist(wishlist_no,p_no,user_id) values(wishlist_wishlist_no_seq.nextval,PRODUCT_P_NO_SEQ.currval,'carrot6');

insert into product values(PRODUCT_P_NO_SEQ.nextval, '(미개봉)마우스', '선물받았는데 필요없어져서 팝니다. 직거래환영', 30000, sysdate-30, null, 10, 5,'역삼동',37.4923615, 127.0292881, 1,'carrot2');
insert into product_img values(PRODUCT_IMG_PI_NO_SEQ.nextval, 'mouse1.jpg', PRODUCT_P_NO_SEQ.currval);
insert into product_img values(PRODUCT_IMG_PI_NO_SEQ.nextval, 'mouse2.jpg', PRODUCT_P_NO_SEQ.currval);
insert into wishlist(wishlist_no,p_no,user_id) values(wishlist_wishlist_no_seq.nextval,PRODUCT_P_NO_SEQ.currval,'carrot6');

insert into product values(PRODUCT_P_NO_SEQ.nextval, '최신형 청소기', '선물받았는데 필요없어져서 팝니다. 직거래환영', 30000, sysdate-30, null, 10, 5,'서초동',37.4923615, 127.0292881,2,'carrot3');
insert into product_img values(PRODUCT_IMG_PI_NO_SEQ.nextval, 'vacuum1.jpg', PRODUCT_P_NO_SEQ.currval);
insert into product_img values(PRODUCT_IMG_PI_NO_SEQ.nextval, 'vacuum2.jpg', PRODUCT_P_NO_SEQ.currval);
insert into wishlist(wishlist_no,p_no,user_id) values(wishlist_wishlist_no_seq.nextval,PRODUCT_P_NO_SEQ.currval,'carrot4');

insert into product values(PRODUCT_P_NO_SEQ.nextval, '전자레인지 팝니다', '선물받았는데 필요없어져서 팝니다. 직거래환영', 30000, sysdate-30, null, 10, 5,'서초동',37.4923615, 127.0292881,2,'carrot3');
insert into product_img values(PRODUCT_IMG_PI_NO_SEQ.nextval, 'microwave.jpg', PRODUCT_P_NO_SEQ.currval);
insert into wishlist(wishlist_no,p_no,user_id) values(wishlist_wishlist_no_seq.nextval,PRODUCT_P_NO_SEQ.currval,'carrot1');

insert into product values(PRODUCT_P_NO_SEQ.nextval, '푹신한 의자', '앉으면 일어날 수 없어요', 30000, sysdate-30, null, 10, 5,'서초동',37.4923615, 127.0292881,2,'carrot4');
insert into product_img values(PRODUCT_IMG_PI_NO_SEQ.nextval, 'chair.jpg', PRODUCT_P_NO_SEQ.currval);
insert into wishlist(wishlist_no,p_no,user_id) values(wishlist_wishlist_no_seq.nextval,PRODUCT_P_NO_SEQ.currval,'carrot2');

insert into product values(PRODUCT_P_NO_SEQ.nextval, '어린이용 책상', '아이가 커져서 팝니다.', 30000, sysdate-30, null, 10, 5,'논현동',37.4923615, 127.0292881,2,'carrot4');
insert into product_img values(PRODUCT_IMG_PI_NO_SEQ.nextval, 'desk.jpg', PRODUCT_P_NO_SEQ.currval);
insert into wishlist(wishlist_no,p_no,user_id) values(wishlist_wishlist_no_seq.nextval,PRODUCT_P_NO_SEQ.currval,'carrot5');

insert into product values(PRODUCT_P_NO_SEQ.nextval, '라면냄비', '2번사용했습니다.', 30000, sysdate-30, null, 10, 5,'논현동',37.4923615, 127.0292881,3,'carrot4');
insert into product_img values(PRODUCT_IMG_PI_NO_SEQ.nextval, 'pot.jpg', PRODUCT_P_NO_SEQ.currval);
insert into wishlist(wishlist_no,p_no,user_id) values(wishlist_wishlist_no_seq.nextval,PRODUCT_P_NO_SEQ.currval,'carrot7');

insert into product values(PRODUCT_P_NO_SEQ.nextval, '후라이팬', '계란후라이에 딱입니다.', 30000, sysdate-30, null, 10, 5,'도곡동',37.4923615, 127.0292881,3,'carrot5');
insert into product_img values(PRODUCT_IMG_PI_NO_SEQ.nextval, 'pan.jpg', PRODUCT_P_NO_SEQ.currval);
insert into wishlist(wishlist_no,p_no,user_id) values(wishlist_wishlist_no_seq.nextval,PRODUCT_P_NO_SEQ.currval,'carrot7');

insert into product values(PRODUCT_P_NO_SEQ.nextval, '딸랑이 세트', '깔끔하게 소독했어요', 30000, sysdate-30, null, 10, 5,'도곡동',37.4923615, 127.0292881,4,'carrot5');
insert into product_img values(PRODUCT_IMG_PI_NO_SEQ.nextval, 'toy1.jpg', PRODUCT_P_NO_SEQ.currval);
insert into product_img values(PRODUCT_IMG_PI_NO_SEQ.nextval, 'toy2.jpg', PRODUCT_P_NO_SEQ.currval);
insert into wishlist(wishlist_no,p_no,user_id) values(wishlist_wishlist_no_seq.nextval,PRODUCT_P_NO_SEQ.currval,'carrot8');

insert into product values(PRODUCT_P_NO_SEQ.nextval, '신생아 양말', '미착용했습니다.', 30000, sysdate-30, null, 10, 5,'삼성동',37.4923615, 127.0292881,4,'carrot6');
insert into product_img values(PRODUCT_IMG_PI_NO_SEQ.nextval, 'toddler_socks1.jpg', PRODUCT_P_NO_SEQ.currval);
insert into product_img values(PRODUCT_IMG_PI_NO_SEQ.nextval, 'toddler_socks2.jpg', PRODUCT_P_NO_SEQ.currval);
insert into wishlist(wishlist_no,p_no,user_id) values(wishlist_wishlist_no_seq.nextval,PRODUCT_P_NO_SEQ.currval,'carrot4');

insert into product values(PRODUCT_P_NO_SEQ.nextval, '동화책3권팝니다', '낱권 구매가능합니다.', 30000, sysdate-30, null, 10, 5,'삼성동',37.4923615, 127.0292881,5,'carrot7');
insert into product_img values(PRODUCT_IMG_PI_NO_SEQ.nextval, 'book1.jpg', PRODUCT_P_NO_SEQ.currval);
insert into product_img values(PRODUCT_IMG_PI_NO_SEQ.nextval, 'book2.jpg', PRODUCT_P_NO_SEQ.currval);
insert into wishlist(wishlist_no,p_no,user_id) values(wishlist_wishlist_no_seq.nextval,PRODUCT_P_NO_SEQ.currval,'carrot3');

insert into product values(PRODUCT_P_NO_SEQ.nextval, '가나다 한글책', '깨끗합니다.', 30000, sysdate-30, null, 10, 5,'수서동',37.4923615, 127.0292881,5,'carrot8');
insert into product_img values(PRODUCT_IMG_PI_NO_SEQ.nextval, 'book3.jpg', PRODUCT_P_NO_SEQ.currval);
insert into product_img values(PRODUCT_IMG_PI_NO_SEQ.nextval, 'book4.jpg', PRODUCT_P_NO_SEQ.currval);
insert into wishlist(wishlist_no,p_no,user_id) values(wishlist_wishlist_no_seq.nextval,PRODUCT_P_NO_SEQ.currval,'carrot1');








--#### <<join>> product - product_img - address(user_id,판매자)
/*
select * from product p
join product_img pi
on p.p_no=pi.p_no
join address a
on p.address_no=a.address_no;
*/



/* [wishlist] **************************************************/
desc wishlist;
/*
이름          널?       유형           
----------- -------- ------------ 
WISHLIST_NO NOT NULL NUMBER(10)   
P_NO                 NUMBER(20)   
USER_ID              VARCHAR2(10) 
*/
select * from wishlist;

/*
insert into wishlist(wishlist_no,p_no,user_id) values(wishlist_wishlist_no_seq.nextval,1,'carrot6');
insert into wishlist(wishlist_no,p_no,user_id) values(wishlist_wishlist_no_seq.nextval,1,'carrot7');
insert into wishlist(wishlist_no,p_no,user_id) values(wishlist_wishlist_no_seq.nextval,1,'carrot8');
insert into wishlist(wishlist_no,p_no,user_id) values(wishlist_wishlist_no_seq.nextval,2,'carrot4');
insert into wishlist(wishlist_no,p_no,user_id) values(wishlist_wishlist_no_seq.nextval,2,'carrot5');
insert into wishlist(wishlist_no,p_no,user_id) values(wishlist_wishlist_no_seq.nextval,2,'carrot6');
insert into wishlist(wishlist_no,p_no,user_id) values(wishlist_wishlist_no_seq.nextval,3,'carrot6');
insert into wishlist(wishlist_no,p_no,user_id) values(wishlist_wishlist_no_seq.nextval,3,'carrot1');
insert into wishlist(wishlist_no,p_no,user_id) values(wishlist_wishlist_no_seq.nextval,3,'carrot2');
insert into wishlist(wishlist_no,p_no,user_id) values(wishlist_wishlist_no_seq.nextval,4,'carrot1');
insert into wishlist(wishlist_no,p_no,user_id) values(wishlist_wishlist_no_seq.nextval,4,'carrot2');
insert into wishlist(wishlist_no,p_no,user_id) values(wishlist_wishlist_no_seq.nextval,4,'carrot3');
insert into wishlist(wishlist_no,p_no,user_id) values(wishlist_wishlist_no_seq.nextval,4,'carrot4');
insert into wishlist(wishlist_no,p_no,user_id) values(wishlist_wishlist_no_seq.nextval,4,'carrot5');
insert into wishlist(wishlist_no,p_no,user_id) values(wishlist_wishlist_no_seq.nextval,5,'carrot1');
insert into wishlist(wishlist_no,p_no,user_id) values(wishlist_wishlist_no_seq.nextval,5,'carrot2');
insert into wishlist(wishlist_no,p_no,user_id) values(wishlist_wishlist_no_seq.nextval,5,'carrot3');
insert into wishlist(wishlist_no,p_no,user_id) values(wishlist_wishlist_no_seq.nextval,5,'carrot4');
insert into wishlist(wishlist_no,p_no,user_id) values(wishlist_wishlist_no_seq.nextval,5,'carrot5');
insert into wishlist(wishlist_no,p_no,user_id) values(wishlist_wishlist_no_seq.nextval,6,'carrot1');
insert into wishlist(wishlist_no,p_no,user_id) values(wishlist_wishlist_no_seq.nextval,6,'carrot3');
insert into wishlist(wishlist_no,p_no,user_id) values(wishlist_wishlist_no_seq.nextval,6,'carrot5');
*/

--#### <<join>> product - address(user_id,판매자) - wishlist(user_id,구매자)
/*
select * from product p
join address a
on p.address_no=a.address_no
join wishlist w
on p.p_no=p.p_no;
*/

/*
delete from review;
delete from transfer;
delete from orders;
delete from payment;
update userinfo set user_point =0;
desc transfer;
*/
--***[payment]->[user_point :update]****************************************************************
--[payment] carrot1
insert into payment values('payment439085dsfr46546ue', 'kakaopay', '10000', sysdate-30, 'carrot1');
--[user_point :update]
update userinfo set user_point =user_point+(select payment_amount from payment where payment_no = 'payment439085dsfr46546ue')
    where user_id= (select user_id from payment where payment_no = 'payment439085dsfr46546ue');

insert into payment values('payment439085dsfr46557sd', 'naverpay', '3000', sysdate-29, 'carrot1');
update userinfo set user_point =user_point+(select payment_amount from payment where payment_no = 'payment439085dsfr46557sd')
    where user_id= (select user_id from payment where payment_no = 'payment439085dsfr46557sd');

insert into payment values('payment852185dsfr46557sd', 'tosspay', '44000', sysdate-28, 'carrot1');
update userinfo set user_point =user_point+(select payment_amount from payment where payment_no = 'payment852185dsfr46557sd')
    where user_id= (select user_id from payment where payment_no = 'payment852185dsfr46557sd');

insert into payment values('payment753185dsfr46557sd', 'tosspay', '20000', sysdate-20, 'carrot1');
update userinfo set user_point =user_point+(select payment_amount from payment where payment_no = 'payment753185dsfr46557sd')
    where user_id= (select user_id from payment where payment_no = 'payment753185dsfr46557sd');

insert into payment values('payment598185dsfr46557sd', 'kakaopay', '56000', sysdate-15, 'carrot1');
update userinfo set user_point =user_point+(select payment_amount from payment where payment_no = 'payment598185dsfr46557sd')
    where user_id= (select user_id from payment where payment_no = 'payment598185dsfr46557sd');

--[payment] carrot2
insert into payment values('payment439roew3343223456', 'card', '20000', sysdate-8, 'carrot2');
--[user_point :update]
update userinfo set user_point =user_point+(select payment_amount from payment where payment_no = 'payment439roew3343223456')
    where user_id= (select user_id from payment where payment_no = 'payment439roew3343223456');

insert into payment values('payment124roew3343223456', 'naverpay', '30000', sysdate-7, 'carrot2');
update userinfo set user_point =user_point+(select payment_amount from payment where payment_no = 'payment124roew3343223456')
    where user_id= (select user_id from payment where payment_no = 'payment124roew3343223456');

insert into payment values('payment986roew3343223456', 'tosspay', '7000', sysdate-5, 'carrot2');
update userinfo set user_point =user_point+(select payment_amount from payment where payment_no = 'payment986roew3343223456')
    where user_id= (select user_id from payment where payment_no = 'payment986roew3343223456');

insert into payment values('payment421roew3343223456', 'card', '5000', sysdate-3, 'carrot2');
update userinfo set user_point =user_point+(select payment_amount from payment where payment_no = 'payment421roew3343223456')
    where user_id= (select user_id from payment where payment_no = 'payment421roew3343223456');

insert into payment values('payment689roew3343223456', 'kakaopay', '10000', sysdate-1, 'carrot2');
update userinfo set user_point =user_point+(select payment_amount from payment where payment_no = 'payment689roew3343223456')
    where user_id= (select user_id from payment where payment_no = 'payment689roew3343223456');

--[payment] carrot3
insert into payment values('payment3958rkjgfdfekwf45', 'tosspay', '30000', sysdate-17, 'carrot3');
--[user_point :update]
update userinfo set user_point =user_point+(select payment_amount from payment where payment_no = 'payment3958rkjgfdfekwf45')
    where user_id= (select user_id from payment where payment_no = 'payment3958rkjgfdfekwf45');
    
insert into payment values('payment3457rkjgfdfekwf45', 'kakaopay', '25000', sysdate-6, 'carrot3');
update userinfo set user_point =user_point+(select payment_amount from payment where payment_no = 'payment3457rkjgfdfekwf45')
    where user_id= (select user_id from payment where payment_no = 'payment3457rkjgfdfekwf45');

insert into payment values('payment4578rkjgfdfekwf45', 'kakaopay', '50000', sysdate-5, 'carrot3');
update userinfo set user_point =user_point+(select payment_amount from payment where payment_no = 'payment4578rkjgfdfekwf45')
    where user_id= (select user_id from payment where payment_no = 'payment4578rkjgfdfekwf45');
    
--[payment] carrot4
insert into payment values('payment20394ertiujwkdsfg', 'naverpay', '80000', sysdate-8, 'carrot4');
--[user_point :update]
update userinfo set user_point =user_point+(select payment_amount from payment where payment_no = 'payment20394ertiujwkdsfg')
    where user_id= (select user_id from payment where payment_no = 'payment20394ertiujwkdsfg');

--[payment] carrot5
insert into payment values('payment20123ertiujwkdsfg', 'naverpay', '100000', sysdate-15, 'carrot5');
--[user_point :update]
update userinfo set user_point =user_point+(select payment_amount from payment where payment_no = 'payment20123ertiujwkdsfg')
    where user_id= (select user_id from payment where payment_no = 'payment20123ertiujwkdsfg');

--***[orders]->[transfer]->[user_point :update]->[review]************************************************
desc transfer;

--[orders] p_no=1, 판매자 carrot1, 구매자 carrot5
insert into orders values(ORDERS_ORDERS_NO_SEQ.nextval, 1,'carrot5',sysdate-10);
--[transfer] 구매자
insert into transfer values(TRANSFER_TRANSFER_NO_SEQ.nextval,
            0,
            (-1*(select p_price from product where p_no = 1)),
            sysdate-9,
            (select user_id from orders where p_no =1),
            (select orders_no from orders where p_no = 1),
            1,
            (select user_point from userinfo where user_id=(select user_id from orders where p_no = 1))
                    -(select p_price from product where p_no = 1)
            );
--[transfer] 판매자
insert into transfer values(TRANSFER_TRANSFER_NO_SEQ.nextval,
            (select p_price from product where p_no = 1),
            0,
            sysdate-9,
            (select user_id from product where p_no =1),
            (select orders_no from orders where p_no = 1),
            1,
            (select user_point from userinfo where user_id=(select user_id from product where p_no = 1))
                    +(select p_price from product where p_no = 1)
            );           
--[user_point :update] 구매자
update userinfo set user_point =user_point-(select p_price from product where p_no = 1)
    where user_id= (select user_id from orders where p_no =1);
--[user_point :update] 판매자
update userinfo set user_point =user_point+(select p_price from product where p_no = 1)
    where user_id= (select user_id from product where p_no = 1);
--[review] 구매자
insert into review(review_no,review_desc,review_image,review_point,orders_no,user_id)
    values(REVIEW_REVIEW_NO_SEQ.nextval,'친절하고 약속시간을 잘지켜요','',3, ORDERS_ORDERS_NO_SEQ.currval,'carrot5');
--[review] 판매자    
insert into review(review_no,review_desc,review_image,review_point,orders_no,user_id)
    values(REVIEW_REVIEW_NO_SEQ.nextval,'쿨거래했어요','',4.5, ORDERS_ORDERS_NO_SEQ.currval,'carrot1');
    
    
--************
--[orders] p_no=2, 판매자 carrot3, 구매자 carrot1
insert into orders values(ORDERS_ORDERS_NO_SEQ.nextval, 2,'carrot1',sysdate-10);
--[transfer] 구매자
insert into transfer values(TRANSFER_TRANSFER_NO_SEQ.nextval,
            0,
            (-1*(select p_price from product where p_no = 2)),
            sysdate-9,
            (select user_id from orders where p_no =2),
            (select orders_no from orders where p_no = 2),
            2,
            (select user_point from userinfo where user_id=(select user_id from orders where p_no = 2))
                    -(select p_price from product where p_no = 2)
            );
--[transfer] 판매자
insert into transfer values(TRANSFER_TRANSFER_NO_SEQ.nextval,
            (select p_price from product where p_no = 2),
            0,
            sysdate-9,
            (select user_id from product where p_no =2),
            (select orders_no from orders where p_no = 2),
            2,
            (select user_point from userinfo where user_id=(select user_id from product where p_no = 2))
                    +(select p_price from product where p_no = 2)
            );           
--[user_point :update] 구매자
update userinfo set user_point =user_point-(select p_price from product where p_no = 2)
    where user_id= (select user_id from orders where p_no =2);
--[user_point :update] 판매자
update userinfo set user_point =user_point+(select p_price from product where p_no = 2)
    where user_id= (select user_id from product where p_no = 2);
--[review] 구매자
insert into review(review_no,review_desc,review_image,review_point,orders_no,user_id)
    values(REVIEW_REVIEW_NO_SEQ.nextval,'친절하고 약속시간을 잘지켜요','',3.5, ORDERS_ORDERS_NO_SEQ.currval,'carrot1');
--[review] 판매자    
insert into review(review_no,review_desc,review_image,review_point,orders_no,user_id)
    values(REVIEW_REVIEW_NO_SEQ.nextval,'쿨거래했어요','',4.5, ORDERS_ORDERS_NO_SEQ.currval,'carrot3');
    
--************
--[orders] p_no=3, 판매자 carrot3, 구매자 carrot4
insert into orders values(ORDERS_ORDERS_NO_SEQ.nextval, 3,'carrot4',sysdate-10);
--[transfer] 구매자
insert into transfer values(TRANSFER_TRANSFER_NO_SEQ.nextval,
            0,
            (-1*(select p_price from product where p_no = 3)),
            sysdate-9,
            (select user_id from orders where p_no =3),
            (select orders_no from orders where p_no = 3),
            3,
            (select user_point from userinfo where user_id=(select user_id from orders where p_no = 3))
                    -(select p_price from product where p_no = 3)
            );
--[transfer] 판매자
insert into transfer values(TRANSFER_TRANSFER_NO_SEQ.nextval,
            (select p_price from product where p_no = 3),
            0,
            sysdate-9,
            (select user_id from product where p_no =3),
            (select orders_no from orders where p_no = 3),
            3,
            (select user_point from userinfo where user_id=(select user_id from product where p_no = 3))
                    +(select p_price from product where p_no = 3)
            );           
--[user_point :update] 구매자
update userinfo set user_point =user_point-(select p_price from product where p_no = 3)
    where user_id= (select user_id from orders where p_no =3);
--[user_point :update] 판매자
update userinfo set user_point =user_point+(select p_price from product where p_no = 3)
    where user_id= (select user_id from product where p_no = 3);
--[review] 구매자
insert into review(review_no,review_desc,review_image,review_point,orders_no,user_id)
    values(REVIEW_REVIEW_NO_SEQ.nextval,'마음에 들어요','',5, ORDERS_ORDERS_NO_SEQ.currval,'carrot4');
--[review] 판매자    
insert into review(review_no,review_desc,review_image,review_point,orders_no,user_id)
    values(REVIEW_REVIEW_NO_SEQ.nextval,'친절해요','',3, ORDERS_ORDERS_NO_SEQ.currval,'carrot3');
    
--************
--[orders] p_no=4, 판매자 carrot4, 구매자 carrot2
insert into orders values(ORDERS_ORDERS_NO_SEQ.nextval, 4,'carrot2',sysdate-10);
--[transfer] 구매자
insert into transfer values(TRANSFER_TRANSFER_NO_SEQ.nextval,
            0,
            (-1*(select p_price from product where p_no = 4)),
            sysdate-9,
            (select user_id from orders where p_no =4),
            (select orders_no from orders where p_no = 4),
            4,
            (select user_point from userinfo where user_id=(select user_id from orders where p_no = 4))
                    -(select p_price from product where p_no = 4)
            );
--[transfer] 판매자
insert into transfer values(TRANSFER_TRANSFER_NO_SEQ.nextval,
            (select p_price from product where p_no = 4),
            0,
            sysdate-9,
            (select user_id from product where p_no =4),
            (select orders_no from orders where p_no = 4),
            4,
            (select user_point from userinfo where user_id=(select user_id from product where p_no = 4))
                    +(select p_price from product where p_no = 4)
            );           
--[user_point :update] 구매자
update userinfo set user_point =user_point-(select p_price from product where p_no = 4)
    where user_id= (select user_id from orders where p_no =4);
--[user_point :update] 판매자
update userinfo set user_point =user_point+(select p_price from product where p_no = 4)
    where user_id= (select user_id from product where p_no = 4);
--[review] 구매자
insert into review(review_no,review_desc,review_image,review_point,orders_no,user_id)
    values(REVIEW_REVIEW_NO_SEQ.nextval,'굳굳','',3.5, ORDERS_ORDERS_NO_SEQ.currval,'carrot2');
--[review] 판매자    
insert into review(review_no,review_desc,review_image,review_point,orders_no,user_id)
    values(REVIEW_REVIEW_NO_SEQ.nextval,'좋아요','',4, ORDERS_ORDERS_NO_SEQ.currval,'carrot4');
    
--************
--[orders] p_no=7, 판매자 carrot5, 구매자 carrot2
insert into orders values(ORDERS_ORDERS_NO_SEQ.nextval, 7,'carrot2',sysdate-5);
--[transfer] 구매자
insert into transfer values(TRANSFER_TRANSFER_NO_SEQ.nextval,
            0,
            (-1*(select p_price from product where p_no = 7)),
            sysdate-5,
            (select user_id from orders where p_no =7),
            (select orders_no from orders where p_no = 7),
            7,
            (select user_point from userinfo where user_id=(select user_id from orders where p_no = 7))
                    -(select p_price from product where p_no = 7)
            );
--[transfer] 판매자
insert into transfer values(TRANSFER_TRANSFER_NO_SEQ.nextval,
            (select p_price from product where p_no = 7),
            0,
            sysdate-5,
            (select user_id from product where p_no =7),
            (select orders_no from orders where p_no = 7),
            7,
            (select user_point from userinfo where user_id=(select user_id from product where p_no = 7))
                    +(select p_price from product where p_no = 7)
            );           
--[user_point :update] 구매자
update userinfo set user_point =user_point-(select p_price from product where p_no = 7)
    where user_id= (select user_id from orders where p_no =7);
--[user_point :update] 판매자
update userinfo set user_point =user_point+(select p_price from product where p_no = 7)
    where user_id= (select user_id from product where p_no = 7);
--[review] 구매자
insert into review(review_no,review_desc,review_image,review_point,orders_no,user_id)
    values(REVIEW_REVIEW_NO_SEQ.nextval,'깔끔해요','',4.5, ORDERS_ORDERS_NO_SEQ.currval,'carrot2');
--[review] 판매자    
insert into review(review_no,review_desc,review_image,review_point,orders_no,user_id)
    values(REVIEW_REVIEW_NO_SEQ.nextval,'만족합니다','',5, ORDERS_ORDERS_NO_SEQ.currval,'carrot5');




--**************[payment]
--desc payment;
/*
이름             널?       유형           
-------------- -------- ------------ 
PAYMENT_NO     NOT NULL VARCHAR2(30) 
PAYMENT_METHOD          VARCHAR2(30) 
PAYMENT_AMOUNT          NUMBER(10)   
PAYMENT_DATE            DATE         
USER_ID                 VARCHAR2(30)
*/
/*
insert into payment values('payment439085dsfr46546ue', 'kakaopay', '10000', sysdate-10, 'carrot1');
insert into payment values('payment439085dsfr46sfewf', 'naverpay', '3000', sysdate-10, 'carrot1');
insert into payment values('payment852185dsfr465213d', 'tosspay', '44000', sysdate-9, 'carrot1');
insert into payment values('payment753185dsfr4653453', 'tosspay', '20000', sysdate-8, 'carrot1');
insert into payment values('payment598185dsfr465534d', 'kakaopay', '56000', sysdate-7, 'carrot1');

insert into payment values('payment439roew3343223456', 'card', '20000', sysdate-8, 'carrot2');
insert into payment values('payment124roew3343226755', 'naverpay', '30000', sysdate-7, 'carrot2');
insert into payment values('payment986roew3343222312', 'tosspay', '5000', sysdate-5, 'carrot2');
insert into payment values('payment421roew3343225467', 'card', '5000', sysdate-3, 'carrot2');
insert into payment values('payment689roew3343226576', 'kakaopay', '10000', sysdate-1, 'carrot2');

insert into payment values('payment3958rkjgfdferfvs5', 'tosspay', '3000', sysdate-7, 'carrot3');
insert into payment values('payment3457rkergdfekwf45', 'kakaopay', '25000', sysdate-6, 'carrot3');
insert into payment values('payment4578rkjgdfvskwf45', 'kakaopay', '25000', sysdate-5, 'carrot3');

insert into payment values('payment20394ertiujwkdsfg', 'naverpay', '394580', sysdate-8, 'carrot4');

--***************[orders] & [transfer]
desc orders;
desc transfer;

/*
select p_no, p_title, p_date, user_id, p_price from product;
1	(미개봉)키보드	carrot1	20000
2	최신형 청소기	carrot3	30000
3	전자레인지 팝니다	carrot3	30000
4	푹신한 의자	carrot4	30000
5	어린이용 책상	carrot4	30000
6	라면냄비	carrot4	30000
7	후라이팬	carrot5	30000
8	딸랑이 세트	carrot5	30000
9	신생아 양말	carrot6	30000
10	동화책3권팝니다	carrot7	30000
11	가나다 한글책	carrot8	30000
*/

/*
--[orders] p_no=1, 판매자 carrot1
insert into orders values(ORDERS_ORDERS_NO_SEQ.nextval, 1,'carrot5', sysdate);
--[transfer] 구매자 carrot5
insert into transfer values(TRANSFER_TRANSFER_NO_SEQ.nextval,10000, 0, sysdate-10, 'carrot5',ORDERS_ORDERS_NO_SEQ.currval,1, 0);
--[transfer] 판매자 carrot1
insert into transfer values(TRANSFER_TRANSFER_NO_SEQ.nextval,0, 10000, sysdate-10, 'carrot1',ORDERS_ORDERS_NO_SEQ.currval,1, 0);

--[orders] p_no=10, 판매자 carrot6
insert into orders values(ORDERS_ORDERS_NO_SEQ.nextval, 10,'carrot3', sysdate);
--[transfer] 구매자 carrot3
insert into transfer values(TRANSFER_TRANSFER_NO_SEQ.nextval,10000, 0, sysdate-8, 'carrot3',ORDERS_ORDERS_NO_SEQ.currval, 10, 0);
--[transfer] 판매자 carrot6
insert into transfer values(TRANSFER_TRANSFER_NO_SEQ.nextval,0, 10000, sysdate-8, 'carrot6',ORDERS_ORDERS_NO_SEQ.currval, 10, 0);

--[orders] p_no=2, 판매자 carrot2
insert into orders values(ORDERS_ORDERS_NO_SEQ.nextval, 2,'carrot8', sysdate);
--[transfer] 구매자 carrot8
insert into transfer values(TRANSFER_TRANSFER_NO_SEQ.nextval,5000, 0, sysdate-9, 'carrot8',ORDERS_ORDERS_NO_SEQ.currval, 2, 0);
--[transfer] 판매자 carrot2
insert into transfer values(TRANSFER_TRANSFER_NO_SEQ.nextval,0, 5000, sysdate-9, 'carrot2',ORDERS_ORDERS_NO_SEQ.currval, 2, 0);


--***************join [orders + transfer]
select * from orders o
join transfer t
on o.ORDERS_NO=t.ORDERS_NO;
*/

-- [notice]
--일반글
desc notice;
insert into notice values(NOTICE_NOTICE_NO_SEQ.nextval, '흙당근마켓 이벤트', '오픈기념 10% 자동 할인 이벤트', sysdate,0,0);
insert into notice values(NOTICE_NOTICE_NO_SEQ.nextval, '포인트 10%추가 지급 이벤트', '오픈기념 10% 자동 할인 이벤트', sysdate,0,0);
insert into notice values(NOTICE_NOTICE_NO_SEQ.nextval, '흙당근마켓 홈페이지 서버점검 안내', '오픈기념 10% 자동 할인 이벤트', sysdate,0,0);
insert into notice values(NOTICE_NOTICE_NO_SEQ.nextval, '흙당근마켓 긴급 서버점검 안내', '긴급 서버 점검', sysdate,0,0);


--고정글
insert into notice values(NOTICE_NOTICE_NO_SEQ.nextval, '고정 공지 제목', '고정 내용 입니다',sysdate,0,1);
insert into notice values(NOTICE_NOTICE_NO_SEQ.nextval, '중요한 공지 내용!', '중요한 내용 입니다',sysdate,0,1);
insert into notice values(NOTICE_NOTICE_NO_SEQ.nextval, '꼭 보세요!!', '완전 중요', sysdate,0,1);



select * from notice;

desc notice;


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


/********[review]********/
--desc review;
/*
이름           널?       유형            
------------ -------- ------------- 
REVIEW_NO    NOT NULL NUMBER(10)    
REVIEW_DESC           VARCHAR2(100) 
REVIEW_IMAGE          VARCHAR2(100) 
REVIEW_POINT          NUMBER(10,1)  
ORDERS_NO             NUMBER(10)    
USER_ID               VARCHAR2(30)    
*/
/*
select p.p_no, o.user_id oo,p.user_id pp from orders o
join product p
on o.p_no=p.p_no
;

--구매자
insert into review(review_no,review_desc,review_image,review_point,orders_no,user_id)
    values(REVIEW_REVIEW_NO_SEQ.nextval,'친절하고 약속시간을 잘지켜요','',0.1, 1,'carrot5');
--판매자    
insert into review(review_no,review_desc,review_image,review_point,orders_no,user_id)
    values(REVIEW_REVIEW_NO_SEQ.nextval,'쿨거래했어요','',0.1, 1,'carrot1');

--구매자
insert into review(review_no,review_desc,review_image,review_point,orders_no,user_id)
    values(REVIEW_REVIEW_NO_SEQ.nextval,'최고에요!','',0.2, 2,'carrot2');
--판매자    
insert into review(review_no,review_desc,review_image,review_point,orders_no,user_id)
    values(REVIEW_REVIEW_NO_SEQ.nextval,'별로에요','',-0.1, 2,'carrot8');   
    
--구매자
insert into orders values(ORDERS_ORDERS_NO_SEQ.nextval, 3,'carrot5');
insert into review(review_no,review_desc,review_image,review_point,orders_no,user_id)
    values(REVIEW_REVIEW_NO_SEQ.nextval,'그냥그래요','',0, ORDERS_ORDERS_NO_SEQ.currval,'carrot5');
--판매자    
insert into review(review_no,review_desc,review_image,review_point,orders_no,user_id)
    values(REVIEW_REVIEW_NO_SEQ.nextval,'친절해요','',0.1, 3,'carrot7');  
    
--구매자
insert into review(review_no,review_desc,review_image,review_point,orders_no,user_id)
    values(REVIEW_REVIEW_NO_SEQ.nextval,'그냥그래요','',0, 10,'carrot3');
--판매자    
insert into review(review_no,review_desc,review_image,review_point,orders_no,user_id)
    values(REVIEW_REVIEW_NO_SEQ.nextval,'친절해요','',0.1, 10,'carrot6'); 

--구매자
insert into orders values(ORDERS_ORDERS_NO_SEQ.nextval, 4,'carrot5');
insert into review(review_no,review_desc,review_image,review_point,orders_no,user_id)
    values(REVIEW_REVIEW_NO_SEQ.nextval,'그냥그래요','',0, ORDERS_ORDERS_NO_SEQ.currval,'carrot5');
--판매자    
insert into review(review_no,review_desc,review_image,review_point,orders_no,user_id)
    values(REVIEW_REVIEW_NO_SEQ.nextval,'친절해요','',0.1, ORDERS_ORDERS_NO_SEQ.currval,'carrot3'); 
      
select * from review;    
*/

/* --- 채팅방 생성 --- */
insert into chat_room(c_room_no,from_id,to_id,p_no) values(CHAT_ROOM_C_ROOM_NO_SEQ.nextval,'carrot6','carrot1',1);
insert into chat_room(c_room_no,from_id,to_id,p_no) values(CHAT_ROOM_C_ROOM_NO_SEQ.nextval,'carrot2','carrot4',2);
insert into chat_room(c_room_no,from_id,to_id,p_no) values(CHAT_ROOM_C_ROOM_NO_SEQ.nextval,'carrot2','carrot3',3);

insert into chat_contents (c_content_no,c_content,send_time,c_read,user_id,c_room_no)
values (chat_contents_c_content_no_SEQ.nextval,'안녕하세요',sysdate,0,'carrot6',1);

insert into chat_contents (c_content_no,c_content,send_time,c_read,user_id,c_room_no)
values (chat_contents_c_content_no_SEQ.nextval,'혹시 구매 가능할까요?',sysdate,0,'carrot6',1);

insert into chat_contents (c_content_no,c_content,send_time,c_read,user_id,c_room_no)
values (chat_contents_c_content_no_SEQ.nextval,'네 안녕하세요~',sysdate,0,'carrot1',1);

insert into chat_contents (c_content_no,c_content,send_time,c_read,user_id,c_room_no)
values (chat_contents_c_content_no_SEQ.nextval,'구매 가능합니다!',sysdate,0,'carrot1',1);

--carrot1 회원이 여기까지 봤을 때 c_read 1로 업데이트
update chat_contents set c_read=1 where c_room_no=1 and send_time<sysdate;

insert into chat_contents (c_content_no,c_content,send_time,c_read,user_id,c_room_no)
values (chat_contents_c_content_no_SEQ.nextval,'그럼 구매하겠습니다!',sysdate,0,'carrot6',1);

insert into chat_contents (c_content_no,c_content,send_time,c_read,user_id,c_room_no)
values (chat_contents_c_content_no_SEQ.nextval,'언제 시간 괜찮으세요?',sysdate,0,'carrot6',1);



insert into chat_contents (c_content_no,c_content,send_time,c_read,user_id,c_room_no)
values (chat_contents_c_content_no_SEQ.nextval,'안녕하세용~',sysdate,0,'carrot2',2);

insert into chat_contents (c_content_no,c_content,send_time,c_read,user_id,c_room_no)
values (chat_contents_c_content_no_SEQ.nextval,'혹시 팔렸나요??',sysdate,0,'carrot2',2);


insert into chat_contents (c_content_no,c_content,send_time,c_read,user_id,c_room_no)
values (chat_contents_c_content_no_SEQ.nextval,'혹시 구매 가능할까요?',sysdate,0,'carrot2',3);

insert into chat_contents (c_content_no,c_content,send_time,c_read,user_id,c_room_no)
values (chat_contents_c_content_no_SEQ.nextval,'바로 입금 가능합니다!',sysdate,0,'carrot2',3);

insert into chat_contents (c_content_no,c_content,send_time,c_read,user_id,c_room_no)
values (chat_contents_c_content_no_SEQ.nextval,'예 안녕하세요',sysdate,0,'carrot3',3);

insert into chat_contents (c_content_no,c_content,send_time,c_read,user_id,c_room_no)
values (chat_contents_c_content_no_SEQ.nextval,'먼저 문의주신 분이 있어서...',sysdate,0,'carrot3',3);

insert into chat_contents (c_content_no,c_content,send_time,c_read,user_id,c_room_no)
values (chat_contents_c_content_no_SEQ.nextval,'아 ㅜㅜ',sysdate,0,'carrot2',3);

insert into chat_contents (c_content_no,c_content,send_time,c_read,user_id,c_room_no)
values (chat_contents_c_content_no_SEQ.nextval,'그럼 만약 거래 파기되면 꼭 연락주세요!',sysdate,0,'carrot2',3);

insert into chat_contents (c_content_no,c_content,send_time,c_read,user_id,c_room_no)
values (chat_contents_c_content_no_SEQ.nextval,'네 알겠습니다~',sysdate,0,'carrot3',3);

--carrot3 회원이 여기까지 봤을 때 c_read 1로 업데이트
update chat_contents set c_read=1 where c_room_no=3 and send_time<sysdate;