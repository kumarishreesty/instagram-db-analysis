-- Objective Question 
-- 3

SELECT AVG(total_tags) AS avg_tags_per_post
FROM
(
    SELECT
        p.id,
        COUNT(pt.tag_id) AS total_tags
    FROM photos p
    LEFT JOIN photo_tags pt
    ON p.id = pt.photo_id
    GROUP BY p.id
) AS tag_count;