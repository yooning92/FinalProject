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
    values(REVIEW_REVIEW_NO_SEQ.nextval,'쿨거래했어요','',0.1, 1,'carrot6');

--구매자
insert into review(review_no,review_desc,review_image,review_point,orders_no,user_id)
    values(REVIEW_REVIEW_NO_SEQ.nextval,'최고에요!','',0.2, 2,'carrot5');
--판매자    
insert into review(review_no,review_desc,review_image,review_point,orders_no,user_id)
    values(REVIEW_REVIEW_NO_SEQ.nextval,'별로에요','',-0.1, 2,'carrot7');   
    
--구매자
insert into review(review_no,review_desc,review_image,review_point,orders_no,user_id)
    values(REVIEW_REVIEW_NO_SEQ.nextval,'그냥그래요','',0, 3,'carrot5');
--판매자    
insert into review(review_no,review_desc,review_image,review_point,orders_no,user_id)
    values(REVIEW_REVIEW_NO_SEQ.nextval,'친절해요','',0.1, 3,'carrot7');     
    
    
select * from review;    