-- 문제03.sql



-- 집계함수 > count()



-- 1. tblCountry. 아시아(AS)와 유럽(EU)에 속한 나라의 개수?? -> 7개
       SELECT
       count(*) 
       FROM tblcountry WHERE continent IN ('AS', 'EU');

-- 2. 인구수가 7000 ~ 20000 사이인 나라의 개수?? -> 2개
    SELECT count(*)FROM tblcountry WHERE population BETWEEN 7000 AND 20000;


-- 3. hr.employees. job_id > 'IT_PROG' 중에서 급여가 5000불이 넘는 직원이 몇명? -> 2명
    SELECT
    count(*)
    FROM employees WHERE job_id = 'IT_PROG' AND salary > 5000;

	SELECT * FROM employees;
-- 4. tblInsa. tel. 010을 안쓰는 사람은 몇명?(연락처가 없는 사람은 제외) -> 42명
	SELECT
	count(tel)
	FROM tblinsa WHERE tel IS NOT NULL AND tel NOT LIKE '010%';
    
    SELECT * FROM tblinsa;
    
    

-- 5. city. 서울, 경기, 인천 -> 그 외의 지역 인원수? -> 18명
	SELECT 
	count(*)
	FROM tblinsa WHERE city NOT IN ('서울', '경기', '인천');
    

-- 6. 여름태생(7~9월) + 여자 직원 총 몇명? -> 7명
	SELECT
	count(*)
	FROM tblinsa WHERE ssn LIKE '__07%' OR ssn LIKE '__08%' OR ssn LIKE '__09%' AND ssn LIKE '%-2%';

-- 7. 개발부 + 직위별 인원수? -> 부장 ?명, 과장 ?명, 대리 ?명, 사원 ?명
	SELECT 
	count(CASE
		WHEN JIKWI = '부장' THEN 1
	END) AS 부장,
	count(CASE 
		WHEN JIKWI = '과장' THEN 1
	END) AS 과장,
	count(CASE 
		WHEN JIKWI = '대리' THEN 1
	END) AS 대리,
	count(CASE 
		WHEN JIKWI = '사원' THEN 1
	END) AS 사원 
	FROM tblinsa WHERE buseo = '개발부'; 

SELECT * FROM tblinsa WHERE buseo = '개발부';
