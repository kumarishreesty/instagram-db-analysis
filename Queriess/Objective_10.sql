-- Objective Question 
-- 10


SELECT
    u.id,
    u.username,
    COUNT(DISTINCT l.user_id) AS total_likes,
    COUNT(DISTINCT c.id) AS total_comments,
    COUNT(DISTINCT pt.tag_id) AS total_photo_tags
FROM users u
LEFT JOIN photos p
    ON u.id = p.user_id
LEFT JOIN likes l
    ON p.id = l.photo_id
LEFT JOIN comments c
    ON p.id = c.photo_id
LEFT JOIN photo_tags pt
    ON p.id = pt.photo_id
GROUP BY
    u.id,
    u.username
ORDER BY
    (
        COUNT(DISTINCT l.user_id)
        + COUNT(DISTINCT c.id)
        + COUNT(DISTINCT pt.tag_id)
    ) DESC;