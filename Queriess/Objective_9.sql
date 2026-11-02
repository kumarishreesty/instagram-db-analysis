-- Objective Question 
-- 9
WITH photo_stats AS
(
    SELECT
        p.id AS photo_id,
        u.username,
        COUNT(DISTINCT l.user_id) AS total_likes,
        COUNT(DISTINCT c.id) AS total_comments,
        COUNT(DISTINCT pt.tag_id) AS total_tags
    FROM photos p
    JOIN users u
        ON p.user_id = u.id
    LEFT JOIN likes l
        ON p.id = l.photo_id
    LEFT JOIN comments c
        ON p.id = c.photo_id
    LEFT JOIN photo_tags pt
        ON p.id = pt.photo_id
    GROUP BY p.id, u.username
)

SELECT *,
       (total_likes + total_comments + total_tags) AS total_engagement
FROM photo_stats
ORDER BY total_engagement DESC;