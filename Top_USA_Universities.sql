#Exploracion Inicial del Dataset 
SELECT * 
FROM us_top_50_universities_2026;

#Numero de Universidades publicas y privadas
SELECT institution_type,COUNT (*) AS Total
FROM us_top_50_universities_2026
GROUP BY institution_type;

#Universidades con mayor tasa de empleo
SELECT university_name ,employment_rate
FROM us_top_50_universities_2026
ORDER BY employment_rate DESC
LIMIT 10;

#Universidades con menor tasa dentro del ranking
SELECT university_name ,employment_rate
FROM us_top_50_universities_2026
ORDER BY employment_rate ASC
LIMIT 10;

#Estados con mayor numero de Universidades
SELECT state,COUNT(*) AS Total_Universities
FROM us_top_50_universities_2026
GROUP BY state
ORDER BY Total_universities DESC
LIMIT 10;

#Universidades con mayor impacto en investigacion
SELECT university_name,research_impact_score
FROM us_top_50_universities_2026
ORDER BY research_impact_score DESC
LIMIT 10;

#Universidades con mayor numero de estudiantes.
SELECT university_name,intl_student_ratio
FROM us_top_50_universities_2026
ORDER BY intl_student_ratio DESC
LIMIT 10;

#Diferencia en la empleabilidad entre Universidades privadas y publicas.
SELECT institution_type, AVG(employment_rate) AS avg_employment_rate
FROM us_top_50_universities_2026
GROUP  BY institution_type 
LIMIT 10;

#Universidades que  presentan alto impacto en investigación pero una empleabilidad menor al promedio
SELECT university_name,research_impact_score,employment_rate
FROM us_top_50_universities_2026
WHERE research_impact_score > 95 
AND  employment_rate < (
SELECT AVG(employment_rate)
FROM us_top_50_universities_2026);

#Universidades que combinan alta empleabilidad y alto impacto de investigacion.
SELECT university_name,research_impact_score,employment_rate
FROM us_top_50_universities_2026
WHERE employment_rate > (
SELECT AVG(employment_rate)
FROM us_top_50_universities_2026)
AND research_impact_score > (SELECT AVG (research_impact_score)
FROM us_top_50_universities_2026)
ORDER BY research_impact_score  DESC ;