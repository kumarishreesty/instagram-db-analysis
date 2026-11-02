-- Objective Question 
-- 2
SELECT
    u.id,
    u.username,
    COUNT(DISTINCT p.id) AS total_posts,
    COUNT(DISTINCT l.photo_id) AS total_likes,
    COUNT(DISTINCT c.id) AS total_comments
FROM users u
LEFT JOIN photos p
    ON u.id = p.user_id
LEFT JOIN likes l
    ON u.id = l.user_id
LEFT JOIN comments c
    ON u.id = c.user_id
GROUP BY u.id, u.username
HAVING COUNT(DISTINCT p.id) > 1
ORDER BY
(
    COUNT(DISTINCT p.id)
    + COUNT(DISTINCT l.photo_id)
    + COUNT(DISTINCT c.id)
) DESC 
LIMIT 10;







