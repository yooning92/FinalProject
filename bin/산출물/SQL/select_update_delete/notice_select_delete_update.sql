--notice sql

-- 공지사항 전체 리스트
select * from notice;


-- 공지사항 1개 글 찾기(게시글 번호로)
select * from notice where notice_no=1;


-- 삭제(게시글 번호로)
delete notice where notice_no=8;

-- 수정(게시글 번호로)
update notice set notice_title='공지사항 제목 수정', notice_content='공지사항 내용 수정' where notice_no=7;

-- 조회수 증가
update notice set notice_count = notice_count+1 where notice_no = 1;


-- 게시글 정렬.. 상단 고정글, 하단은 일반글 
select * from notice order by notice_fix desc, notice_no desc;







