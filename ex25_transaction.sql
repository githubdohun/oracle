-- ex25_transaction.sql



/*
 
 트랜젝션, Transaction
 - 데이터를 조작하는 업무의 물리적(시간적) 단위(행동의 범위)
 - 1개 이상의 명령어를 묶어 놓은 단위
 
 
 트랜잭션 관련 명렁어, DCL(TCL)
 1. COMMIT
 2. ROLLBACK
 3. SAVEPOINT
 
 */

CREATE TABLE tblTrans
AS
SELECT name, buseo, jikwi FROM tblinsa WHERE city = '서울';

SELECT * FROM tbltrans;

-- 우리가 하는 행동 > 시간순으로 기억(***)





