CREATE OR REPLACE PACKAGE pkg_exceptions IS
    negative_array_size EXCEPTION;
    arrays_do_not_match EXCEPTION;
    too_many_numbers    EXCEPTION;
    
    PRAGMA EXCEPTION_INIT (negative_array_size, -20001);
    PRAGMA EXCEPTION_INIT (arrays_do_not_match, -20002);
    PRAGMA EXCEPTION_INIT (too_many_numbers,    -20003);
    
    PROCEDURE process_error;
    FUNCTION get_error_message(err_code IN VARCHAR2) RETURN VARCHAR2;
END pkg_exceptions;
