 -- Subjective Question
-- 1
WITH engagement AS
(
    SELECT
        u.id,
        u.username,
        COUNT(DISTINCT l.user_id) AS total_likes,
        COUNT(DISTINCT c.id) AS total_comments
    FROM users u
    JOIN photos p
        ON u.id = p.user_id
    LEFT JOIN likes l
        ON p.id = l.photo_id
    LEFT JOIN comments c
        ON p.id = c.photo_id
    GROUP BY u.id, u.username
)

SELECT *,
       (total_likes + total_comments) AS total_engagement,
       DENSE_RANK() OVER (
           ORDER BY (total_likes + total_comments) DESC
       ) AS engagement_rank
FROM engagement
ORDER BY engagement_rank;