DROP TABLE promise CASCADE CONSTRAINTS;
CREATE TABLE promise(
      c_room_no                           NUMBER(10)          NULL ,
      c_app_lat                          NUMBER(20,10)       NULL ,
      c_app_lng                            NUMBER(20,10)       NULL ,
      c_app_spot varchar2(80) null,
      c_app_date                         DATE               NULL
        

);
ALTER TABLE promise ADD CONSTRAINT IDX_promise_PK  PRIMARY KEY  (c_room_no);
ALTER TABLE promise ADD CONSTRAINT IDX_promise_FK0 FOREIGN KEY (c_room_no) REFERENCES chat_room (c_room_no) on delete cascade;

desc promise;
/*
이름         널?       유형            
---------- -------- ------------- 
C_ROOM_NO  NOT NULL NUMBER(10)    
C_APP_LAT           NUMBER(20,10) 
C_APP_LNG           NUMBER(20,10) 
C_APP_DATE          DATE      
*/

insert into promise (c_room_no,c_app_lat,c_app_lng,c_app_date) values (5,35.234,54.654,TO_DATE('2022-06-21 20:34','YYYY-MM-DD HH24:MI'));

select * from promise where c_room_no=5;

select count(*) from promise where c_room_no=5;

update promise set c_app_lat=54.6565,c_app_lng=234.5453,c_app_date=To_DATE('2022-06-22 20:00','YYYY-MM-DD HH24:MI') where c_room_no=5;

delete promise where c_room_no=5;