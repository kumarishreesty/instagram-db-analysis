USE ig_clone;

-- Objective Question 
-- 1

-- Check duplicate usernames

SELECT
    username,
    COUNT(*) AS duplicate_count
FROM users
GROUP BY username
HAVING COUNT(*) > 1;

-- Check NULL values in Users

SELECT *
FROM users
WHERE username IS NULL;

-- Check NULL values in Photos

SELECT *
FROM photos
WHERE image_url IS NULL
   OR user_id IS NULL;

-- Check NULL values in Comments

SELECT *
FROM comments
WHERE comment_text IS NULL
   OR user_id IS NULL
   OR photo_id IS NULL;

-- Check NULL values in Likes

SELECT *
FROM likes
WHERE user_id IS NULL
   OR photo_id IS NULL;

-- Check NULL values in Follows

SELECT *
FROM follows
WHERE follower_id IS NULL
   OR followee_id IS NULL;

-- Check NULL values in Tags

SELECT *
FROM tags
WHERE tag_name IS NULL;

-- Check NULL values in Photo_Tags

SELECT *
FROM photo_tags
WHERE photo_id IS NULL
   OR tag_id IS NULL;
















