-- Subjective Question
-- 2

SELECT
    u.id,
    u.username
FROM users u
LEFT JOIN photos p
    ON u.id = p.user_id
WHERE p.id IS NULL;