USE data_scientist_project;

--  Calculating the number of students who watched a lecture in Q2 2021
SELECT 
    COUNT(DISTINCT student_id)
FROM
    student_video_watched
WHERE
    YEAR(date_watched) = 2021;
    
    
    
-- Calculating the number of students who watched a lecture in Q2 2022
SELECT 
    COUNT(DISTINCT student_id)
FROM
    student_video_watched
WHERE
    YEAR(date_watched) = 2022;
    
    
    
-- Calculating the number of students who watched a lecture in Q2 2021 and Q2 2022
SELECT 
    COUNT(DISTINCT student_id)
FROM
    (SELECT DISTINCT
        student_id
    FROM
        student_video_watched
    WHERE
        YEAR(date_watched) = 2021) a JOIN (SELECT DISTINCT
        student_id
    FROM
        student_video_watched
    WHERE
        YEAR(date_watched) = 2022) b USING (student_id);
        
        
        
-- Calculating the total number of students who watched a lecture
SELECT 
    COUNT(DISTINCT student_id)
FROM
    student_video_watched;