DELIMITER //
CREATE PROCEDURE prime()
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE j INT DEFAULT 1;
    DECLARE counts INT DEFAULT 0;
    DECLARE strings VARCHAR(1000) DEFAULT '';

    WHILE i < 1000 DO
        SET j = 1;
        SET counts = 0;
        
        WHILE j < i DO
            IF i % j = 0 THEN
                SET counts = counts + 1;
            END IF;
            SET j = j + 1;
        END WHILE;
        
        IF counts = 1 THEN
            SET strings = CONCAT(strings, i, '&');
        END IF;
        
        SET i = i + 1;
    END WHILE;

    SELECT SUBSTRING(strings, 1, LENGTH(strings) - 1);
END //
DELIMITER;

CALL prime();
