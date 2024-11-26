SELECT 
    user_id,
    CASE 
        WHEN content_type IS NULL THEN 'Total'
        ELSE content_type
    END AS content_type,
    COUNT(*) AS total_count
FROM (
    SELECT user_id, 'Post' AS content_type FROM posts
    union all 
    SELECT user_id, 'Comment' AS content_type FROM comments
) c
GROUP BY ROLLUP (user_id, content_type)
ORDER BY user_id, content_type;
