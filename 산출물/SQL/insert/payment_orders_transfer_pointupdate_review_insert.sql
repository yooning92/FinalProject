/*
delete from review;
delete from transfer;
delete from orders;
delete from payment;
update userinfo set user_point =0;
desc transfer;
*/
--***[payment]->[user_point :update]****************************************************************
/*
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
*/
--***[orders]->[transfer]->[user_point :update]->[review]************************************************
desc transfer;

--[orders] p_no=70, 판매자 carrot8, 구매자 carrot1
insert into orders values(ORDERS_ORDERS_NO_SEQ.nextval, 70,'carrot1',sysdate-10);
--[transfer] 구매자
insert into transfer values(TRANSFER_TRANSFER_NO_SEQ.nextval,
            0,
            (-1*(select p_price from product where p_no = 70)),
            sysdate-9,
            (select user_id from orders where p_no =70),
            (select orders_no from orders where p_no = 70),
            70,
            (select user_point from userinfo where user_id=(select user_id from orders where p_no = 70))
                    -(select p_price from product where p_no = 70)
            );
--[transfer] 판매자
insert into transfer values(TRANSFER_TRANSFER_NO_SEQ.nextval,
            (select p_price from product where p_no = 70),
            0,
            sysdate-9,
            (select user_id from product where p_no =70),
            (select orders_no from orders where p_no = 70),
            70,
            (select user_point from userinfo where user_id=(select user_id from product where p_no = 70))
                    +(select p_price from product where p_no = 70)
            );           
--[user_point :update] 구매자
update userinfo set user_point =user_point-(select p_price from product where p_no = 70)
    where user_id= (select user_id from orders where p_no =70);
--[user_point :update] 판매자
update userinfo set user_point =user_point+(select p_price from product where p_no = 70)
    where user_id= (select user_id from product where p_no = 70);
--[review] 구매자
insert into review(review_no,review_desc,your_id,review_point,orders_no,user_id)
    values(REVIEW_REVIEW_NO_SEQ.nextval,'친절하고 약속시간을 잘지켜요','carrot1',3.5, ORDERS_ORDERS_NO_SEQ.currval,'carrot5');
--[review] 판매자    
insert into review(review_no,review_desc,your_id,review_point,orders_no,user_id)
    values(REVIEW_REVIEW_NO_SEQ.nextval,'쿨거래했어요','carrot8',4.5, ORDERS_ORDERS_NO_SEQ.currval,'carrot1');
    







--************
--[orders] p_no=60, 판매자 carrot6, 구매자 carrot2
insert into orders values(ORDERS_ORDERS_NO_SEQ.nextval, 60,'carrot2',sysdate-10);
--[transfer] 구매자
insert into transfer values(TRANSFER_TRANSFER_NO_SEQ.nextval,
            0,
            (-1*(select p_price from product where p_no = 60)),
            sysdate-9,
            (select user_id from orders where p_no =60),
            (select orders_no from orders where p_no = 60),
            60,
            (select user_point from userinfo where user_id=(select user_id from orders where p_no = 60))
                    -(select p_price from product where p_no = 60)
            );
--[transfer] 판매자
insert into transfer values(TRANSFER_TRANSFER_NO_SEQ.nextval,
            (select p_price from product where p_no = 60),
            0,
            sysdate-9,
            (select user_id from product where p_no =60),
            (select orders_no from orders where p_no = 60),
            60,
            (select user_point from userinfo where user_id=(select user_id from product where p_no = 60))
                    +(select p_price from product where p_no = 60)
            );           
--[user_point :update] 구매자
update userinfo set user_point =user_point-(select p_price from product where p_no = 60)
    where user_id= (select user_id from orders where p_no =60);
--[user_point :update] 판매자
update userinfo set user_point =user_point+(select p_price from product where p_no = 60)
    where user_id= (select user_id from product where p_no = 60);
--[review] 구매자
insert into review(review_no,review_desc,your_id,review_point,orders_no,user_id)
    values(REVIEW_REVIEW_NO_SEQ.nextval,'친절하고 약속시간을 잘지켜요','carrot6',4, ORDERS_ORDERS_NO_SEQ.currval,'carrot2');
--[review] 판매자    
insert into review(review_no,review_desc,your_id,review_point,orders_no,user_id)
    values(REVIEW_REVIEW_NO_SEQ.nextval,'쿨거래했어요','carrot2',5, ORDERS_ORDERS_NO_SEQ.currval,'carrot6');
   
   
   
   
   
    
--************
--[orders] p_no=50, 판매자 carrot4, 구매자 carrot3
insert into orders values(ORDERS_ORDERS_NO_SEQ.nextval, 50,'carrot3',sysdate-10);
--[transfer] 구매자
insert into transfer values(TRANSFER_TRANSFER_NO_SEQ.nextval,
            0,
            (-1*(select p_price from product where p_no = 50)),
            sysdate-9,
            (select user_id from orders where p_no =50),
            (select orders_no from orders where p_no = 50),
            50,
            (select user_point from userinfo where user_id=(select user_id from orders where p_no = 50))
                    -(select p_price from product where p_no = 50)
            );
--[transfer] 판매자
insert into transfer values(TRANSFER_TRANSFER_NO_SEQ.nextval,
            (select p_price from product where p_no = 50),
            0,
            sysdate-9,
            (select user_id from product where p_no =50),
            (select orders_no from orders where p_no = 50),
            50,
            (select user_point from userinfo where user_id=(select user_id from product where p_no = 50))
                    +(select p_price from product where p_no = 50)
            );           
--[user_point :update] 구매자
update userinfo set user_point =user_point-(select p_price from product where p_no = 50)
    where user_id= (select user_id from orders where p_no =50);
--[user_point :update] 판매자
update userinfo set user_point =user_point+(select p_price from product where p_no = 50)
    where user_id= (select user_id from product where p_no = 50);
--[review] 구매자
insert into review(review_no,review_desc,your_id,review_point,orders_no,user_id)
    values(REVIEW_REVIEW_NO_SEQ.nextval,'마음에 들어요','carrot4',3.5, ORDERS_ORDERS_NO_SEQ.currval,'carrot3');
--[review] 판매자    
insert into review(review_no,review_desc,your_id,review_point,orders_no,user_id)
    values(REVIEW_REVIEW_NO_SEQ.nextval,'친절해요','carrot3',4.5, ORDERS_ORDERS_NO_SEQ.currval,'carrot4');
    
--************
--[orders] p_no=40, 판매자 carrot3, 구매자 carrot2
insert into orders values(ORDERS_ORDERS_NO_SEQ.nextval, 40,'carrot2',sysdate-10);
--[transfer] 구매자
insert into transfer values(TRANSFER_TRANSFER_NO_SEQ.nextval,
            0,
            (-1*(select p_price from product where p_no = 40)),
            sysdate-9,
            (select user_id from orders where p_no =40),
            (select orders_no from orders where p_no = 40),
            40,
            (select user_point from userinfo where user_id=(select user_id from orders where p_no = 40))
                    -(select p_price from product where p_no = 40)
            );
--[transfer] 판매자
insert into transfer values(TRANSFER_TRANSFER_NO_SEQ.nextval,
            (select p_price from product where p_no = 40),
            0,
            sysdate-9,
            (select user_id from product where p_no =40),
            (select orders_no from orders where p_no = 40),
            40,
            (select user_point from userinfo where user_id=(select user_id from product where p_no = 40))
                    +(select p_price from product where p_no = 40)
            );           
--[user_point :update] 구매자
update userinfo set user_point =user_point-(select p_price from product where p_no = 40)
    where user_id= (select user_id from orders where p_no =40);
--[user_point :update] 판매자
update userinfo set user_point =user_point+(select p_price from product where p_no = 40)
    where user_id= (select user_id from product where p_no = 40);
--[review] 구매자
insert into review(review_no,review_desc,your_id,review_point,orders_no,user_id)
    values(REVIEW_REVIEW_NO_SEQ.nextval,'굳굳','carrot3',3, ORDERS_ORDERS_NO_SEQ.currval,'carrot2');
--[review] 판매자    
insert into review(review_no,review_desc,your_id,review_point,orders_no,user_id)
    values(REVIEW_REVIEW_NO_SEQ.nextval,'좋아요','carrot2',5, ORDERS_ORDERS_NO_SEQ.currval,'carrot3');
  
  
  
  
    
--************
--[orders] p_no=30, 판매자 carrot5, 구매자 carrot2
insert into orders values(ORDERS_ORDERS_NO_SEQ.nextval, 30,'carrot2',sysdate-5);
--[transfer] 구매자
insert into transfer values(TRANSFER_TRANSFER_NO_SEQ.nextval,
            0,
            (-1*(select p_price from product where p_no = 30)),
            sysdate-5,
            (select user_id from orders where p_no =30),
            (select orders_no from orders where p_no = 30),
            30,
            (select user_point from userinfo where user_id=(select user_id from orders where p_no = 30))
                    -(select p_price from product where p_no = 30)
            );
--[transfer] 판매자
insert into transfer values(TRANSFER_TRANSFER_NO_SEQ.nextval,
            (select p_price from product where p_no = 30),
            0,
            sysdate-5,
            (select user_id from product where p_no =30),
            (select orders_no from orders where p_no = 30),
            30,
            (select user_point from userinfo where user_id=(select user_id from product where p_no = 30))
                    +(select p_price from product where p_no = 30)
            );           
--[user_point :update] 구매자
update userinfo set user_point =user_point-(select p_price from product where p_no = 30)
    where user_id= (select user_id from orders where p_no =30);
--[user_point :update] 판매자
update userinfo set user_point =user_point+(select p_price from product where p_no = 30)
    where user_id= (select user_id from product where p_no = 30);
--[review] 구매자
insert into review(review_no,review_desc,your_id,review_point,orders_no,user_id)
    values(REVIEW_REVIEW_NO_SEQ.nextval,'깔끔해요','carrot5',4, ORDERS_ORDERS_NO_SEQ.currval,'carrot2');
--[review] 판매자    
insert into review(review_no,review_desc,your_id,review_point,orders_no,user_id)
    values(REVIEW_REVIEW_NO_SEQ.nextval,'만족합니다','carrot2',4.5, ORDERS_ORDERS_NO_SEQ.currval,'carrot5');
