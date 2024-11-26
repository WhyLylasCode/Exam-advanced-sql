-- Ajout d’un index sur la colonne created_at pour accélérer le filtrage
CREATE INDEX idx_posts_created_at ON posts (created_at);

SELECT p.post_id, p.content, u.username
FROM posts p
JOIN users u ON p.user_id = u.user_id
WHERE p.created_at >= NOW() - INTERVAL '7 days'
ORDER BY p.created_at DESC;

-- Utilisation de explain
EXPLAIN ANALYZE 
SELECT p.post_id, p.content, u.username
FROM posts p
JOIN users u ON p.user_id = u.user_id
WHERE p.created_at >= NOW() - INTERVAL '7 days'
ORDER BY p.created_at DESC;
