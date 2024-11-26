WITH user_posts AS (
    SELECT 
        p.user_id AS post_owner_id, 
        c.comment_id, 
        c.user_id AS commenter_id, 
        c.post_id
    FROM posts p
    inner join comments c ON p.post_id = c.post_id
)
SELECT 
    u.username, 
    up.post_id, 
    up.comment_id
FROM user_posts up
inner join users u ON u.user_id = up.commenter_id
WHERE up.post_owner_id = up.commenter_id;
