use analyze_db;

SELECT * FROM TB_POPLTN_DATA;

INSERT INTO TB_POPLTN
SELECT A.ADMINIST_ZONE_NO, A.ADMINIST_ZONE_NM, A.STD_MT
     , CASE WHEN LVL1 = 1 THEN 'M' WHEN LVL1 = 2 THEN 'F' WHEN LVL1 = 3 THEN 'T' END AS POPLTN_SE_CD
     , CASE WHEN LVL2 = 1  THEN '000' WHEN LVL2 = 2  THEN '010' WHEN LVL2 = 3  THEN '020'
            WHEN LVL2 = 4  THEN '030' WHEN LVL2 = 5  THEN '040' WHEN LVL2 = 6  THEN '050'
            WHEN LVL2 = 7  THEN '060' WHEN LVL2 = 8  THEN '070' WHEN LVL2 = 9  THEN '080' WHEN LVL2 = 10 THEN '090' WHEN LVL2 = 11 THEN '100' END AS AGRDE_SE_CD
     , CASE WHEN LVL1 = 1 AND LVL2 = 1  THEN MALE_POPLTN_CO_0_9     WHEN LVL1 = 1 AND LVL2 = 2  THEN MALE_POPLTN_CO_10_19
            WHEN LVL1 = 1 AND LVL2 = 3  THEN MALE_POPLTN_CO_20_29   WHEN LVL1 = 1 AND LVL2 = 4  THEN MALE_POPLTN_CO_30_39
            WHEN LVL1 = 1 AND LVL2 = 5  THEN MALE_POPLTN_CO_40_49   WHEN LVL1 = 1 AND LVL2 = 6  THEN MALE_POPLTN_CO_50_59
            WHEN LVL1 = 1 AND LVL2 = 7  THEN MALE_POPLTN_CO_60_69   WHEN LVL1 = 1 AND LVL2 = 8  THEN MALE_POPLTN_CO_70_79
            WHEN LVL1 = 1 AND LVL2 = 9  THEN MALE_POPLTN_CO_80_89   WHEN LVL1 = 1 AND LVL2 = 10 THEN MALE_POPLTN_CO_90_99
            WHEN LVL1 = 1 AND LVL2 = 11 THEN MALE_POPLTN_CO_100     WHEN LVL1 = 2 AND LVL2 = 1  THEN FEMALE_POPLTN_CO_0_9
            WHEN LVL1 = 2 AND LVL2 = 2  THEN FEMALE_POPLTN_CO_10_19 WHEN LVL1 = 2 AND LVL2 = 3  THEN FEMALE_POPLTN_CO_20_29
            WHEN LVL1 = 2 AND LVL2 = 4  THEN FEMALE_POPLTN_CO_30_39 WHEN LVL1 = 2 AND LVL2 = 5  THEN FEMALE_POPLTN_CO_40_49
            WHEN LVL1 = 2 AND LVL2 = 6  THEN FEMALE_POPLTN_CO_50_59 WHEN LVL1 = 2 AND LVL2 = 7  THEN FEMALE_POPLTN_CO_60_69
            WHEN LVL1 = 2 AND LVL2 = 8  THEN FEMALE_POPLTN_CO_70_79 WHEN LVL1 = 2 AND LVL2 = 9  THEN FEMALE_POPLTN_CO_80_89
            WHEN LVL1 = 2 AND LVL2 = 10 THEN FEMALE_POPLTN_CO_90_99 WHEN LVL1 = 2 AND LVL2 = 11 THEN FEMALE_POPLTN_CO_100
            WHEN LVL1 = 3 AND LVL2 = 1  THEN POPLTN_CO_0_9          WHEN LVL1 = 3 AND LVL2 = 2  THEN POPLTN_CO_10_19
            WHEN LVL1 = 3 AND LVL2 = 3  THEN POPLTN_CO_20_29        WHEN LVL1 = 3 AND LVL2 = 4  THEN POPLTN_CO_30_39
            WHEN LVL1 = 3 AND LVL2 = 5  THEN POPLTN_CO_40_49        WHEN LVL1 = 3 AND LVL2 = 6  THEN POPLTN_CO_50_59
            WHEN LVL1 = 3 AND LVL2 = 7  THEN POPLTN_CO_60_69        WHEN LVL1 = 3 AND LVL2 = 8  THEN POPLTN_CO_70_79
            WHEN LVL1 = 3 AND LVL2 = 9  THEN POPLTN_CO_80_89        WHEN LVL1 = 3 AND LVL2 = 10 THEN POPLTN_CO_90_99
            WHEN LVL1 = 3 AND LVL2 = 11 THEN POPLTN_CO_100 END AS POPLTN_CNT
  FROM
     (
      SELECT SUBSTR(ADMINIST_ZONE, INSTR(ADMINIST_ZONE, '(') + 1, 10) AS ADMINIST_ZONE_NO
           , SUBSTR(ADMINIST_ZONE, 1, INSTR(ADMINIST_ZONE, '(')-1) AS ADMINIST_ZONE_NM,
             '202304' AS STD_MT
           , MALE_POPLTN_CO_0_9    , MALE_POPLTN_CO_10_19  , MALE_POPLTN_CO_20_29
           , MALE_POPLTN_CO_30_39  , MALE_POPLTN_CO_40_49  , MALE_POPLTN_CO_50_59
           , MALE_POPLTN_CO_60_69  , MALE_POPLTN_CO_70_79  , MALE_POPLTN_CO_80_89  , MALE_POPLTN_CO_90_99  , MALE_POPLTN_CO_100
           , FEMALE_POPLTN_CO_0_9  , FEMALE_POPLTN_CO_10_19, FEMALE_POPLTN_CO_20_29
           , FEMALE_POPLTN_CO_30_39, FEMALE_POPLTN_CO_40_49, FEMALE_POPLTN_CO_50_59
           , FEMALE_POPLTN_CO_60_69, FEMALE_POPLTN_CO_70_79, FEMALE_POPLTN_CO_80_89, FEMALE_POPLTN_CO_90_99, FEMALE_POPLTN_CO_100
           , POPLTN_CO_0_9         , POPLTN_CO_10_19, POPLTN_CO_20_29
           , POPLTN_CO_30_39       , POPLTN_CO_40_49, POPLTN_CO_50_59
           , POPLTN_CO_60_69       , POPLTN_CO_70_79, POPLTN_CO_80_89, POPLTN_CO_90_99, POPLTN_CO_100
           , LVL1, LVL2
        FROM TB_POPLTN_DATA, (SELECT (tmp1.idx) AS LVL1 FROM (SELECT 1 as idx UNION SELECT 2 UNION SELECT 3) tmp1) LVL1, (SELECT (tmp2.idx) AS LVL2 FROM (SELECT 1 as idx UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9 UNION SELECT 10 UNION SELECT 11) tmp2) LVL2
     ) A ;


SELECT * FROM TB_POPLTN;


-- 1) 2023년 4월 기준 전국 시/도 기준 연령대별 인구수 합계
SELECT
	AGRDE_SE_CD,
    SUM(POPLTN_CNT) AS AGRDE_POPLTN_CNT
FROM TB_POPLTN
WHERE STD_MT = '202304'
  AND POPLTN_SE_CD = 'T'
  AND ADMINIST_ZONE_NO LIKE '__00000000'
GROUP BY AGRDE_SE_CD;

-- 2) 2023년 4월 기준 전국 시/도 연령대별 인구수 비율 구하기
SELECT
	A.AGRDE_SE_CD,
    A.AGRDE_POPLTN_CNT,
    SUM(A.AGRDE_POPLTN_CNT) OVER() AS SUM_AGRDE_POPLTN_CNT,
    A.AGRDE_POPLTN_CNT / SUM(A.AGRDE_POPLTN_CNT) OVER() AS AGRDE_POPLTN_RATIO
FROM (
	SELECT
		AGRDE_SE_CD,
		SUM(POPLTN_CNT) AS AGRDE_POPLTN_CNT
	FROM TB_POPLTN
	WHERE STD_MT = '202304'
	  AND POPLTN_SE_CD = 'T'
	  AND ADMINIST_ZONE_NO LIKE '__00000000'
	GROUP BY AGRDE_SE_CD ) AS A;

-- 서브 쿼리 대신에 WITH ~ AS 구문 사용
--  WITH ~ AS 구문 : 서브쿼리에서 조회할 결과를 미리 "임시 테이블" 형식으로 만들어 놓는 방법
--   VIEW와는 다름. SELECT를 하게 되면 사라진다.

WITH TEMP_AGRDE_POPLTN_CNT AS (
	SELECT
		AGRDE_SE_CD,
		SUM(POPLTN_CNT) AS AGRDE_POPLTN_CNT
	FROM TB_POPLTN
	WHERE STD_MT = '202304'
	  AND POPLTN_SE_CD = 'T'
	  AND ADMINIST_ZONE_NO LIKE '__00000000'
	GROUP BY AGRDE_SE_CD
)

SELECT
	AGRDE_SE_CD,
    AGRDE_POPLTN_CNT,
    AGRDE_POPLTN_CNT / SUM(AGRDE_POPLTN_CNT) OVER() AS AGRDE_POPLTN_RATIO
FROM TEMP_AGRDE_POPLTN_CNT;

-- 3) 2023년 4월 기준 전국 시/도의 성별(M, F) 인구수 합계를 각각
SELECT
	POPLTN_SE_CD,
    SUM(POPLTN_CNT) AS SE_POPLTN_CNT
FROM TB_POPLTN
WHERE STD_MT = '202304'
  AND ADMINIST_ZONE_NO LIKE '__00000000'
  AND POPLTN_SE_CD IN ('M', 'F')
GROUP BY POPLTN_SE_CD;

-- 4) 2023년 4월 기준 전국 시/도의 
-- 여성 대비 남성의 비율
-- 전체 인구수 대비 남성 비율
-- 전체 인구수 대비 여성 비율

-- UNPIVOT 구현
--   현재는 세로 방향(PIVOT)으로만 데이터를 읽는 상황.
--   남성 인구수를 선택, 여성 인구수를 선택 -> SELECT 남성인구수, 여성인구수, 남성/여성
WITH TEMP_SE_POPLTN_CNT AS (
	SELECT
		POPLTN_SE_CD,
		IF(POPLTN_SE_CD = 'M', SUM(POPLTN_CNT), 0) AS MALE_POPLTN_CNT,
        IF(POPLTN_SE_CD = 'F', SUM(POPLTN_CNT), 0) AS FEMALE_POPLTN_CNT
	FROM TB_POPLTN
	WHERE STD_MT = '202304'
	  AND ADMINIST_ZONE_NO LIKE '__00000000'
	  AND POPLTN_SE_CD IN ('M', 'F')
	GROUP BY POPLTN_SE_CD
), TEMP_UNPIVOT_POPLTN_CNT AS (
	SELECT
		MAX(MALE_POPLTN_CNT) AS MALE_POPLTN_CNT,
        MAX(FEMALE_POPLTN_CNT) AS FEMALE_POPLTN_CNT
    FROM TEMP_SE_POPLTN_CNT
)
SELECT
	MALE_POPLTN_CNT,
    FEMALE_POPLTN_CNT,
    MALE_POPLTN_CNT / FEMALE_POPLTN_CNT AS "남성 / 여성 비율",
    MALE_POPLTN_CNT / (MALE_POPLTN_CNT + FEMALE_POPLTN_CNT) AS "전체 인구수 대비 남성 비율",
    FEMALE_POPLTN_CNT / (MALE_POPLTN_CNT + FEMALE_POPLTN_CNT) AS "전체 인구수 대비 여성 비율"
    
FROM TEMP_UNPIVOT_POPLTN_CNT;

-- 5) 2023년 4월 기준 전국의 읍/면/동의 인구수 조회
SELECT
	AGRDE_SE_CD,
    ADMINIST_ZONE_NO,
    ADMINIST_ZONE_NM,
    POPLTN_CNT
FROM TB_POPLTN
WHERE STD_MT = '202304'
  AND POPLTN_SE_CD = 'T'
  AND POPLTN_CNT > 0
  AND ADMINIST_ZONE_NO NOT LIKE '_____00000';
  
-- 6) 2023년 4월 기준 전국의 읍/면/동 인구수 조회 후 연령대별 인구수가 가장 많은 지역 조회
--   => 어린이가 가장 많은 지역, 10대가 가장 많은 지역, 20대가 가장 많은 지역...
--   => 연령대별 인구수가 가장 많다 == 연령대별 윈도우의 랭킹이 1위다.

WITH TEMP_EMD_POPLTN_CNT AS (
	SELECT
		AGRDE_SE_CD,
		ADMINIST_ZONE_NO,
		ADMINIST_ZONE_NM,
		POPLTN_CNT
	FROM TB_POPLTN
	WHERE STD_MT = '202304'
	  AND POPLTN_SE_CD = 'T'
	  AND POPLTN_CNT > 0
	  AND ADMINIST_ZONE_NO NOT LIKE '_____00000'
), TEMP_AGRDE_POPLTN_RANK AS (
	SELECT *,
		RANK() OVER(PARTITION BY AGRDE_SE_CD ORDER BY POPLTN_CNT DESC) AS POPLTN_RANK
    FROM TEMP_EMD_POPLTN_CNT
)
SELECT
	AGRDE_SE_CD,
    ADMINIST_ZONE_NO,
    ADMINIST_ZONE_NM,
    POPLTN_CNT
FROM TEMP_AGRDE_POPLTN_RANK
WHERE POPLTN_RANK = 1
ORDER BY AGRDE_SE_CD;

-- 7) 2023년 04월 기준 전국의 각 지역(읍/면/동/리)의 연령대별 인구수 비율이 가장 높은 지역 찾기.
WITH TEMP_EMD_POPLTN_CNT AS (
	SELECT
		ADMINIST_ZONE_NO,
		ADMINIST_ZONE_NM,
		AGRDE_SE_CD,
		POPLTN_CNT
	FROM TB_POPLTN
	WHERE ADMINIST_ZONE_NO NOT LIKE '_____00000'
	  AND STD_MT = '202304'
	  AND POPLTN_SE_CD = 'T'
	  AND POPLTN_CNT > 0
), TEMP_AGRDE_RATE AS (
	SELECT
		ADMINIST_ZONE_NO,
		ADMINIST_ZONE_NM,
		AGRDE_SE_CD,
		POPLTN_CNT,
        POPLTN_CNT / SUM(POPLTN_CNT) OVER(PARTITION BY ADMINIST_ZONE_NO) AS "지역별연령대비율"
    FROM TEMP_EMD_POPLTN_CNT
), TEMP_RATE_RANK AS (
	SELECT
		ADMINIST_ZONE_NO,
		ADMINIST_ZONE_NM,
		AGRDE_SE_CD,
		POPLTN_CNT,
        `지역별연령대비율`,
        RANK() OVER(PARTITION BY AGRDE_SE_CD ORDER BY 지역별연령대비율 DESC) AS POPLTN_RATE_RANK
    FROM TEMP_AGRDE_RATE
) SELECT * FROM TEMP_RATE_RANK WHERE POPLTN_RATE_RANK = 1;


-- 2023년 4월 전국의 각 읍/면/동 기준 남성의 수보다 여성의 수가 많은 지역 기준 내림차순
--  TOP 10
WITH TEMP_SE_REDUCE AS (
	SELECT
		ADMINIST_ZONE_NO,
		ADMINIST_ZONE_NM,
		POPLTN_SE_CD,
		SUM(POPLTN_CNT) AS POPLTN_CNT
	FROM TB_POPLTN
	WHERE ADMINIST_ZONE_NO NOT LIKE '_____00000'
	  AND POPLTN_SE_CD IN ('M', 'F')
	  AND STD_MT = '202304'
	  AND POPLTN_CNT > 0
	GROUP BY ADMINIST_ZONE_NO, ADMINIST_ZONE_NM, POPLTN_SE_CD
), TEMP_SE_UNPIVOT AS (
	SELECT
		ADMINIST_ZONE_NO,
        ADMINIST_ZONE_NM,
        IF(POPLTN_SE_CD = 'M', POPLTN_CNT, 0) AS MALE_POPLTN_CNT,
        IF(POPLTN_SE_CD = 'F', POPLTN_CNT, 0) AS FEMALE_POPLTN_CNT
    FROM TEMP_SE_REDUCE
), TEMP_POPLTN_REDUCE AS (
	SELECT
		ADMINIST_ZONE_NO, ADMINIST_ZONE_NM,
        MAX(MALE_POPLTN_CNT) AS MALE_POPLTN_CNT,
        MAX(FEMALE_POPLTN_CNT) AS FEMALE_POPLTN_CNT
    FROM TEMP_SE_UNPIVOT
    GROUP BY ADMINIST_ZONE_NO, ADMINIST_ZONE_NM
)
SELECT 
	ADMINIST_ZONE_NO, ADMINIST_ZONE_NM,
    FEMALE_POPLTN_CNT, MALE_POPLTN_CNT,
    FEMALE_POPLTN_CNT - MALE_POPLTN_CNT AS FEMALE_MALE_DIFF
FROM TEMP_POPLTN_REDUCE
ORDER BY FEMALE_MALE_DIFF DESC
LIMIT 10;

-- 남성/여성 비율이 가장 높은 지역과 가장 낮은 지역 구하기

WITH TEMP_POPLTN_CNT AS (
	SELECT
		ADMINIST_ZONE_NO,
		ADMINIST_ZONE_NM,
		POPLTN_SE_CD,
		SUM(POPLTN_CNT) AS POPLTN_CNT
	FROM TB_POPLTN
	WHERE ADMINIST_ZONE_NO NOT LIKE '_____00000'
	  AND POPLTN_SE_CD IN ('M', 'F')
	  AND STD_MT = '202304'
	  AND POPLTN_CNT > 0
	GROUP BY ADMINIST_ZONE_NO, ADMINIST_ZONE_NM, POPLTN_SE_CD
) , TEMP_SE_UNPIVOT AS (
	SELECT
		ADMINIST_ZONE_NO,
		ADMINIST_ZONE_NM,
		IF(POPLTN_SE_CD = 'M', POPLTN_CNT, 0) AS MALE_POPLTN_CNT,
		IF(POPLTN_SE_CD = 'F', POPLTN_CNT, 0) AS FEMALE_POPLTN_CNT
	FROM TEMP_POPLTN_CNT
), TEMP_POPLTN_REDUCE AS (
	SELECT
		ADMINIST_ZONE_NO, ADMINIST_ZONE_NM,
		MAX(MALE_POPLTN_CNT) AS MALE_POPLTN_CNT,
		MAX(FEMALE_POPLTN_CNT) AS FEMALE_POPLTN_CNT,
		MAX(MALE_POPLTN_CNT) + MAX(FEMALE_POPLTN_CNT) AS TOT_POPLTN_CNT
	FROM TEMP_SE_UNPIVOT
	GROUP BY ADMINIST_ZONE_NO, ADMINIST_ZONE_NM
), TEMP_SE_CNT_RATE AS(
	SELECT
		ADMINIST_ZONE_NO,
		ADMINIST_ZONE_NM,
		MALE_POPLTN_CNT,
		FEMALE_POPLTN_CNT,
		MALE_POPLTN_CNT / TOT_POPLTN_CNT AS "남성인구비율",
		FEMALE_POPLTN_CNT / TOT_POPLTN_CNT AS "여성인구비율",
		RANK() OVER(ORDER BY MALE_POPLTN_CNT / TOT_POPLTN_CNT ASC) AS MALE_RATE_ASC,
		RANK() OVER(ORDER BY FEMALE_POPLTN_CNT / TOT_POPLTN_CNT ASC) AS FEMALE_RATE_ASC,
		RANK() OVER(ORDER BY MALE_POPLTN_CNT / TOT_POPLTN_CNT DESC) AS MALE_RATE_DESC,
		RANK() OVER(ORDER BY FEMALE_POPLTN_CNT / TOT_POPLTN_CNT DESC) AS FEMALE_RATE_DESC
	FROM TEMP_POPLTN_REDUCE
)
SELECT
	ADMINIST_ZONE_NO,
	ADMINIST_ZONE_NM,
	MALE_POPLTN_CNT,
	FEMALE_POPLTN_CNT,
	남성인구비율,
	여성인구비율
FROM TEMP_SE_CNT_RATE
WHERE MALE_RATE_ASC = 1 OR FEMALE_RATE_ASC = 1 OR MALE_RATE_DESC=1 OR FEMALE_RATE_DESC=1;

-- 문제 1: 연령대별 성비 편차가 큰 지역 찾기
-- 2023년 4월 기준 각 읍/면/동에서 연령대별로 남성과 여성의 비율 차이(남성비율 - 여성비율)가 0.1(10%)
-- 이상 나는 연령대가 가장 많은 지역 TOP 5를 찾으시오.


-- STEP 1: 원본 데이터에서 필요한 컬럼만 추출 및 기본 집계
-- 왜 뽑나? 성별(M/F)과 연령대(AGRDE_SE_CD)별로 인구를 집계해야 하기 때문
--        각 지역, 연령대, 성별의 조합마다 몇 명인지 알아야 후속 계산이 가능
WITH TEMP_AGRDE_SE_RATE AS (
    SELECT
        ADMINIST_ZONE_NO,      -- 지역 코드 (연결용)
        ADMINIST_ZONE_NM,      -- 지역명 (최종 결과 출력용)
        AGRDE_SE_CD,           -- 연령대 코드 (연령대별 분석을 위해)
        POPLTN_SE_CD,          -- 성별 코드 M(남)/F(여) (성별 분석을 위해)
        SUM(POPLTN_CNT) AS POPLTN_CNT  -- 같은 조합의 데이터를 모두 합산 (중복제거)
    FROM TB_POPLTN
    WHERE STD_MT = '202304'                    -- 2023년 4월만 필터링
      AND ADMINIST_ZONE_NO NOT LIKE '_____00000'  -- 읍/면/동만 필터링 (시/도 제외)
      AND POPLTN_SE_CD IN ('M', 'F')          -- 남/여 데이터만 (전체 'T' 제외)
    GROUP BY ADMINIST_ZONE_NO, ADMINIST_ZONE_NM, AGRDE_SE_CD, POPLTN_SE_CD
),

-- STEP 2: 같은 지역·연령대의 남성 데이터와 여성 데이터를 가로로 펼치기 (UNPIVOT)
-- 왜 뽑나? 남성 인구와 여성 인구를 비교하려면 같은 행에 있어야 함
--        MALE_CNT와 FEMALE_CNT를 한 행에 놓아야 비율 계산이 가능
TEMP_UNPIVOT AS (
    SELECT
        ADMINIST_ZONE_NO,
        ADMINIST_ZONE_NM,
        AGRDE_SE_CD,
        MAX(IF(POPLTN_SE_CD = 'M', POPLTN_CNT, 0)) AS MALE_CNT,    -- 남성만 추출
        MAX(IF(POPLTN_SE_CD = 'F', POPLTN_CNT, 0)) AS FEMALE_CNT   -- 여성만 추출
    FROM TEMP_AGRDE_SE_RATE
    GROUP BY ADMINIST_ZONE_NO, ADMINIST_ZONE_NM, AGRDE_SE_CD
),

-- STEP 3: 각 연령대별 남성 비율과 여성 비율, 그리고 차이(편차) 계산
-- 왜 뽑나? 절대값(명수)이 아닌 비율로 비교해야 지역 크기 차이의 영향을 제거
--        비율 = 해당 인구 / 전체 인구
--        편차 = |남성비율 - 여성비율|  이것이 0.1 이상인지 판단하기 위해
TEMP_SE_RATE AS (
    SELECT
        ADMINIST_ZONE_NO,
        ADMINIST_ZONE_NM,
        AGRDE_SE_CD,
        MALE_CNT / (MALE_CNT + FEMALE_CNT) AS MALE_RATE,          -- 남성 비율
        FEMALE_CNT / (MALE_CNT + FEMALE_CNT) AS FEMALE_RATE,      -- 여성 비율
        ABS(MALE_CNT / (MALE_CNT + FEMALE_CNT) - FEMALE_CNT / (MALE_CNT + FEMALE_CNT)) AS RATE_DIFF
        -- 남성비율과 여성비율의 차이 계산 (성별 불균형 정도)
    FROM TEMP_UNPIVOT
    WHERE MALE_CNT + FEMALE_CNT > 0  -- 분모가 0이 되는 것 방지
),

-- STEP 4: 각 지역별로 "편차가 0.1(10%) 이상인 연령대의 개수" 카운트
-- 왜 뽑나? 어느 지역의 성별 편차가 가장 심한지 비교하기 위해
--        편차가 큰 연령대가 많을수록 그 지역의 성별 불균형이 심한 것
TEMP_DIFF_CNT AS (
    SELECT
        ADMINIST_ZONE_NO,
        ADMINIST_ZONE_NM,
        COUNT(CASE WHEN RATE_DIFF >= 0.1 THEN 1 END) AS HIGH_DIFF_AGRDE_CNT
        -- 편차가 0.1 이상인 연령대만 카운트
    FROM TEMP_SE_RATE
    GROUP BY ADMINIST_ZONE_NO, ADMINIST_ZONE_NM
)

-- 최종: 성별 편차가 큰 연령대가 많은 지역 TOP 5 출력
SELECT
    ADMINIST_ZONE_NO,
    ADMINIST_ZONE_NM,
    HIGH_DIFF_AGRDE_CNT
FROM TEMP_DIFF_CNT
ORDER BY HIGH_DIFF_AGRDE_CNT DESC
LIMIT 5;

-- 문제 2: 청년층(10~30대) vs 노년층 비율 비교
-- 2023년 4월 기준 각 시/도별로 청년층(010, 020, 030) 인구 비율과 노년층(060, 070, 080, 090, 100) 인구 비율을 구하고,
-- 청년층 비율이 노년층 비율보다 2배 이상 높은 시/도를 찾으시오.

-- STEP 1: 시/도별, 연령대별 인구수 집계
-- 왜 뽑나? 각 시/도의 각 연령대별 정확한 인구 수를 파악해야 함
--        시/도 + 연령대 조합이 기본 단위 (성별은 전체 'T'로 통합)
WITH TEMP_SIDO_AGRDE_CNT AS (
    SELECT
        ADMINIST_ZONE_NO,      -- 시/도 코드
        ADMINIST_ZONE_NM,      -- 시/도명
        AGRDE_SE_CD,           -- 연령대 코드
        SUM(POPLTN_CNT) AS POPLTN_CNT  -- 해당 시/도의 해당 연령대 총 인구
    FROM TB_POPLTN
    WHERE STD_MT = '202304'
      AND ADMINIST_ZONE_NO LIKE '__00000000'  -- 시/도만 필터링 (읍/면/동 제외)
      AND POPLTN_SE_CD = 'T'                  -- 전체 인구 (남/여 분리 X)
    GROUP BY ADMINIST_ZONE_NO, ADMINIST_ZONE_NM, AGRDE_SE_CD
),

-- STEP 2: 청년층과 노년층으로 분류해서 각각 집계
-- 왜 뽑나? "청년층"과 "노년층"을 명확히 정의하고 그룹별 합계를 만들어야 함
--        010, 020, 030을 모두 더한 값 = 청년층 총 인구
--        060, 070, 080, 090, 100을 모두 더한 값 = 노년층 총 인구
--        각각이 얼마나 되는지 알아야 비율 계산이 가능
TEMP_AGE_GROUP_CNT AS (
    SELECT
        ADMINIST_ZONE_NO,
        ADMINIST_ZONE_NM,
        SUM(POPLTN_CNT) AS TOTAL_POPLTN,  -- 모든 연령대 합계 = 시/도 전체 인구
        SUM(CASE WHEN AGRDE_SE_CD IN ('010', '020', '030') THEN POPLTN_CNT ELSE 0 END) AS YOUTH_CNT,
        -- 청년층(10대, 20대, 30대) 합계
        SUM(CASE WHEN AGRDE_SE_CD IN ('060', '070', '080', '090', '100') THEN POPLTN_CNT ELSE 0 END) AS ELDERLY_CNT
        -- 노년층(60대, 70대, 80대, 90대, 100세 이상) 합계
    FROM TEMP_SIDO_AGRDE_CNT
    GROUP BY ADMINIST_ZONE_NO, ADMINIST_ZONE_NM
),

-- STEP 3: 청년층 비율과 노년층 비율 계산
-- 왜 뽑나? 절대값(명수)이 아닌 비율로 비교해야 지역 크기 차이의 영향을 제거
--        청년층 비율 = 청년층 / 전체
--        노년층 비율 = 노년층 / 전체
--        "청년층이 노년층의 2배 이상" 조건을 판단하기 위해
TEMP_AGE_RATE AS (
    SELECT
        ADMINIST_ZONE_NO,
        ADMINIST_ZONE_NM,
        YOUTH_CNT / TOTAL_POPLTN AS YOUTH_RATE,      -- 청년층이 차지하는 비율
        ELDERLY_CNT / TOTAL_POPLTN AS ELDERLY_RATE   -- 노년층이 차지하는 비율
    FROM TEMP_AGE_GROUP_CNT
)

-- 최종: 청년층 비율이 노년층 비율의 2배 이상인 시/도만 출력
SELECT
    ADMINIST_ZONE_NM,
    ROUND(YOUTH_RATE * 100, 2) AS YOUTH_RATE_PCT,          -- 청년층 비율 (%)
    ROUND(ELDERLY_RATE * 100, 2) AS ELDERLY_RATE_PCT,      -- 노년층 비율 (%)
    ROUND(YOUTH_RATE / ELDERLY_RATE, 2) AS "청년층/노년층비율"
FROM TEMP_AGE_RATE
WHERE YOUTH_RATE / ELDERLY_RATE >= 2  -- 청년층이 노년층보다 2배 이상 많은 곳만
ORDER BY YOUTH_RATE / ELDERLY_RATE DESC;



-- 문제 3: 연령대별 집중도 분석
-- 2023년 4월 기준 각 연령대별로 "해당 연령대의 인구수가 전국 연령대별 인구의 집중된 비율 읍/면/동 TOP 3"을 찾으시오
-- 읍면동 연령대 인구 / 전국 연령대 인구별 ==> 비율

-- STEP 1: 전국 각 연령대별 총 인구수 계산
-- 왜 뽑나? "어느 지역에 해당 연령대의 몇 %가 집중되어 있는가"를 계산하려면
--        분자: 해당 지역의 해당 연령대 인구
--        분모: 전국의 해당 연령대 총 인구 ← 이것이 필요

    SELECT
        AGRDE_SE_CD,  -- 연령대 코드 (연결용)
        SUM(POPLTN_CNT) AS AGRDE_TOTAL_CNT  -- 해당 연령대 전국 총 인구
    FROM TB_POPLTN
    WHERE STD_MT = '202304'
      AND POPLTN_SE_CD = 'T'
      AND ADMINIST_ZONE_NO NOT LIKE '_____00000'  -- 읍/면/동만 포함
    GROUP BY AGRDE_SE_CD;
    
    SELECT
        AGRDE_SE_CD,           -- 연령대 코드 (STEP 1과 조인하기 위해)
        ADMINIST_ZONE_NO,      -- 지역 코드
        ADMINIST_ZONE_NM,      -- 지역명
        SUM(POPLTN_CNT) AS EMD_AGRDE_CNT  -- 해당 지역의 해당 연령대 인구
    FROM TB_POPLTN
    WHERE STD_MT = '202304'
      AND POPLTN_SE_CD = 'T'
      AND ADMINIST_ZONE_NO NOT LIKE '_____00000'  -- 읍/면/동만
    GROUP BY AGRDE_SE_CD, ADMINIST_ZONE_NO, ADMINIST_ZONE_NM;

WITH TEMP_AGRDE_TOTAL AS (
    SELECT
        AGRDE_SE_CD,  -- 연령대 코드 (연결용)
        SUM(POPLTN_CNT) AS AGRDE_TOTAL_CNT  -- 해당 연령대 전국 총 인구
    FROM TB_POPLTN
    WHERE STD_MT = '202304'
      AND POPLTN_SE_CD = 'T'
      AND ADMINIST_ZONE_NO NOT LIKE '_____00000'  -- 읍/면/동만 포함
    GROUP BY AGRDE_SE_CD
),

-- STEP 2: 각 읍/면/동별, 연령대별 인구수 집계
-- 왜 뽑나? 각 지역에 특정 연령대가 얼마나 있는지 알아야 함
--        "20대 인구의 80%가 어느 지역에 몰려 있나" 등을 계산하려면
--        각 지역의 20대 인구 수를 필요
TEMP_EMD_AGRDE_CNT AS (
    SELECT
        AGRDE_SE_CD,           -- 연령대 코드 (STEP 1과 조인하기 위해)
        ADMINIST_ZONE_NO,      -- 지역 코드
        ADMINIST_ZONE_NM,      -- 지역명
        SUM(POPLTN_CNT) AS EMD_AGRDE_CNT  -- 해당 지역의 해당 연령대 인구
    FROM TB_POPLTN
    WHERE STD_MT = '202304'
      AND POPLTN_SE_CD = 'T'
      AND ADMINIST_ZONE_NO NOT LIKE '_____00000'  -- 읍/면/동만
    GROUP BY AGRDE_SE_CD, ADMINIST_ZONE_NO, ADMINIST_ZONE_NM
),

-- STEP 3: 집중도(Concentration Rate) 계산 및 연령대별 순위 매기기
-- 왜 뽑나? 각 지역의 집중도를 계산하고, 연령대별로 TOP 3을 찾기 위해 순위를 매겨야 함
--        집중도 = 해당 지역의 해당 연령대 인구 / 전국의 해당 연령대 총 인구
--        예: 서울의 20대 인구 / 전국 20대 인구 = 서울이 전국 20대의 몇 %를 차지하는가
--        RANK() OVER로 각 연령대별로 높은 집중도 순서대로 순위 매김
TEMP_CONCENTRATION AS (
    SELECT
        A.AGRDE_SE_CD,                                    -- 연령대
        B.ADMINIST_ZONE_NO,                               -- 지역 코드
        B.ADMINIST_ZONE_NM,                               -- 지역명
        B.EMD_AGRDE_CNT,                                  -- 해당 지역의 해당 연령대 인구
        A.AGRDE_TOTAL_CNT,                                -- 전국의 해당 연령대 총 인구
        B.EMD_AGRDE_CNT / A.AGRDE_TOTAL_CNT AS CONCENTRATION_RATE,  -- 집중도
        RANK() OVER(PARTITION BY A.AGRDE_SE_CD ORDER BY B.EMD_AGRDE_CNT / A.AGRDE_TOTAL_CNT DESC) AS CONCENTRATION_RANK
        -- 각 연령대별로 집중도 높은 순서대로 순위 매김 (1위, 2위, 3위...)
    FROM TEMP_AGRDE_TOTAL A
    JOIN TEMP_EMD_AGRDE_CNT B ON A.AGRDE_SE_CD = B.AGRDE_SE_CD
)

-- 최종: 각 연령대별 TOP 3 지역만 출력
SELECT
    AGRDE_SE_CD,
    ADMINIST_ZONE_NO,
    ADMINIST_ZONE_NM,
    EMD_AGRDE_CNT,
    ROUND(CONCENTRATION_RATE * 100, 2) AS CONCENTRATION_RATE_PCT  -- 집중도를 %로 표현
FROM TEMP_CONCENTRATION
WHERE CONCENTRATION_RANK <= 3  -- 각 연령대의 상위 3개 지역만
ORDER BY AGRDE_SE_CD, CONCENTRATION_RANK;


-- 문제 4: 10대 vs 60대 비율 비교
-- 2023년 4월 기준 각 읍/면/동별 총 인구수 대비 10대 인구의 비율과 60대 인구의 비율을 구하고,
-- 10대 비율이 60대 비율의 3배 이상인 "청년 집중 지역"을 찾으시오.

-- STEP 1: 각 읍/면/동별, 연령대별 인구수 집계
-- 왜 뽑나? 각 지역에서 10대가 몇 명, 60대가 몇 명인지 알아야 함
--        그리고 각 지역의 총 인구도 필요 (비율 계산용)
WITH TEMP_EMD_POPLTN AS (
    SELECT
        ADMINIST_ZONE_NO,      -- 지역 코드 (연결용)
        ADMINIST_ZONE_NM,      -- 지역명 (최종 결과 출력용)
        AGRDE_SE_CD,           -- 연령대 코드 (010, 060 등 필터링용)
        SUM(POPLTN_CNT) AS POPLTN_CNT  -- 해당 지역의 해당 연령대 인구
    FROM TB_POPLTN
    WHERE STD_MT = '202304'
      AND POPLTN_SE_CD = 'T'
      AND ADMINIST_ZONE_NO NOT LIKE '_____00000'  -- 읍/면/동만
    GROUP BY ADMINIST_ZONE_NO, ADMINIST_ZONE_NM, AGRDE_SE_CD
),

-- STEP 2: 각 지역별 총 인구수 계산 (모든 연령대 합산)
-- 왜 뽑나? 10대 비율 = 10대 인구 / 지역 총 인구
--        60대 비율 = 60대 인구 / 지역 총 인구
--        분모가 필요하므로 각 지역의 총 인구를 미리 계산
TEMP_TOTAL_POPLTN AS (
    SELECT
        ADMINIST_ZONE_NO,      -- 지역 코드 (연결용)
        SUM(POPLTN_CNT) AS TOTAL_POPLTN  -- 해당 지역의 전체 인구 (모든 연령대 합)
    FROM TEMP_EMD_POPLTN
    GROUP BY ADMINIST_ZONE_NO
),

-- STEP 3: 각 지역별 10대와 60대의 비율 계산
-- 왜 뽑나? 절대값(명수)이 아닌 비율로 비교해야 함
--        지역 크기가 작은 곳과 큰 곳을 공정하게 비교하려면 비율이 필수
--        10대 비율 = 10대 / 전체
--        60대 비율 = 60대 / 전체
--        비율 비교 = 10대 비율 / 60대 비율
TEMP_AGE_RATE AS (
    SELECT
        A.ADMINIST_ZONE_NO,
        A.ADMINIST_ZONE_NM,
        B.TOTAL_POPLTN,
        MAX(IF(A.AGRDE_SE_CD = '010', A.POPLTN_CNT, 0)) / B.TOTAL_POPLTN AS TEEN_RATE,      -- 10대 비율
        MAX(IF(A.AGRDE_SE_CD = '060', A.POPLTN_CNT, 0)) / B.TOTAL_POPLTN AS SIXTIES_RATE   -- 60대 비율
    FROM TEMP_EMD_POPLTN A
    JOIN TEMP_TOTAL_POPLTN B ON A.ADMINIST_ZONE_NO = B.ADMINIST_ZONE_NO
    GROUP BY A.ADMINIST_ZONE_NO, A.ADMINIST_ZONE_NM, B.TOTAL_POPLTN
)

-- 최종: 10대 비율이 60대 비율의 3배 이상인 "청년 집중 지역" 출력
SELECT
    ADMINIST_ZONE_NO,
    ADMINIST_ZONE_NM,
    ROUND(TEEN_RATE * 100, 2) AS TEEN_RATE_PCT,            -- 10대가 전체의 몇 %
    ROUND(SIXTIES_RATE * 100, 2) AS SIXTIES_RATE_PCT,      -- 60대가 전체의 몇 %
    ROUND(TEEN_RATE / SIXTIES_RATE, 2) AS "10대/60대비율"  -- 10대와 60대의 비율 관계
FROM TEMP_AGE_RATE
WHERE SIXTIES_RATE > 0 AND TEEN_RATE / SIXTIES_RATE >= 3  -- 10대가 60대보다 3배 이상 많은 곳만
ORDER BY TEEN_RATE / SIXTIES_RATE DESC
LIMIT 10;

-- 문제 5: 성별 불균형 분석
-- 2023년 4월 기준 각 읍/면/동에서 "남성이 여성보다 50% 이상 많은 연령대" 또는
-- "여성이 남성보다 50% 이상 많은 연령대"가 가장 많은 지역 TOP 10을 찾으시오.

-- STEP 1: 각 읍/면/동별, 연령대별, 성별 인구수 집계
-- 왜 뽑나? 각 지역·연령대마다 남성과 여성의 정확한 인구를 알아야 함
--        같은 지역·연령대의 남/여 데이터를 분리해서 비교하기 위해
WITH TEMP_AGRDE_SE_CNT AS (
    SELECT
        ADMINIST_ZONE_NO,      -- 지역 코드
        ADMINIST_ZONE_NM,      -- 지역명
        AGRDE_SE_CD,           -- 연령대 코드
        POPLTN_SE_CD,          -- 성별 코드 (M 또는 F)
        SUM(POPLTN_CNT) AS POPLTN_CNT  -- 해당 조합의 총 인구
    FROM TB_POPLTN
    WHERE STD_MT = '202304'
      AND ADMINIST_ZONE_NO NOT LIKE '_____00000'  -- 읍/면/동만
      AND POPLTN_SE_CD IN ('M', 'F')              -- 남/여만 (전체 제외)
    GROUP BY ADMINIST_ZONE_NO, ADMINIST_ZONE_NM, AGRDE_SE_CD, POPLTN_SE_CD
),

-- STEP 2: 같은 지역·연령대의 남성 데이터와 여성 데이터를 한 행에 펼치기 (UNPIVOT)
-- 왜 뽑나? 남성과 여성의 인구를 비교하려면 한 행에 있어야 함
--        "남성이 여성보다 50% 이상 많은가?"를 판단하려면
--        MALE_CNT와 FEMALE_CNT가 같은 행에 있어야 계산 가능
TEMP_UNPIVOT AS (
    SELECT
        ADMINIST_ZONE_NO,
        ADMINIST_ZONE_NM,
        AGRDE_SE_CD,
        MAX(IF(POPLTN_SE_CD = 'M', POPLTN_CNT, 0)) AS MALE_CNT,     -- 남성만 추출
        MAX(IF(POPLTN_SE_CD = 'F', POPLTN_CNT, 0)) AS FEMALE_CNT    -- 여성만 추출
    FROM TEMP_AGRDE_SE_CNT
    GROUP BY ADMINIST_ZONE_NO, ADMINIST_ZONE_NM, AGRDE_SE_CD
),

-- STEP 3: 성별 불균형 유형 분류
-- 왜 뽑나? "남성이 여성보다 50% 이상 많다" 또는 "여성이 남성보다 50% 이상 많다"
--        이 조건을 판단하고 IMBALANCE_TYPE으로 분류해야 함
--        비교 공식:
--          - 남성이 50% 이상 많다 = 남성 / 여성 >= 1.5
--          - 여성이 50% 이상 많다 = 여성 / 남성 >= 1.5
TEMP_IMBALANCE AS (
    SELECT
        ADMINIST_ZONE_NO,
        ADMINIST_ZONE_NM,
        AGRDE_SE_CD,
        CASE 
            WHEN MALE_CNT > FEMALE_CNT AND MALE_CNT / FEMALE_CNT >= 1.5 THEN '남성초과'
            -- 남성이 여성의 1.5배 이상 많으면 "남성초과"
            WHEN FEMALE_CNT > MALE_CNT AND FEMALE_CNT / MALE_CNT >= 1.5 THEN '여성초과'
            -- 여성이 남성의 1.5배 이상 많으면 "여성초과"
            ELSE 'NORMAL'  -- 그 외에는 "정상" (균형잡힘)
        END AS IMBALANCE_TYPE
    FROM TEMP_UNPIVOT
    WHERE MALE_CNT + FEMALE_CNT > 0  -- 데이터가 없는 연령대는 제외
),

-- STEP 4: 각 지역별로 "성별 불균형이 있는 연령대의 개수" 카운트
-- 왜 뽑나? 어느 지역의 성별 불균형이 가장 심한지 비교하기 위해
--        불균형이 있는 연령대가 많을수록 그 지역의 성별 편차가 큼
TEMP_IMBALANCE_CNT AS (
    SELECT
        ADMINIST_ZONE_NO,
        ADMINIST_ZONE_NM,
        COUNT(CASE WHEN IMBALANCE_TYPE != 'NORMAL' THEN 1 END) AS IMBALANCE_AGRDE_CNT
        -- IMBALANCE_TYPE이 '남성초과' 또는 '여성초과'인 연령대만 카운트
    FROM TEMP_IMBALANCE
    GROUP BY ADMINIST_ZONE_NO, ADMINIST_ZONE_NM
)

-- 최종: 성별 불균형 연령대가 많은 지역 TOP 10 출력
SELECT
    ADMINIST_ZONE_NO,
    ADMINIST_ZONE_NM,
    IMBALANCE_AGRDE_CNT  -- 성별 불균형이 있는 연령대 개수
FROM TEMP_IMBALANCE_CNT
WHERE IMBALANCE_AGRDE_CNT > 0  -- 불균형이 있는 지역만
ORDER BY IMBALANCE_AGRDE_CNT DESC
LIMIT 10;
