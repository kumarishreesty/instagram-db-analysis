-- Objective Question 
-- 12

WITH hashtag_likes AS
(
    SELECT
        t.id,
        t.tag_name,
        AVG(like_count.total_likes) AS avg_likes
    FROM tags t
    JOIN photo_tags pt
        ON t.id = pt.tag_id
    JOIN
    (
        SELECT
            photo_id,
            COUNT(*) AS total_likes
        FROM likes
        GROUP BY photo_id
    ) AS like_count
        ON pt.photo_id = like_count.photo_id
    GROUP BY t.id, t.tag_name
)

SELECT *
FROM hashtag_likes
ORDER BY avg_likes DESC;