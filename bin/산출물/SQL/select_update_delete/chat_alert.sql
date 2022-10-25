--약속시간 
select p.c_room_no,c_app_spot,c_app_date,from_id,to_id from promise p
join chat_room c
on p.c_room_no =c.c_room_no
where c.from_id='carrot1' or c.to_id='carrot1';

--안읽은메세지수
select count(*) from (select * from chat_contents
where c_room_no in(select c_room_no from chat_room c where (from_id = 'carrot1' and from_id_in=1) or (to_id = 'carrot1' and to_id_in=1))) tb
where tb.c_read=0 and tb.user_id!='carrot1' and tb.user_id!='adminP' and tb.user_id!='admin';




select * from chat_contents
where c_room_no in(select c_room_no from chat_room c where c.from_id='carrot1' or c.to_id='carrot1');

select c_room_no from chat_room c where c.from_id='carrot1' or c.to_id='carrot1';