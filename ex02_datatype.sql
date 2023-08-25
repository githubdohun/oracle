-- ex02_datatybe.sql
/*


관계형 데이터베이스
- 변수(X) > SQL은 프로그래밍 언어가 아니다.
- SQL > 대화형 언어 > DB와  대화를 목적으로 하는 언어
- 자료형 > 데이터 저장하는 규칙 > 테이블 정의할 때 사용 > 컬럼의 자료형



ANSI-SQL 자료형
- 오라클 자료형


1. 숫자형
    - 정수, 실수
    a. number
        - (유효자리)38자리 이하의 숫자를 표현하는 자료형
        - 1234567890 1234567890 1234567890 12345678
        - 5~22byte
        - 1X10^-130 ~ 9.9999X10^125
        
        - number: 정수 & 실수
        - number(precision): 전체 자릿수, 정수
        - number(precision, scale): 전체 자릿수, 소수 이하 자릿수, 실수

        
        
        
    
2. 문자형
    - 문자, 문자열
    - char vs nchar > n의 의미?
    - char vs varchar > var의 의미?
    
    a. char
        - 고정 자릿수 문자열 > 공간(컬럼)의 크기가 불변
        - char(n): 최대 n자리 문자열, n(바이트)
        - 최소 크기: 1바이트
        - 최대 크기: 2000바이트
        
        
    b. nchar
    
    
    
    
    c. varchar2 > variable
        - 가변 자릿수 문자열 > 공간(컬럼)의 크기가 가변
        - varchar2(n): 최대 n자리 문자열, n(바이트)
        - varchar2(n char)
    
    
    
    
    d.nvarchar2
    

    
3. 날짜/시간형

4. 이진 데이터형




*/


 
/*
테이블 선언 (생성)
create table 테이블명 (
    컬럼 선언,
    컬럼 선언,
    컬럼 선언,  
    컬럼 선언,
    컬럼명 자료형

)
*/

-- 식별자 > 타입 접두어 > 헝가리안 표기법
create table tblTybe (
    --num number
    --num number(3) -- -999 ~ 999
    --num number(4,2) -- -99.99 ~ 99,99
    
    --txt char(10) --최대 10바이트까지의 문자열
    --txt char(10 char) -- 최대 10글자까지의 문자열
    
    --txt VARCHAR2(10)
    
    txt1 char(10),
    txt2 varchar(10)
);


-- 테이블
drop table tblTybe;



-- 데이터 추가
-- insert into 테이블 (컬럼) values (값);
insert into tblTybe (num) values (100); --정수 리터럴
insert into tblTybe (num) values (3.14); --실수 리터럴
insert into tblTybe (num) values (3.99); --반올림
insert into tblTybe (num) values (1234); 
insert into tblTybe (num) values (-999); 
insert into tblTybe (num) values (999); 
insert into tblTybe (num) values (-99.99); 
insert into tblTybe (num) values (99.99); 
insert into tblTybe (num) values (1234567890);
insert into tblTybe (num) values (12345678901234567890);
insert into tblTybe (num) values (123456789012345678901234567890);
insert into tblTybe (num) values (12345678901234567890123456789012345678901234567890);

-- Java: Strong Tybe Language
-- SQL: Weak Tybe Language

-- SQL의 암시적인 형변환이 자주 일어난다.
insert into tblTybe (txt) values (100); -- 100(number) > '100'(char)
insert into tblTybe (txt) values ('홍길동'); --문자 리터럴


-- 오라클 인코딩 > UTF-8 > 영어(1) 한글(3) > 10바이트
insert into tblTybe (txt) values ('abcabcabca'); --10바이트

--value too large for column "HR"."TBLTYBE"."TXT" (actual: 11, maximum: 10)
insert into tblTybe (txt) values ('abcabcabcaa'); --11바이트


insert into tblTybe (txt) values ('홍길동입니다.'); --(actual: 19, maximum: 10)
insert into tblTybe (txt) values ('홍길동'); --한글 3글자
insert into tblTybe (txt) values ('홍길동님');

insert into tblTybe (txt1, txt2) values ('abc', 'abc');

--데이터 가져오기 > 결과 테이블(Result Table), 결과셋(ResultSet)
select * from tblTybe;

commit;

--*** 오라클은 모든 식별자를 대문자로 지정한다.

/*
DB Client Tools
1. SQL Developer > 오라클 제공, 무료, 그럭저럭
2. SQL*Plus > 오라클 제공, 무료, 오라클 설치될 때 같이 설치. CLI
3. SQLGate
4. Orange
5. DBeaver
6. ..
7. Toad
8. DataGrid(jetbrains) > 학교 계정(이메일) > 1년 단위(갱신)



*/

