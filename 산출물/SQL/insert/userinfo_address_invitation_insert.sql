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
    'carrot',
    '1111',
    '금당근',
    'browncarrotmarket@gmail.com',
    '010-1234-5678',
    0,
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
    'rabbit',
    '1111',
    '곰토끼',
    'browncarrotmarket@gmail.com',
    '010-5678-1234',
    0,
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
    'carrot1',
    '1111',
    '김당근',
    'carrot1@brown.com',
    '010-1111-1111',
    0,
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
    'broccoli.png'
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
    'admin',
    '9999',
    '흙당근관리자',
    'admin@brown.com',
    '010-1234-5678',
    0,
    0,
    'tomato.png'
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
    'adminP',
    '1111',
    '약속관리자',
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
values(address_address_no_seq.nextval, '서울특별시 강남구 개포동', 37.4923615, 127.0292881, 3,'carrot');

insert into address(address_no, address_name, address_lat,address_lng, address_range,user_id)
values(address_address_no_seq.nextval, '서울특별시 강남구 논현동', 37.50466804467962, 127.02458155935068,5,'rabbit');


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