DROP TABLE error_logs;
CREATE TABLE error_logs (
    log_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    error_code VARCHAR2(20),
    error_message VARCHAR2(4000),
    backtrace CLOB,
    user_name VARCHAR2(100),
    timestamp DATE
);