
/* --- 본인 채팅방 목록 --- */

--- c_room_no, not_read, send_time,c_content ---
select g.c_room_no,g.not_read,t.send_time,t.c_content from (select c_room_no,count(*) as not_read from chat_contents
where c_room_no in (select c_room_no from chat_room where from_id='carrot1' or to_id='carrot1')
and c_read=0 
and user_id!='carrot1'
group by c_room_no) g inner join (select a.c_room_no,send_time,c_content
from (select c_room_no from chat_room d where d.to_id = 'carrot1' or d.from_id = 'carrot1')a 
inner join (select a.send_time,a.c_room_no,a.c_content from chat_contents a 
left join chat_contents b 
on a.c_room_no = b.c_room_no and a.send_time<b.send_time 
where b.c_room_no is null) b 
on a.c_room_no = b.c_room_no
order by send_time desc) t on g.c_room_no = t.c_room_no;



/* --- 채팅방 삭제 --- */
delete from chat_room where c_room_no = 2;




