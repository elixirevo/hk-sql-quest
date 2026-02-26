-- 문제 2: 청년층(20~40대) vs 노년층 비율 비교
-- 2023년 4월 기준 각 시/도별로 청년층(010, 020, 030) 인구 비율과 노년층(060, 070, 080, 090, 100) 인구 비율을 구하고,
-- 청년층 비율이 노년층 비율보다 2배 이상 높은 시/도를 찾으시오.

SELECT
  ADMINIST_ZONE_NO,
  ADMINIST_ZONE_NM,
  청년층인구,
  노년층인구,
  전체인구,
  청년층인구 / NULLIF(전체인구, 0) AS 청년층비율,
  노년층인구 / NULLIF(전체인구, 0) AS 노년층비율
FROM (
  SELECT
    ADMINIST_ZONE_NO,
    ADMINIST_ZONE_NM,
    SUM(CASE WHEN AGRDE_SE_CD IN ('010','020','030') THEN POPLTN_CNT ELSE 0 END) AS 청년층인구,
    SUM(CASE WHEN AGRDE_SE_CD IN ('060','070','080','090','100') THEN POPLTN_CNT ELSE 0 END) AS 노년층인구,
    SUM(POPLTN_CNT) AS 전체인구
  FROM TB_POPLTN
  WHERE STD_MT = '202304'
    AND POPLTN_SE_CD = 'T'
    AND ADMINIST_ZONE_NO LIKE '__00000000'   
  GROUP BY ADMINIST_ZONE_NO, ADMINIST_ZONE_NM
) dd
WHERE 전체인구>0
	AND 청년층인구>=2*노년층인구
ORDER BY 청년층비율 DESC;





