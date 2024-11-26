CREATE TABLE notifications (
    notification_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    message TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE OR REPLACE FUNCTION notify_user() 
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO notifications (user_id, message) 
    VALUES (
        NEW.tagged_user_id, 
        CONCAT('Vous avez ete tague par : ', NEW.tagged_by_user_id)
    );
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER after_user_tag
AFTER INSERT ON user_tags
FOR EACH ROW
EXECUTE FUNCTION notify_user();


