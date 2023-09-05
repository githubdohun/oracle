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
 
 
 
 
 
 
 
 
 
 
 
 
*/
