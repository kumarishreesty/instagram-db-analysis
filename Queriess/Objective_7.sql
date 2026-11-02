-- Objective Question 
-- 7

SELECT
    u.id,
    u.username
FROM users u
LEFT JOIN likes l
    ON u.id = l.user_id
WHERE l.user_id IS NULL;