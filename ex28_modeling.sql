-- ex28_modeling.sql

/*
 
 
 	데이터베이스 설계
 	1. 요구사항 수집 및 분석
 	2. 개념 데이터 모델링
 	3. 논리 데이터 모델링
 	4. 물리 데이터 모델링
 	5. 데이터베이스 구축(구현)
 	
 	
 	데이터 모델링
 	- 요구 분석 기반 > 수집한 데이터 > 분석 > 저장 구조 > 도식화 > 산출물(ERD)
 	- 데이터를 저장하기 위한 데이터 구조를 설계하는 작업
 	- 개념 +  논리 + 물리
 	- 개념 > 아주 간단한 표현의 설계도 > 테이블 이름 + 속성 + 관계 정도만 기술
 	- 논리 > 관계형 데이터베이스 기본 설정 > 속성(자료형, 길이) + 도메인 정의 + 키..
 	- 물리 > 물리적 식별자 + 모든 것들을 실제 DBMS에 맞춰서 현실화
 
 
 	1. ERD, Entity Relationship Diagram
 	- 엔티티의 관계를 표현한 그림
 	- 데이터베이스 모델링 기법 중 하나
 	- 손, 오피스, 전문툴(eXERD, ER-Win, 온라인 툴..)
 	
 	2. Entity, 엔티티
 	- 다른 Entity와 분류(구분)될 수 있고, 다른 Entit에 대해 정해진 관계를 맺을 수 있는 데이터 단위
 	- 릴레이션 = 테이블(? > 레코드) = 엔티티 = 인스턴스 = 객체
 		a. 학생 정보 관리
 			- 정보 수집: 아이디, 이름, 나이, 주소, 연락처...
 			- 학생(아이디, 이름, 나이, 주소, 연락처)
 		b. 강의실 정보 관리
 			- 정보 수집: 강의실명, 크기, 인원 수, 용도 등..
 			- 강의실(강의실명, 크기, 인원 수, 용도)
 			
 	3. Attribute, 속성
 	- 엔티티를 구성하는 구성 요소
 	- 속성의 집합 = 엔티티
 	- 컬럼
 	
 	
 	4. Relationship, 관계
 	- 하나의 엔티티 안에 들어있는 속성들은 서로 관계가 있다.
 	- 학생(아이디, 이름, 나이, 주소, 연락처)
 	 
 	 
 	5. Relational, 관계 
 	- 엔티티와 엔티티간의 관계
 	- 테이블의 관계
 	
 	ERD > Entity, Attribute, Relation 등 표현하는 방법 > 그림 그리는 방법
 	
 	1. Entity
 	- 사각형
 	- 이름 작성
 	- ERD내의 엔티티명은 중복 될 수 없다.
 	
 	2. Attribute
 	- 피터첸
 		- 원으로 표시
 		- 엔티티 연결
 	- IE
 		- 엔티티내의 목록으로 표시
 	
 	3. Relation
 	- 엔티티와 엔티티의 관계
 	- 피터첸
 	- IE(새발)
 
 
 	비디오 대여점
 	
 	1. 엔티티 정의
 		- 장르
 		- 비디오
 		- 회원
 		- 대여
 		
	2. 속성 정의
	
	3. 기본키 정의
	
	4. 관계 맺기
	
 	-------------------------------------
 	
 	5. 논리 다이어그램
 		- 개념 모델(ERD) > 스키마 추가
 		
 	6. 물리 다이어그램
 		- 실제 구현하기 위한 모든 것을 추가
 		
 	-------------------------------------
 	
 	산출물
 	a. ERD(개념 모델링)
 	b. 논리 다이어그램
 	c. 물리 다이어그램
 	
 	-------------------------------------

	모델링 작업 > ERD > 올바르게?? > 검증 > 정규화 > 안정성 높고, 작업 하기 편한 ERD
	
	정규화, Normalization
	- 자료의 손실이나, 불필요한 정보를 없애고, 데이터의 일관성을 유지하며, 데이터의 종속성을 최소화 하기 위해 ERD를 수정하는 작업
	- 우리가 만든 테이블(ERD) > 비정형, 비정규화 상태 > 정규화 
	- 제 1 정규화 > 제 2 정규화 > 제 3 정규화 등 ...
	
	 
	관계형 데이터베이스 시스템이 지향하는 데이터베이스의 상태
	1. 최대한 null을 가지지 않는다.
	2. 중복값을 가지지 않는다.
	3. 원자값을 가진다.
	
	정규화 목적
	1. null 최대한 제거
	2. 중복값 제거
	3. 복합값 제거
	4. 자료의 삽입 이상, 갱신 이상, 삭제 이상 현상 제거 
	
	
	
	이상 현상
	1. 삽입 이상, Insertion Anomaly
		- 특정 테이블에 데이터를 삽입할 때 원하지 않는 데이터까지 같이 넣어야 하는 상황
		
	2. 갱신 이상, Update Anomaly
		- 동일한 데이터가 2개 이상의 테이블에 동시 저장
			> 그 중 1개는 수정했지만, 다른 1개를 수정 하지 못하면, 둘 중 어느 것이 올바른 데이터인지 판단하지 못하는 상황
			
	3. 삭제 이상, Delecion Anomaly
		- 특정 테이블에서 데이터를 삭제할 때 원하지 않는 데이터까지 같이 삭제하는 상황
		
	
	
	함수 종속, Functional Dependency
	- 하나의 테이블내에서 컬럼끼리의 관계 표현
	- 정규화란 '부분 함수 종속'이나 '이행 함수 종속'을 모두 없애고, 모든 컬럼의 관계를 '완전 함수 종속'으로 만드는 직업이다.
 
 	1. 완전 함수 종속
 	2. 부분 함수 종속
 	3. 이행 함수 종속
 
 
 	정규화
 	- 1NF, 2NF, 3NF(Normal Form)
 	
 	제 1 정규화, 1NF
 	- 모든 컬럼(속성)은 원자값을 가진다.
 	- 여러개의 분리 가능한 값을 1개의 컬럼안에 넣지 말 것.
 	- 1개 테이블 > 정규화 > 2개 이상의 테이블
 	
 	제 2 정규화, 2NF
 	- 기본 키가 아닌 다른 모든 컬럼은 기본키에 완전 함수 종속이어야 한다.
 	- 부분 함수 종속 발견!! > 부분 함수 종속 제거!!
 	
 	완전 함수 종속: 특정 열(속성)이 다른 열들에 대해 완전하게 함수적으로 종속되어 있는 경우 > 
 
 
 	제 3 정규화, 3NF
 	- 기본 키가 아닌 모든 컬럼은 기본키에 완전 함수 종속이어야 한다.
 	- 이행 함수 종속 발견!! > 이행 함수 종속 제거!!
 	- 1개 테이블 > 정규화 > 2개 이상의 테이블
 
 	**무조건 모든 컬럼은 기본키에 종속되어야한다**
 	
 	역정규화
 	- 정규화 된 결과를 다시 원래대로 되돌리는 작업
 	- 2개 이상의 테이블 > 역정규화 > 1개 테이블
 	- 수업 중 사용 금지!!

 	
 	
 
 
 
 
 
 
 
*/


