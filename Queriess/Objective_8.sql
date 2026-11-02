-- Objective Question 
-- 8
SELECT
    t.id,
    t.tag_name,
    COUNT(pt.photo_id) AS total_posts_using_tag
FROM tags t
JOIN photo_tags pt
    ON t.id = pt.tag_id
GROUP BY t.id, t.tag_name
ORDER BY total_posts_using_tag DESC
Limit 10;