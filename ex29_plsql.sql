--ex29_plsql.sql


/*

    - PL/SQL
    - Oracles's Procedural Language extension to SQL
    - 기존의 ANSI-SQL + 절차 지향 언어 기능 추가
    - ANSI-SQL + 확장팩(변수, 제어 흐름(제어문), 객체(메소드) 정의)

    프로시저, Procedure
    - 메서드, 함수 등..
    - 순서가 있는 명령어들의 집합
    - 모든 PL/SQL 구문은 프로시저내에서만 작성/동작이 가능하다.
    - 프로시저가 아닌 영역 > ANSI-SQL 영역
    
    
    1. 익명 프로시저
        - 1회용 코드 작성용
        
    
    2. 실명 프로시저
        - 데이터베이스 객체
        - 저장용
        - 재호출
    
    
    PL/SQL 프로시저 구조
    1. 4개의 블럭(키워드)으로 구성
        - DECLARE
        - REGIN
        - EXCEPTION
        - END
    
    2. DECLARE
        - 선언부
        - 프로시저내에서 사용할 변수, 객체 등을 선언하는 영역
        - 생략 가능
    3. BEGIN - END (둘이 한 쌍이다)  --자바에서 () 바디괄호같은 거다!
        - 실행문, 구현부
        - 구현된 코드를 가지는 영역(메서드의 body 영역)
        - 생략 불가능
        - 구현된 코드 > ANSI-SQL +PL/SQL(연산, 제어 등)
    4. EXCEPTION
        - 예외처리부
        - catch 역할, 3번 영역 try 역할
        - 생략 가능 
    
    
    자료형 + 변수 
    
    PL/SQL 자료형
    - ANSI-SQL과 동일
    
    
    변수 선언하기
    - 변수명 자료형 [not null] [default 값];
    
    PL/SQL 연산자
    - ANSI-SQL과 동일
    
    대입 연산자
    - ANSI-SQL 대입 연산자
        ex) update table setl column = '값';
        
    - PL/SQL 대입 연산자
        ex) 변수 := '값';
        
    
    
*/

set SERVEROUTPUT on;  --이걸 실행해야함 현재 세션에서만 유효 (접속 해제> 초기화)

set SERVEROUTPUT off;

set SERVEROUTPUT on;

-- 익명 프로시저
declare
    num number;
    name VARCHAR2(30);
    today date;
begin

    num := 10;
    dbms_output.put_line(num); --=syso
    
    name := '홍길동';
    dbms_output.put_line(name);
    
    today := sysdate;
    dbms_output.put_line(today);
    dbms_output.put_line();
    end;
    
    
--위아래 / 적으면 블럭 안 잡고 해도 실행됨   
/    
declare
    num1 number;
    num2 number;
    num3 number := 30;
    num4 number default 40;        --기본값
    num5 number not null := 50;   --not null은 declare 블럭에서 초기화를해야함
begin

    dbms_output.put_line(num1); --생성 후 초기화 안했으니 null상태
    
    num2 := 20;
    dbms_output.put_line(num2);

    dbms_output.put_line(num3);
    
    dbms_output.put_line(num4);
    num4 := 400;
    
    dbms_output.put_line(num4);
    
    dbms_output.put_line(num5);
end;
/   
--위아래 / 적으면 블럭 안 잡고 해도 실행됨


/*

    변수 > 어떤 용도로 사용?
    - select 결과를 담는 용도(************)
    - select into 절 (PL/SQL)

*/


declare 
    vbuseo varchar2(15);
begin

    --vbuseo:= (select buseo from tblInsa where name = '홍길동');
    
    select buseo into vbuseo from tblInsa where name = '홍길동';
    dbms_output.put_line(vbuseo);
    
    select buseo from tblInsa where name = '홍길동';  -- 이렇게 하면 안 됨 PL/SQL은 ANSI-SQL을 자동으로 인식하지 못해서 오류가 남
    dbms_output.put_line(vbuseo);                    -- 이렇게 하면 안 됨 PL/SQL은 ANSI-SQL을 자동으로 인식하지 못해서 오류가 남
    end;

/
    begin
        --PL/SQL 프로시저 안에서는 순수한 select문은 올 수 없다.
        --PL/SQL 프로시저 안에서는 select into문만 사용한다.
        select buseo from tblInsa where name = '홍길동';
    end;
/


--성과급 받는 직원명 
create table tblName2(
    name varchar2(15)
);

--1. 개발부 + 부장 > select > name?
--2. tblName > name > insert

insert into tblName2 (name)
    values ((select name from tblinsa where buseo = '개발부' and jikwi = '부장'));
    
declare
    vname varchar2(15);
begin
    --1. select into 로 변수에 데이터 저장
    select name into vname from tblinsa where buseo = '개발부' and jikwi = '부장';
    
    --2. 테이블에 insert
    insert into tblName2 (name) values (vname);
end;
/

select * from tblName2;


declare
    vname varchar2(15);
    vbuseo varchar2(15);
    vjikwi varchar2(15);
    vbasicpay number;
begin
    --select name, buseo, jikwi, basicpay from tblinsa where num = 1001;
    
    --into 사용시
    --1. 컬럼의 개수와 변수의 개수 일치
    --2. 컬럼의 순서와 변수의 순서 일치
    --3. 컬럼과 변수의 자료형 일치
    select name, buseo, jikwi, basicpay into vname, vbuseo, vjikwi, vbasicpay
    from tblinsa where num=1001;
    
    dbms_output.put_line(vname);
    dbms_output.put_line(vbuseo);
    dbms_output.put_line(vjikwi);
    dbms_output.put_line(vbasicpay);
end;


desc tblInsa

/*
    타임 참조
    
    %type
    - 사용하는 테이블의 특정 컬럼값의 스키마를 얻어내서 변수에 적용
    - 복사되는 정보
        a. 자료형
        b. 길이
    - 컬럼 1개 참조
    
    %rowtype
    - 행 전체 참조(여러 개의 컬럼을 한 번에 참조)
    - %type의 집합형
    - 레코드 전체(여러개 컬럼)을 하나의 변수에 저장 가능
    
*/


declare
    --vbuseo varchar(15);
    vbuseo tblinsa.buseo%type;
begin
    select buseo into vbuseo from tblinsa where name = '홍길동';
    dbms_output.put_line(vbuseo);
end;

declare
    vname tblinsa.name%type;
    vbuseo tblinsa.buseo%type;
    vjikwi tblinsa.jikwi%type;
    vbasicpay tblinsa.basicpay%type;
begin
    --select name, buseo, jikwi, basicpay from tblinsa where num = 1001;
    
    --into 사용시
    --1. 컬럼의 개수와 변수의 개수 일치
    --2. 컬럼의 순서와 변수의 순서 일치
    --3. 컬럼과 변수의 자료형 일치
    select name, buseo, jikwi, basicpay into vname, vbuseo, vjikwi, vbasicpay
    from tblinsa where num=1001;
    
    dbms_output.put_line(vname);
    dbms_output.put_line(vbuseo);
    dbms_output.put_line(vjikwi);
    dbms_output.put_line(vbasicpay);
end;

-- 직원 중 일부에게 보너스 지급 (급여 * 1.5) > 내역 저장
create table tblBonus (
    seq number primary key,
    num number(5) not null references tblinsa(num), --직원번호(FK)
    bonus number not null 
);

declare 
    vnum tblinsa.num%type;
    vbasicpay tblinsa.basicpay%type;
begin 
    
    select num, basicpay into vnum, vbasicpay from tblinsa where city = '서울' and jikwi = '부장' and buseo = '영업부';

    insert into tblBonus (seq, num, bonus)
        values ((select nvl(max(seq), 0) + 1 from tblBonus), vnum, vbasicpay * 1.5);
end;

select * from tblbonus;

select * from tblbonus b
    inner join tblinsa i
        on i.num = b.num;
        
select * from tblmen;
select * from tblwomen;

-- 무명씨 > 성전환 수술 > tblmen > tblwomen 옮기기
-- 1. '무명씨' > tblmen > select
-- 2. tblwomen > insert
-- 3. tblmen > delete

commit;
rollback;

declare
--    vname tblMen.name%type;
--    vage tblMen.age%type;
--    vheight tblMen.height%type;
--    vweight tblMen.weight%type;
--    vcouple tblMen.couple%type;

declare
    vrow tblMen%rowtype; --vrow : tblMen의 레코드 1개(모든 컬럼값)를 저장할 수 있는 변수
begin

    --1.
    select 
        * into vrow      
    from tblMen where name = '정형돈';
    
    dbms_output.put_line(vrow.name);
    dbms_output.put_line(vrow.age);
    dbms_output.put_line(vrow.height);
    dbms_output.put_line(vrow.weight);
    dbms_output.put_line(vrow.couple);
    
    --2.
    insert into tblWomen (name, age, height, weight, couple)
        values (vrow.name, vrow.age, vrow.height, vrow.weight, vrow.couple);

    --3.
    delete from tblMen where name = vrow.name;

end;

/*

    제어문
    1. 조건문
    2. 반복문
    3. 분기문

*/
declare
    vnum number := 10;
begin
    if vnum > 0 then
     dbms_output.put_line('양수');
    end if;
end;



declare
    vnum number := 10;
begin
    if vnum > 0 then
     dbms_output.put_line('양수');
     else 
      dbms_output.put_line('음수');
    end if;
    
end;


declare
    vnum number := 10;
begin
    if vnum > 0 then
    dbms_output.put_line('양수');
     elsif vnum < 0 then
    dbms_output.put_line('음수');
      else
    dbms_output.put_line('0');
    end if;
    
end;

-- tblinsa. 남자 직원/여자 직원 > 다른 업무

declare
    vgender char(1);
begin
    
    select substr (ssn, 8, 1) into vgender from tblinsa where num = 1035; 
    
    if vgender = '1' then
     dbms_output.put_line('남자 직원');
    elsif vgender = '2' then
     dbms_output.put_line('여자 직원');
    end if;
    
end;

-- 직원 1명 선택 > 보너스 지급
-- 차등 지급
-- a. 과장/부장 > basicpay * 1.5
-- b. 대리/사원 > basicpay * 2
declare
    vnum tblInsa.num%type;
    vbasicpay tblInsa.basicpay%type;
    vjikwi tblInsa.jikwi%type;
    vbonus number;
begin

    select num, basicpay, jikwi into vnum, vbasicpay, vjikwi 
        from tblInsa where num = 1040;

    if vjikwi = '과장' or vjikwi = '부장' then
        vbonus := vbasicpay * 1.5;
    elsif vjikwi in ('사원', '대리') then
        vbonus := vbasicpay * 2;
    end if;

    insert into tblBonus (seq, num, bonus)
        values ((select nvl(max(seq), 0) + 1 from tblBonus), vnum, vbonus); 

end;

select * from tblbonus b
    inner join tblinsa i
        on i.num = b.num;
        
        
declare
    vcontinent tblcountry.continent%type;
    vresult varchar2(30);
begin 
    select continent into vcontinent from tblcountry where name = '영국';
    
    if vcontinent = 'AS' then
        vresult := '아시아';
    elsif vcontinent = 'EU' then
        vresult := '유럽';
     elsif vcontinent = 'AF' then
        vresult := '아프리카';
    else
        vresult := '기타';
    end if;
    
     dbms_output.put_line(vresult);
     
     
    case
        when vcontinent = 'AS' then vresult := '아시아';
        when vcontinent = 'EU' then vresult := '유럽';
        when vcontinent = 'AF' then vresult := '아프리카';
        else vresult := '기타';
    end case;
    
    dbms_output.put_line(vresult);

    case vcontinent 
    when 'AS' then vresult := '아시아';
    when 'EU' then vresult := '유럽';
    when 'AF' then vresult := '아시아';
    else vresult := '기타';
    end case;
    
    dbms_output.put_line(vresult);

     
end;

/*
    반복문
    1. loop
        - 단순 반복
    
    2. for loop
        - 횟수 반복(자바 for)
        - loop 기반
    
    3. while loop
        - 조건 반복(자바 while)
        - loop 기반

*/


-- 무한 루프
begin
    loop
         dbms_output.put_line('100');
    end loop;
end;

declare
    vnum number := 1;
begin
    loop
         dbms_output.put_line(vnum);
         vnum := vnum + 1;
         
        exit when vnum > 10;    --조건부 break
        
    end loop;
end;

create table tblloop(
    seq number primary key,
    data varchar2(100) not null
);

create sequence seqLoop;

-- 데이터 X 1000건 추가
-- data > '항목1', '항목2', .. '항목1000'

declare
    vnum number := 1;
begin 
    loop
        
        insert into tblloop values (seqloop.nextVal, '항목' || vnum);
    
        vnum := vnum + 1;
        exit when vnum > 1000;
    end loop;
end;

select * from tblloop;

--2. for loop

begin
    for i in 1..10 loop
         dbms_output.put_line(i);
    end loop;
end;

create table tblGugudan (
    dan number not null,
    num number not null,
    result number not null,
    constraint tblGugudan_dan_num_pk primary key(dan, num)  --복합기(Composite Key)
);

drop table tblGugudan;


create table tblGugudan (
    dan number not null,
    num number not null,
    result number not null
);

alter table tblGugudan
    add constraint tblGugudan_dan_num_pk primary key(dan, num);
    
begin
    for dan in 2..9 loop
    
        for num in 1..9 loop
            insert into tblGugudan (dan, num, result)
            values (dan, num, dan * num);
        end loop;
        
    end loop;
    
end;

select * from tblgugudan;


begin
    for i in reverse 1..10 loop
         dbms_output.put_line(i);
    end loop;
end;



--3. while loop
declare
    vnum number := 1;
begin

    loop
         dbms_output.put_line(vnum);
         vnum := vnum + 1;
         exit when vnum > 10;
    end loop;
end;


declare
    vnum number := 1;
begin

    while vnum <=10 loop
         dbms_output.put_line(vnum);
         vnum := vnum + 1;
         exit when vnum > 10;
    end loop;
end;

/*

    select > 결과셋 > PL/SQL 변수 대입
    
    1. select into 
        - 결과셋의 레코드가 1개일 때만 사용이 가능하다.
        
    2. cursor
        - 결과셋의 레코드가 N개일 때 사용한다.
        - 루프 사용
        
    declare
        변수 선언;
        커서 선언; -- 결과셋 참조 객체
    begin 
        커서 열기;
            loop
                데이터 접근(루프 1회전 > 레코드 1개) <- 커서 사용
            end loop;
        커서 닫기;
    end;

*/

-- 01422. 00000 -  "exact fetch returns more than requested number of rows"
declare
    vname tblinsa.name%type;
begin 
    select name into vname from tblinsa;
    dbms_output.put_line(vname);
end;


create view vview
as
select문;

cursor vcorsor
is 
select문;



declare
    cursor vcursor --> 앞에가 자료형, 뒤에가 식별자
    is 
    select name from tblinsa;  
    vname tblinsa.name%type;
begin
    open vcursor;  --> 커서 열기, select문이 실행됨. -> 결과셋을 커서가 참조함.
--        fetch vcursor into vname;
--        dbms_output.put_line(vname);
--        
--        fetch vcursor into vname;
--        dbms_output.put_line(vname);
--    for i in 1..60 loop
--        fetch vcursor into vname;
--        dbms_output.put_line(vname);
--    end loop;    
    
    loop
        fetch vcursor into vname;
        exit when vcursor%notfound; -- bool
        
        dbms_output.put_line(vname);
    end loop;
    
    close vcursor;
end;


-- '기획부' > 이름, 직위, 급여 > 출력
declare
    cursor vcursor
        is select name, jikwi, basicpay from tblinsa where buseo = '기획부';
    vname tblinsa.name%type;
    vjikwi tblinsa.jikwi%type;
    vbasicpay tblinsa.basicpay%type;
    
begin 
    open vcursor;
    
    loop
        fetch vcursor into vname, vjikwi, vbasicpay;
        exit when vcursor%notfound;
        
        --업무 > 기획부 직원 한사람씩 접근..
        dbms_output.put_line(vname || ',' || vjikwi || ',' || vbasicpay);
        
    end loop;
    
    close vcursor;
end;

-- 문제. tblBonus
-- 모든 직원에게 보너스 지급. 60명 전원 > 과장/부장(1.5), 사원/대리(2) 지급
select * from tblbonus;

declare
 
    cursor vcursor
        is select num, basicpay, jikwi from tblinsa;
    
    vnum tblinsa.num%type;
    vbasicpay tblinsa.basicpay%type;
    vjikwi tblinsa.jikwi%type;
    vBonus number;
    
 
begin 
    open vcursor;
    loop
        fetch vcursor into vnum, vbasicpay, vjikwi;
        exit when vcursor%notfound;
        
        if vjikwi in ('과장', '부장') then
            vbonus := vbasicpay * 1.5;
        elsif vjikwi in ('사원', '대리') then
            vbonus := vbasicpay * 2;
        end if;
        
        insert into tblbonus (seq, num, bonus)
           values ((select nvl(max(seq), 0) + 1 from tblBonus), vnum, vbonus); 
    end loop;
    close vcursor;

 
end;

select * from tblbonus b
    inner join tblinsa i
        on i.num = b.num;
        
-- 커서 탐색
-- 1. 커서 + loop > 정석
-- 2. 커서 + for loop > 간결

declare
    cursor vcursor
    is
    select * from tblinsa;
    vrow tblinsa%rowtype;
begin 
    open vcursor;
    loop
        fetch vcursor into vrow;
        exit when vcursor%notfound;
        
        dbms_output.put_line(vrow.name);
        
    end loop;
    close vcursor;
end;


declare
    cursor vcursor
    is select * from tblinsa;

begin 

    for vrow in vcursor loop -- loop + fetch into + vrow + exit when
        dbms_output.put_line(vrow.name);
    end loop;
end;

-- 예외처리
-- : 실행부에서(begin-end) 발생하는 예외를 처리하는 블럭 > exception 블럭

declare
    vname varchar2(5);
begin 
    dbms_output.put_line('하나');
    select name into vname from tblinsa where num = 1001;
    dbms_output.put_line('둘');
    
    dbms_output.put_line(vname);
exception

    when others then
        dbms_output.put_line('예외 처리');

end;

-- 예외 발생 > DB 저장
create table tblLog(
    seq number primary key,                 -- PK
    code varchar2(7) not null check (code in ('A001', 'B001', 'C001')), -- 에러 상태
    message varchar2(1000) not null,        -- 에러 메세지
    regdate date default sysdate not null   -- 에러 발생 시작
);

create sequence seqLog;

declare
    vcnt number;
    vname tblinsa.name%type;
begin 

select count(*) into vcnt from tblcountry where name = '태국';
dbms_output.put_line(100 / vcnt);

select name into vname from tblinsa where num = 1000;
dbms_output.put_line(vname);

exception
    
    when zero_divide then
        dbms_output.put_line('0으로 나누기');
        insert into tbllog values (seqlog.nextVal, 'B001', '가져온 레코드가 없습니다.', default);
    
    when no_data_found then
        dbms_output.put_line('데이터 없음');
        insert into tbllog values (seqlog.nextVal, 'A001', '직원이 존재하지 않습니다.', default);
    when others then
        dbms_output.put_line('나머지 예외');
        insert into tbllog values (seqlog.nextVal, 'C001', '기타 예외가 발생했습니다.', default);
end;

select * from tbllog;

/*
    
    명령어 실행 > 처리 과정
    

    1. ANSI-SQL
    2. 익명 프로시저
        a. 클라이언트 > 구문 작성 (SELECT)
        b. 실행 (Ctrl + Enter)
        c. 명령어를 오라클 서버에 전달
        d. 서버가 명령어를 수신
        e. 구문 분석(파싱) + 문법 검사
        f. 컴파일
        g. 실행(SELECT)
        h. 결과셋 도출
        i. 결과셋을 클라이언트에게 반환
        j. 결과셋을 화면에 출력
    
    2.1 다시 실행
        a ~ j 다시 반복
        - 한 번 실행했던 명령어를 다시 실행 > 위의 모든 과정을 처음부터 끝까지 다시 실행한다.
        - 첫번째 실행 비용 = 다시 실행 비용

        
    3. 실명 프로시저
    	a. 클라이언트 > 구문 작성(create)
    	b. 실행 (Ctrl + Enter)
    	c. 명령어를 오라클 서버에 전달
    	d. 서버가 명령어를 수신
        e. 구문 분석(파싱) + 문법 검사
        f. 컴파일
        g. 실행
        h. 오라클 서버 > 프로시저
        i. 완료
        
        a. 클라이언트 > 구문 작성(create)
    	b. 실행 (Ctrl + Enter)
    	c. 명령어를 오라클 서버에 전달
    	d. 서버가 명령어를 수신
		e. 구문 분석(파싱) + 문법 검사
		f. 컴파일
		g. 실행 > 프로시저 실행
		
		
	4. 다시 실행
		a. 클라이언트 > 구문 작성(create)
    	b. 실행 (Ctrl + Enter)
    	c. 명령어를 오라클 서버에 전달
    	d. 서버가 명령어를 수신
		e. 구문 분석(파싱) + 문법 검사
		f. 컴파일
		g. 실행 > 프로시저 실행
	
	
	
	
	
	
*/

select * from tblinsa;

/*

    프로시저
    1. 익명 프로시저
        - 1회용
    
    2. 실명 프로시저
        - 재사용
        - 오라클에 저장
        
    실명 프로시저
    - 저장 프로시저(Stored Procedure)
    1. 저장 프로시저, Stored Procedure
        - 매개변수 / 반환값 구성 > 자유
    2. 저장 함수 Stored Function
        - 매개변수 / 반환값 구성 > 필수

    익명 프로시저 선언
    
    [declare
        변수 선언;
        커서 선언;]
    begin
        구현부;
    [exception
        예외처리;]
    end;
    
    
    저장(실명) 프로시저 선언
    
    create [or replace] procedure 프로시저명
    is(as)
        [변수 선언;
        커서 선언;]
    begin
        구현부;
    [exception
        예외처리;]
    end;


*/

declare 
    vnum number;
begin
    vnum := 100;
    dbms_output.put_line(vnum);
end;


-- 저장 프로시저
create or replace procedure procTest
is 
    vnum number;
begin
    vnum := 100;
    dbms_output.put_line(vnum);
end;

-- 저장 프로시저를 호출하는 방법
BEGIN
	procTest; -- 프로시저 호출
END;

--저장 프로시저 = 메서드
-- 매개변수 + 반환값

--1. 매개변수가 있는 프로시저
create or replace procedure procTest(pnum number)  --매개변수
is
    vresult number; --일반변수
begin
    vresult := pnum *2;
    dbms_output.put_line(vresult);
end procTest;


set serveroutput on;

begin
    procTest(100);
end;

begin
    -- pl/sql 영역
    procTest(100);
    procTest(200);
    procTest(300);
end;


--  무슨 영역?
--  ANSI-SQL  영역
select * from tblInsa;

execute procTest(400);
EXEC procTest(500);
CALL procTest(600);

CREATE OR REPLACE procedure procTest(width NUMBER, height number)
IS 
	vresult NUMBER;
	vnum NUMBER;
BEGIN
	vresult := width * height;
	dbms_output.put_line(vresult);
END procTest;

BEGIN
	procTest(10, 20);
END;


CREATE OR REPLACE PROCEDURE procTest (
	name varchar2

)
IS -- 변수 선언이 없어도 반드시 기재

BEGIN
	
	dbms_output.put_line('안녕하세요.' || name || '님');
	
END procTest;

BEGIN
	procTest('홍길동');
END;



CREATE OR REPLACE procedure procTest(
	width NUMBER , 
	height NUMBER DEFAULT 10)
IS 
	vresult NUMBER;
BEGIN
	vresult := width * height;
	dbms_output.put_line(vresult);
END procTest;


BEGIN
	--procTest (10,20);	-- width(10), height(10)
	procTest (10);		-- width(10), height(10-default)
END;

/*

	매개변수 모드
	- 매개변수가 값을 전달하는 방식
	- Call by Value > 매개변수 > 값을 넘기는 방식(값형 인자)
	- Call by Reference > 매개변수 > 참조값(주소)을 넘기는 방식(참조형 인자)
	
	1. in 모드 > 기본
	2. out 모드
	3. in out 모드(X)


*/

CREATE OR REPLACE PROCEDURE procTest (
	pnum1 NUMBER,		-- in PARAMETER // 인자값
	pnum2 NUMBER,
	presult OUT NUMBER,		-- out PARAMETER // 반환값 역할
	presult2 OUT NUMBER,	-- 반환값
	presult3 OUT NUMBER		-- 반환값
)
IS

BEGIN
	presult := pnum1 + pnum2;
	presult2 := pnum1 - pnum2;
	presult3 := pnum1 * pnum2;
END procTest;


DECLARE 
	vnum NUMBER;
	vnum2 NUMBER;
	vnum3 NUMBER;
BEGIN
	procTest(10, 20, vnum, vnum2, vnum3);
	dbms_output.put_line(vnum);
	dbms_output.put_line(vnum2);
	dbms_output.put_line(vnum3);
END;

-- 문제
-- 1. 부서 전달(인자) > 해당 부서의 직원 중 급여를 가장 많이 받는 사람의 번호 반환(out) > 출력
-- in 1개 out 1개
-- 2. 직원 번호 전달(인자) > 같은 지역에 사는 직원 수?, 같은 직위의 직원수? 해당 직원보다 급여를 더 많이 받는 직원수 반환
-- in 1개 out 3개
CREATE OR REPLACE PROCEDURE proctest1 (
	pbuseo IN varchar2,
	pnum OUT number
)
IS 

BEGIN
	SELECT num INTO pnum FROM tblinsa
		WHERE basicpay = (SELECT max(basicpay) FROM tblinsa WHERE buseo = pbuseo)
			AND buseo = pbuseo;
END proctest1;

declare 
	vnum NUMBER;	-- out에게 넘길 변수
begin
	proctest1('기획부', vnum);
	dbms_output.put_line(vnum);
end;


CREATE OR REPLACE PROCEDURE proctest2 (
	pnum IN NUMBER,	-- 직원 번호
	pcnt1 OUT NUMBER,
	pcnt2 OUT NUMBER,
	pcnt3 OUT NUMBER
)
IS
	
BEGIN
	-- 같은 지역에 사는 직원 수?, 같은 직위의 직원수? 해당 직원보다 급여를 더 많이 받는 직원수 반환
	
	SELECT count(*) INTO pcnt1 FROM tblinsa WHERE city = (SELECT city FROM tblinsa WHERE num = pnum);
	SELECT count(*) INTO pcnt2 FROM tblinsa WHERE jikwi = (SELECT jikwi FROM tblinsa WHERE num = pnum);
	SELECT count(*) INTO pcnt3 FROM tblinsa WHERE basicpay > (SELECT basicpay FROM tblinsa WHERE num = pnum);
	
	
END proctest2;




declare 
	vnum NUMBER;
	vcnt1 NUMBER;
	vcnt2 NUMBER;
	vcnt3 NUMBER;
BEGIN
	proctest1('개발부', vnum);
	proctest2(vnum, vcnt1, vcnt2, vcnt3);
	dbms_output.put_line(vcnt1);
	dbms_output.put_line(vcnt2);
	dbms_output.put_line(vcnt3);
end;

SELECT * FROM tblstaff;
SELECT * FROM tblproject;

                               
DELETE FROM TBLSTAFF;
DELETE FROM tblproject;

INSERT INTO tblStaff (seq, name, salary, address) VALUES (1, '홍길동', 300, '서울시');
INSERT INTO tblStaff (seq, name, salary, address) VALUES (2, '아무개', 250, '인천시');
INSERT INTO tblStaff (seq, name, salary, address) VALUES (3, '하하하', 250, '부산시');

INSERT INTO tblProject (seq, project, staff_seq) VALUES (1, '홍콩 수출', 1); --홍길동
INSERT INTO tblProject (seq, project, staff_seq) VALUES (2, 'TV 광고', 2); --아무개
INSERT INTO tblProject (seq, project, staff_seq) VALUES (3, '매출 분석', 3); --하하하
INSERT INTO tblProject (seq, project, staff_seq) VALUES (4, '노조 협상', 1); --홍길동
INSERT INTO tblProject (seq, project, staff_seq) VALUES (5, '대리점 분양', 2); --아무개

COMMIT;


-- 직원 퇴사 프로시저, procDeleteStaff
-- 1. 퇴사 직원 > 담당 프로젝트 유무 확인?
-- 2. 담당 프로젝트 존재 > 위임
-- 3. 퇴사 직원 삭제

CREATE OR REPLACE PROCEDURE procDeleteStaff(
	pseq NUMBER,			-- 퇴사 할 직원 번호
	pstaff NUMBER,			-- 위임받을 직원번호
	presult OUT NUMBER		-- 성공(1) OR 실패(0) > 피드백
)
IS
	vcnt NUMBER; -- 퇴사 직원의 담당 프로젝트 개수
BEGIN
	
	--1. 퇴사 직원이 담당 프로젝트가 있는지?
	SELECT count(*) INTO vcnt FROM tblproject WHERE staff_seq = pseq;

	--2. 조건 > 위임 유무 결정
	IF vcnt > 0 THEN
		--3. 위임
		UPDATE tblproject SET staff_seq = pstaff WHERE staff_seq = pseq;
	ELSE 
		--3. 아무것도 안 함
		NULL; -- 이 조건의 else절에는 아무것도 하지 마시오!! > 개발자의 의도 표현
	END IF;

	--4. 퇴사
	DELETE FROM tblstaff WHERE seq = pseq;

	--5. 피드백 > 성공
	presult := 1;

EXCEPTION
	WHEN OTHERS THEN 
		presult := 0;
		
	
	
END procDeleteStaff;

declare 
	vresult NUMBER;
begin
	procDeleteStaff(1, 2, vresult);
	IF vresult = 1 THEN
	dbms_output.put_line('퇴사 성공');
	else
	dbms_output.put_line('퇴사 실패');
	END IF;
END ;


SELECT * FROM tblstaff;
SELECT * from tblproject;

INSERT INTO tblstaff VALUES (4, '호호호', 200, '서울시');

-- 위임 받을 직원 > 현재 프로젝트를 가장 적게 담당 직원에게 자동으로 위임
-- 동률 > rownum = 1
CREATE OR REPLACE PROCEDURE procDeleteStaff(
	pseq NUMBER,			-- 퇴사 할 직원 번호
	presult OUT NUMBER		-- 성공(1) OR 실패(0) > 피드백
)
IS
	vcnt NUMBER;		-- 퇴사 직원의 담당 프로젝트 개수
	vstaff_seq NUMBER;	-- 담당 프로젝트가 가장 적은 직원 번호
BEGIN
	
	--1. 퇴사 직원이 담당 프로젝트가 있는지?
	SELECT count(*) INTO vcnt FROM tblproject WHERE staff_seq = pseq;

	--2. 조건 > 위임 유무 결정
	IF vcnt > 0 THEN
	
		--2.5 적게 맡고 있는 직원 번호?
		SELECT * FROM tblstaff s
			LEFT OUTER JOIN tblproject p
				ON s.seq = p.staff_seq;
	
		--3. 위임
		UPDATE tblproject SET staff_seq = pstaff WHERE staff_seq = pseq;
	ELSE 
		--3. 아무것도 안 함
		NULL; -- 이 조건의 else절에는 아무것도 하지 마시오!! > 개발자의 의도 표현
	END IF;

	--4. 퇴사
	DELETE FROM tblstaff WHERE seq = pseq;

	--5. 피드백 > 성공
	presult := 1;

EXCEPTION
	WHEN OTHERS THEN 
		presult := 0;
		
	
	
END procDeleteStaff;


