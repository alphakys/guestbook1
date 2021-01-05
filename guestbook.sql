--guestbook 테이블 생성
create table guestbook(
            no  number,
            name  varchar2(80),
            password  varchar2(20),
            content   varchar2(2000),
            reg_date   date,
            primary     key(no)
            );
--시퀀스 생성
create sequence seq_no
increment by 1
start with 1;

--insert
insert into guestbook
values(seq_no.nextval, '강용수', '강용수', '안녕 개꿀잼 코딩', sysdate);

insert into guestbook
values(seq_no.nextval, '강성현', '강성현', '생일 축하해', sysdate);

--delete
delete from guestbook
where no = '3';

--update
update guestbook
set    name = '강용수',
       password = '강',
       content = '개꿀잼 코딩',
       reg_date = sysdate
where  no = '1';

--search



--리스트 뿌리기
select  no,
        name,
        password,
        content,
        to_char(reg_date, 'yyyy-mm-dd hh24:mi:ss')
from guestbook;




-- <기타> 
--데이터만 삭제
delete guestbook;

--시퀀스 삭제
drop sequence seq_no;




