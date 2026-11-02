-- Objective Question 
-- 5

SELECT
    u.id,
    u.username,
    COUNT(DISTINCT f1.follower_id) AS total_followers,
    COUNT(DISTINCT f2.followee_id) AS total_following
FROM users u
LEFT JOIN follows f1
ON u.id = f1.followee_id
LEFT JOIN follows f2
ON u.id = f2.follower_id
GROUP BY u.id, u.username
ORDER BY total_followers DESC, total_following DESC;