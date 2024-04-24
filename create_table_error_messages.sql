DROP TABLE error_messages;
CREATE TABLE error_messages (
    error_code VARCHAR2(20) PRIMARY KEY,
    error_message VARCHAR2(4000)
);
INSERT INTO error_messages (error_code, error_message) VALUES ('-20001', 'negative input array size');
INSERT INTO error_messages (error_code, error_message) VALUES ('-20002', 'arrays do not match');
INSERT INTO error_messages (error_code, error_message) VALUES ('-20003', 'why do you need so many numbers???');
COMMIT;
