
-- 단일라인 주석
/*
    다중라인 주석
*/
/*
oracle > disk 1 11g xe(Expression Edition)

setup으로 설치

암호지정
- java1234



sql 폴더 > C:\class\dev로 옮기기

class\oracle 에서 오라클 수업 진행할거임

---------------------------------------------------------

Java
- 제품명
- 회사명 > 썬 > 오라클

Oracle Database
- 제품명이기도 하고 회사이름(Oracle)이기도함

Database
- 데이터베이스 -> 데이터 집합을 의미
- 관리, 운영, 보안 등..-> 데이터베이스 관리시스템

데이터베이스 관리시스템
- Database Management System
- 오라클(DB이기도 하면서 조작(DBMS)까지 할 수 있음) ->

Oracle windows 메뉴
- Backup Database > 백업용
- Restore Database > 불러오기

백그라운드 프로세스
- 서비스(Service)
- 리눅스 : 데몬(Daemon)
오라클은 실행해도 안보임


오라클 실행/종료/상태확인
- Win+R > services.msc


OracleServiceXE > 데이터베이스 > 이게 멈추면 오라클이 멈춤

OracleXETNSListener > 리스너(클라이언트 도구와 연결하는 역할) 

- 이 두개가 동시에 실행되고 있어야한다.

나머지는 DB 관리하는애들이 씀


OracleServiceXE
- 시작 유형 : 자동 or 수동

오라클을 안쓸때는 중지를 해놓는게 나음 > 메모리 겁나 잡아먹음



SQL Developer
- 데이터베이스 클라이언트 툴
- 눈에 안보이는 오라클에 연결해서 조작하는 프로그램
- 개발자 <-> 중계인(데이터베이스 클라이언트) <-> 오라클(데이터베이스 서버)


접속 - 새 데이터베이스 접속
- Name : localhost.system ([컴퓨터이름이나 아이피이름].[로그인한 계정이름])
- ID : system / PW : java1234
- 세부정보 : localhost / 
포트 : 1521(국민번호임,공부하는사람만 씀) / SID(서비스아이디) : xe
저장 후 테스트 - 상태 : 성공 > 접속


편집창을 워크시트라고 부름
- localhost.system 오른쪽 우클릭 
> SQL 워크시트 열기 > 스크립트or스크립트파일라고 부름 > *.sql


localhost + system

localhost > 현재 컴퓨터

localhost == 127.0.0.1(IP Address, 루프백-자기자신을 뜻하는 말, 자바로 치면 this)


system으로는 작업 안함 > 권한이 너무 커서;; > 실수, 보안 때문에

보통은 일반 계정으로 작업 > 특정 업무에 대한 권한만 있는 계정 > 수업


오라클이 학습용 계정 제공(==일반계정) > + 샘플데이터도 같이 줌 > hr

+ 누르고 localhost.hr 만들고 Id : hr / pw : 작성x

hr계정 비번 바꾸기(특정 계정의 비밀번호 바꾸기)
- alter user 계정명 identified by 비밀번호; > 바꿀 비밀번호 입력하기
- alter user 계정명 account unlock/lock; > 특정 계정의 활성화/비활성화








*/

alter user hr identified by java1234;


alter user hr account unlock;



/*

Oracle Database 11g Enterprise Edition(기업용)
Oracle Database 11g Express Edition(무료, 교육용)



SQL , Structured Query Language
- 구조화된 질의 언어
- 개발자(SQL Developer) <-> SQL <-> 오라클 
- DBMS 조작하기 위한 언어

오라클과 SQL
1. 데이터베이스 관리자, DBA
    - 오라클과 SQL 모든것을 함
    
2. 데이터베이스 개발자, DB 개발자
    - 오라클과 SQL 모든것을 함

3. 응용 프로그램 개발자(자바 개발자)
    - 모든 것 or 일부 사용
    
일반적인 회사는 DB부서가 따로 있다.



관계형 DBMS
1. Oracle
2. MS-SQL(Microsoft) > 기업용
3. MySQL > 무료(개인,기업)
4. MariaDB > 무료(개인,기업)
5. PostreSQL > 무료(개인,기업)
6. DB2 > IBM
7. SQLite > Mobile


SQL
1. DBMS 제작사와는 독립적이다.
    - 모든 관계형 데이터베이스에서 공통적으로 사용하기 위해 만들어진 언어
    - DBMS 제작사에서 SQL이라는 언어를 자신의 제품을 적용, 언어를 가지고 와서
    자기네 회사 프로그램에 적용

2. 표준 SQL, ANSI-SQL
    - 모든 DBMS에 적용 가능한 SQL
    
3. 제조사별 SQL
    - 특정 DBMS에 적용 가능한 SQL
    - Oracle > PL/SQL
    - MS-SQL > T-SQL
    
    
    
오라클 수업 == ANSI-SQL(50~60%) + PL/SQL(20~30%) + 설계,기타(10%) 사용



(관계형)데이터베이스
- 데이터를 표 형식으로 저장/관리한다.
- SQL을 사용한다.



ANSI-SQL
1. DDL
    - Data Definition Language
    - 데이터 정의어
    - 테이블, 뷰, 사용자, 인덱스 등의 데이터베이스 오브젝트를
      생성/수정/삭제하는 명령어
    - 구조를 생성/관리 하는 명령어
    a. CREATE : 생성
    b. DROP : 삭제
    c. ALTER : 수정
    - 데이터베이스 관리자
    - 데이터베이스 담당자
    - 프로그래머(일부)
    
2. DML
    - Data Mainpulation Language
    - 데이터 조작어
    - 데이터를 추가/수정/삭제/조회하는 명령어
    - CRUD
    - 사용 빈도가 가장 높음
    a. SELECT : 조회(읽기) > R
    b. INSERT : 추가(생성) > C
    c. UPDATE : 수정 > U
    d. DELETE : 삭제 > D
    - 데이터베이스 관리자
    - 데이터베이스 담당자
    - 프로그래머(********************************무적권 알아야함)
    
3. DCL
    - Data Control Language
    - 데이터 제어어
    - 계정 관리, 보안관리, 트랜잭션 관리 등..
    a. COMMIT
    b. ROLLBACK
    c. GRANT
    d. REVOKE
    - 데이터베이스 관리자
    - 데이터베이스 담당자
    - 프로그래머(일부)
    
4. DQL
    - Data Query Language
    - DML 중에서 SELECT문을 따로 부르는 표현

5. TCL
    - Transaction Control Language
    - DCL 중에서 COMMIT, ROLLBACK문을 따로 부르는 표현

오라클 인코딩
- 1.0~ 8i : EUC-KR
- 9i ~ 현재 : UTF-8










*/

-- SQL > 대소문자 구분하지 않는다.
-- 파란색 > 키워드
-- 검은색 > 식별자

select * from tabs;

SELECT * FROM tabs;



-- 'JOBS' > 문자 상수 > *** 데이터는 대소문자를 구분한다.
select * from tabs where table_name = 'JOBS';

select * from tabs where table_name = 'jobs';



-- 1. 키워드 > 대문자
-- 2. 식별자 > 소문자
SELECT * FROM tabs;


-- 1. 키워드 > 대문자
-- 2. 식별자 > 캐멀
SELECT * FROM tabs; -- art + ' 하면 패턴으로 돌아감



-- DB Object 식별자 주의점 > 최대 30바이트까지(30자)
create table aaa (
    num number

);

create table aaaaaaaaaaaaaaaaaaaaaaa (
    num number

);

/*
create table aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa (
    num number

);
*/

/*

-




*/










