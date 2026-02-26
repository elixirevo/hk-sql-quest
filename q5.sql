-- 문제 5: 성별 불균형 분석
-- 2023년 4월 기준 각 읍/면/동에서 "남성이 여성보다 50% 이상 많은 연령대" 또는
-- "여성이 남성보다 50% 이상 많은 연령대"가 가장 많은 지역 TOP 10을 찾으시오. (인구수)

WITH GENDER_GENERATION_POP AS (
    SELECT
        ADMINIST_ZONE_NO
        , ADMINIST_ZONE_NM
        , AGRDE_SE_CD
        , SUM(CASE WHEN POPLTN_SE_CD = 'M' THEN POPLTN_CNT ELSE 0 END) AS MALE_POP
        , SUM(CASE WHEN POPLTN_SE_CD = 'F' THEN POPLTN_CNT ELSE 0 END) AS FEMALE_POP
    FROM TB_POPLTN
    WHERE
        STD_MT = '202304'
        AND ADMINIST_ZONE_NO NOT LIKE '_____00000'
        AND POPLTN_SE_CD IN ('M', 'F')
    GROUP BY
        ADMINIST_ZONE_NO
        , ADMINIST_ZONE_NM
        , AGRDE_SE_CD
)
, CALC_POP AS (
    SELECT
        ADMINIST_ZONE_NO
        , ADMINIST_ZONE_NM
        , AGRDE_SE_CD
        , MALE_POP
        , FEMALE_POP
        , ABS(FEMALE_POP - MALE_POP) AS TOTAL_DIFF
    FROM
        GENDER_GENERATION_POP
    WHERE
        MALE_POP / FEMALE_POP >= 1.5
        OR FEMALE_POP / MALE_POP >= 1.5
)
SELECT *
FROM CALC_POP
ORDER BY
    TOTAL_DIFF DESC
LIMIT 10;