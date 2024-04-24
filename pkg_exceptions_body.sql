CREATE OR REPLACE PACKAGE BODY pkg_exceptions IS
    PROCEDURE process_error IS
        l_error_code VARCHAR2(20) := TO_CHAR(SQLCODE);
        l_err_msg VARCHAR2(4000) := get_error_message(l_error_code);
        l_backtrace VARCHAR2(4000) := DBMS_UTILITY.format_error_backtrace;
        l_user VARCHAR2(100) := USER;
        l_timestamp VARCHAR2(20) := TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS');
        
        PRAGMA AUTONOMOUS_TRANSACTION;
        BEGIN
            DBMS_OUTPUT.PUT_LINE('Error Code: ' || l_error_code);
            DBMS_OUTPUT.PUT_LINE('Error Message: ' || l_err_msg);
            DBMS_OUTPUT.PUT_LINE('Error Backtrace: ' || SUBSTR(l_backtrace, 1, 4000)); -- Displaying a part of the backtrace
            DBMS_OUTPUT.PUT_LINE('User: ' || l_user);
            DBMS_OUTPUT.PUT_LINE('Timestamp: ' || l_timestamp);
            INSERT INTO error_logs (
                error_code, error_message, backtrace, user_name, timestamp
                ) VALUES (
                    l_error_code, l_err_msg, l_backtrace, l_user, TO_DATE(l_timestamp, 'YYYY-MM-DD HH24:MI:SS')
                    );
            COMMIT;
            EXCEPTION WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('Failed to log error: ' || SQLERRM);
                ROLLBACK;
                RAISE;
        END process_error;
        
    FUNCTION get_error_message(err_code IN VARCHAR2) RETURN VARCHAR2 IS
        retrieved_message VARCHAR2(4000);
        l_sys_message error_messages.error_message%TYPE;
        BEGIN
            l_sys_message := SQLERRM(err_code);
            SELECT error_message INTO retrieved_message
            FROM error_messages
            WHERE error_code = err_code;
            RETURN retrieved_message;
            
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                pkg_exceptions.process_error;
                RETURN l_sys_message;
                
            WHEN TOO_MANY_ROWS THEN
                pkg_exceptions.process_error;
                RETURN l_sys_message;
            
        END get_error_message;
        
END pkg_exceptions;
