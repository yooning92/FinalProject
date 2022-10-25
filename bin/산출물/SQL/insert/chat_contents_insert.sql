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