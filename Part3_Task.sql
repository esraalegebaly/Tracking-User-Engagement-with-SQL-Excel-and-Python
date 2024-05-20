USE data_scientist_project;

SELECT 
    a.student_id,
    IF(w.seconds_watched IS NULL,
        0,
        ROUND(SUM(seconds_watched) / 60, 2)) AS minutes_watched,
    a.certificates_issued
FROM
    (SELECT 
        student_id, 
        COUNT(certificate_id) AS certificates_issued
    FROM
        student_certificates
    GROUP BY student_id) a
        LEFT JOIN
    student_video_watched w ON a.student_id = w.student_id
GROUP BY student_id;