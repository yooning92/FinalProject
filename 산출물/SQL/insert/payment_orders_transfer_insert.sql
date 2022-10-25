--**************[payment]
desc payment;
/*
이름             널?       유형           
-------------- -------- ------------ 
PAYMENT_NO     NOT NULL VARCHAR2(30) 
PAYMENT_METHOD          VARCHAR2(30) 
PAYMENT_AMOUNT          NUMBER(10)   
PAYMENT_DATE            DATE         
USER_ID                 VARCHAR2(30)
*/
insert into payment values('payment439085dsfr46546ue', 'kakaopay', '10000', sysdate-10, 'carrot1');
insert into payment values('payment439085dsfr46557sd', 'naverpay', '3000', sysdate-10, 'carrot1');
insert into payment values('payment852185dsfr46557sd', 'tosspay', '44000', sysdate-9, 'carrot1');
insert into payment values('payment753185dsfr46557sd', 'tosspay', '20000', sysdate-8, 'carrot1');
insert into payment values('payment598185dsfr46557sd', 'kakaopay', '56000', sysdate-7, 'carrot1');

insert into payment values('payment439roew3343223456', 'card', '20000', sysdate-8, 'carrot2');
insert into payment values('payment124roew3343223456', 'naverpay', '30000', sysdate-7, 'carrot2');
insert into payment values('payment986roew3343223456', 'tosspay', '5000', sysdate-5, 'carrot2');
insert into payment values('payment421roew3343223456', 'card', '5000', sysdate-3, 'carrot2');
insert into payment values('payment689roew3343223456', 'kakaopay', '10000', sysdate-1, 'carrot2');

insert into payment values('payment3958rkjgfdfekwf45', 'tosspay', '3000', sysdate-7, 'carrot3');
insert into payment values('payment3457rkjgfdfekwf45', 'kakaopay', '25000', sysdate-6, 'carrot3');
insert into payment values('payment4578rkjgfdfekwf45', 'kakaopay', '25000', sysdate-5, 'carrot3');

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


--[orders] p_no=9, 판매자 carrot6
insert into orders values(ORDERS_ORDERS_NO_SEQ.nextval, 9,'carrot5',sysdate);
--[transfer] 구매자 carrot5
insert into transfer values(TRANSFER_TRANSFER_NO_SEQ.nextval,10000, 0, sysdate-10, 'carrot6',ORDERS_ORDERS_NO_SEQ.currval,9);
--[transfer] 판매자 carrot6
insert into transfer values(TRANSFER_TRANSFER_NO_SEQ.nextval,0, 10000, sysdate-10, 'carrot5',ORDERS_ORDERS_NO_SEQ.currval,9);

--[orders] p_no=10, 판매자 carrot7
insert into orders values(ORDERS_ORDERS_NO_SEQ.nextval, 10,'carrot5', sysdate);
--[transfer] 구매자 carrot5
insert into transfer values(TRANSFER_TRANSFER_NO_SEQ.nextval,10000, 0, sysdate-8, 'carrot5',ORDERS_ORDERS_NO_SEQ.currval,10);
--[transfer] 판매자 carrot7
insert into transfer values(TRANSFER_TRANSFER_NO_SEQ.nextval,0, 10000, sysdate-8, 'carrot7',ORDERS_ORDERS_NO_SEQ.currval,10);

--[orders] p_no=11, 판매자 carrot8
insert into orders values(ORDERS_ORDERS_NO_SEQ.nextval, 10,'carrot5', sysdate);
--[transfer] 구매자 carrot4
insert into transfer values(TRANSFER_TRANSFER_NO_SEQ.nextval,5000, 0, sysdate-9, 'carrot4',ORDERS_ORDERS_NO_SEQ.currval,11);
--[transfer] 판매자 carrot8
insert into transfer values(TRANSFER_TRANSFER_NO_SEQ.nextval,0, 5000, sysdate-9, 'carrot8',ORDERS_ORDERS_NO_SEQ.currval,11);


--***************join [orders + transfer]
select * from orders o
join transfer t
on o.ORDERS_NO=t.ORDERS_NO;
