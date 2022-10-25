--carrot1 회원이 여기까지 봤을 때 c_read 1로 업데이트
update chat_contents set c_read=1 where c_room_no=1 and send_time<sysdate;

-- SELECT
/*채팅방 1개의 전체 대화 내용 출력 */
select * from chat_contents where c_room_no=1 order by c_content_no;

/*채팅 메세지 1개 찾기*/
select * from chat_contents where c_content_no=85;



/*carrot1 회원이 로그인했을 때 해당 채팅방의 읽지 않은 메세지가 있는지 확인 */
select count(*) from chat_contents where c_room_no=1 and c_read=0 and user_id!='carrot1';


/*carrot1 회원이 로그인했을 때 전체 안 읽은 메세지 수 */
select c_room_no,count(*) from chat_contents
where c_room_no in (select c_room_no from chat_room where from_id='carrot1' or to_id='carrot1')
and c_read=0 
and user_id!='carrot1'
group by c_room_no;

/*carrot1 의 방 - 안 읽은 메세지 */
select c_room_no,count(*) from chat_contents
where c_room_no in (select c_room_no from chat_room where from_id='carrot1' or to_id='carrot1')
and c_read=0 
and user_id!='carrot1'
group by c_room_no;

--DELETE
/*채팅 말풍선 하나 삭제 */
delete chat_contents where c_content_no=13;
update chat_contents set c_content='삭제된 메세지입니다.' where c_content_no=13;