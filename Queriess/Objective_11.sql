-- Objective Question 
-- 11

SELECT
    u.id,
    u.username,
    COUNT(DISTINCT l.user_id) AS total_likes,
    COUNT(DISTINCT c.id) AS total_comments,
    (COUNT(DISTINCT l.user_id) + COUNT(DISTINCT c.id)) AS total_engagement
FROM users u
JOIN photos p
    ON u.id = p.user_id
LEFT JOIN likes l
    ON p.id = l.photo_id
LEFT JOIN comments c
    ON p.id = c.photo_id
GROUP BY
    u.id,
    u.username
ORDER BY
    total_engagement DESC;