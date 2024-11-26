SELECT 
    u.username,
    COUNT(l.like_id) AS total_likes,
    RANK() OVER (ORDER BY COUNT(l.like_id) DESC) AS rank
FROM posts p
JOIN likes l ON p.post_id = l.post_id
JOIN users u ON p.user_id = u.user_id
GROUP BY u.username
ORDER BY rank
LIMIT 3;
