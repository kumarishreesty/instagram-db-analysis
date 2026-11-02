-- Objective Question 
-- 13

SELECT
    u1.id AS user_id,
    u1.username AS user_name,
    u2.id AS followed_user_id,
    u2.username AS followed_user_name
FROM follows f1
JOIN follows f2
    ON f1.follower_id = f2.followee_id
   AND f1.followee_id = f2.follower_id      
JOIN users u1
    ON f1.follower_id = u1.id
JOIN users u2
    ON f1.followee_id = u2.id
WHERE u1.id < u2.id;