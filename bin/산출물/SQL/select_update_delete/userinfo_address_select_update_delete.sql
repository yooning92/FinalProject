/************[userinfo],[address],[invitation]***************/
/*********insert*********/
--insert_Userinfo
INSERT INTO userinfo (user_id, user_pw, user_name, user_email, user_phone, user_freshness, user_point, user_profile )
    VALUES ('carrot1', '1111', '김당근', 'carrot1@brown.com', '010-1111-1111', 36.5, 0, '');
--insert_Address
insert into address(address_no, address_name, address_lat,address_lng, address_range,user_id)
values(address_address_no_seq.nextval, '서울특별시 강남구 논현동', 37.4923615, 127.0292881,5,'carrot1');
--insert_Invitation
insert into invitation(invi_no,invi_email,user_id) values(INVITATION_INVI_NO_SEQ.nextval,'invi1@test.com','carrot1');

/***************[invitation]***************/
--select_Invitatioin
select * from invitation where user_id='carrot1';
--select_count_Invitatioin
select COUNT(*) FROM invitation where user_id='carrot1';

/*********selectAll*********/
--selectAll_userinfo : 관리자가 회원전체List를 확인
select * from userinfo;

--selectAll_address : 관리자가 회원전체의 address List를 확인
select * from address;

--selectAll_address_userinfo: 관리자가 회원전체의 address와 회원 List를 확인
select * from address a
join userinfo u
on a.user_id=u.user_id;

/*********selectOne*********/
--selectByUserId : 1명의 회원이 회원정보를 확인
select * from userinfo where user_id='carrot3';

--selectByAddressNo : session에 회원이 선택한 본인의 address_no를 넘겨줘서, 그 해당 페이지를 보여줘야 함.
select * from address where address_no=3;

--selectByAddressNo : addressNo로 회원정보까지 확인
select * from userinfo u
join address a
on u.user_id=a.user_id
where a.address_no=3;

/*********selectList*********/
--selectByUserId_AddressAll : 1명의 회원의 주소list를 확인
select * from userinfo u
join address a
on u.user_id=a.user_id
where a.user_id='carrot4';

/*********update*********/
--updateByUserId : 회원 정보 수정
update userinfo set user_pw=222, user_name='이당당', user_email='karrot2@black.com', user_phone='010-2121-2121', user_freshness=37.6, user_point=1100, user_profile='image.jpg'
where user_id='carrot1';

--updateAddressByAddressNo : AddressNo로 회원 주소 수정
update address set address_name='서울특별시 강남구 논현동', address_lat=37.504517146836335, address_lng=127.02448255049796
where address_no=7;

--updateFreshnessByUserinfo : 신선도(매너온도) 수정
update userinfo set user_freshness=37.6
where user_id='carrot1';

--updatePointByUserinfo : 포인트 수정
update userinfo set user_point+=1000
where user_id='carrot1';

/*********delete*********/
DELETE FROM userinfo where user_id ='';

--address가 1개이면 delete 불가-> update만 가능
select count(*) from address where user_id='carrot1';
DELETE FROM address where address_no=;
update address set address_name='서울특별시 강남구 논현동', address_lat=37.504517146836335, address_lng=127.02448255049796
where address_no=;