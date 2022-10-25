/********[review]********/
desc review;
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
desc orders;
insert into orders values(ORDERS_ORDERS_NO_SEQ.nextval, 3,'carrot5',sysdate);
insert into review(review_no,review_desc,review_image,review_point,orders_no,user_id)
    values(REVIEW_REVIEW_NO_SEQ.nextval,'그냥그래요','',0, ORDERS_ORDERS_NO_SEQ.currval,'carrot5');
--판매자    
insert into review(review_no,review_desc,review_image,review_point,orders_no,user_id)
    values(REVIEW_REVIEW_NO_SEQ.nextval,'친절해요','',0.1, ORDERS_ORDERS_NO_SEQ.currval,'carrot7');  
    
--구매자
insert into orders values(ORDERS_ORDERS_NO_SEQ.nextval, 10,'carrot5',sysdate-1);
insert into review(review_no,review_desc,review_image,review_point,orders_no,user_id)
    values(REVIEW_REVIEW_NO_SEQ.nextval,'그냥그래요','',0, ORDERS_ORDERS_NO_SEQ.currval,'carrot3');
--판매자    
insert into review(review_no,review_desc,review_image,review_point,orders_no,user_id)
    values(REVIEW_REVIEW_NO_SEQ.nextval,'친절해요','',0.1, ORDERS_ORDERS_NO_SEQ.currval,'carrot6');      

desc orders;
--구매자
insert into orders values(ORDERS_ORDERS_NO_SEQ.nextval, 4,'carrot5',sysdate-1);
insert into review(review_no,review_desc,review_image,review_point,orders_no,user_id)
    values(REVIEW_REVIEW_NO_SEQ.nextval,'그냥그래요','',0, ORDERS_ORDERS_NO_SEQ.currval,'carrot5');
--판매자    
insert into review(review_no,review_desc,review_image,review_point,orders_no,user_id)
    values(REVIEW_REVIEW_NO_SEQ.nextval,'친절해요','',0.1, ORDERS_ORDERS_NO_SEQ.currval,'carrot3');     

--구매자
insert into orders values(ORDERS_ORDERS_NO_SEQ.nextval, 12,'carrot3',sysdate-2);
insert into review(review_no,review_desc,review_image,review_point,orders_no,user_id)
    values(REVIEW_REVIEW_NO_SEQ.nextval,'굳굳','',0, ORDERS_ORDERS_NO_SEQ.currval,'carrot3');
--판매자    
insert into review(review_no,review_desc,review_image,review_point,orders_no,user_id)
    values(REVIEW_REVIEW_NO_SEQ.nextval,'굳굳','',0.1, ORDERS_ORDERS_NO_SEQ.currval,'carrot8');  
    
select * from review;


-- ***** 받은 거래 후기
-- '구매자'가 '판매자'에게 남긴 전체 후기
/*
select p.p_no,p.p_title, p.user_id, o.orders_no,o.user_id, r.review_no,r.user_id from product p
join orders o
on p.p_no=o.p_no
join review r
on o.orders_no=r.orders_no
where o.user_id=r.user_id;
*/

--********[거래후기상세]페이지

-- 전체후기 : 판매자 or 구매자가 나에게 남긴 후기
select r.review_no, r.review_desc, r.review_image, r.review_point, r.user_id reviewr_id, r.user_name reviewr_name, r.user_profile reviewr_profile,
        oo.orders_no, oo.user_id buyer_id, oo.user_name buyer_name, oo.user_profile buyer_profile, oo.p_no,
        pp.p_address_name, pp.user_id seller_id, pp.user_name seller_name, pp.user_profile seller_profile
        from (select rs.review_no, rs.review_desc, rs.review_image, rs.review_point,rs.orders_no,
                    us.user_id,us.user_name,us.user_profile
                    from review rs
                    join userinfo us
                    on rs.user_id=us.user_id) r
			join (select os.orders_no, os.orders_date, os.p_no,os.user_id,us.user_name,us.user_profile
                    from orders os
                    join userinfo us
                    on os.user_id=us.user_id) oo
			on r.orders_no=oo.orders_no
			join (select ps.p_no,p_address_name, ps.user_id, us.user_name,us.user_profile
                    from product ps
                    join userinfo us
                    on ps.user_id=us.user_id) pp
			on oo.p_no=pp.p_no
			where r.user_id in
				(select o.user_id buyer from product p
				join orders o
				on p.p_no=o.p_no
				where p.user_id = 'carrot5')
			or r.user_id in
				(select p.user_id seller from product p
				join orders o
				on p.p_no=o.p_no
				where o.user_id = 'carrot5')
                ;

-- '판매자(carrot3)'인 경우 : 구매자가 남긴 후기 
select * from review r
where r.user_id in
(select o.user_id buyer from product p
join orders o
on p.p_no=o.p_no
where p.user_id = 'carrot3');

-- '구매자(carrot1)'인 경우 : 판매자가 남긴 후기
select * from review r
where r.user_id in
(select p.user_id seller from product p
join orders o
on p.p_no=o.p_no
where o.user_id = 'carrot1');




--insert into orders values(ORDERS_ORDERS_NO_SEQ.nextval, 3,'carrot5');
/*
insert into review(review_no,review_desc,review_image,review_point,orders_no,user_id)
    values(REVIEW_REVIEW_NO_SEQ.nextval,'(구매)친절하고 약속시간을 잘지켜요','',0.1, 6,'carrot1');
    insert into review(review_no,review_desc,review_image,review_point,orders_no,user_id)
    values(REVIEW_REVIEW_NO_SEQ.nextval,'(판매)친절하고 약속시간을 잘지켜요','',0.1, 6,'carrot4');
*/