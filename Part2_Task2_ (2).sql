USE data_scientist_project;

SELECT 
    student_id,
    ROUND(SUM(seconds_watched) / 60, 2) AS minutes_watched
FROM
    student_video_watched
WHERE
    YEAR(date_watched) = 2021
GROUP BY student_id;