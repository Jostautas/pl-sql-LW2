SET SERVEROUTPUT ON;
DECLARE
    l_array1 pkg_definitions.arr_type := pkg_definitions.arr_type(1, 2, 3);
    l_value pkg_definitions.elementas := 4;
    l_search_result pkg_definitions.search_result_type;
BEGIN
    -- SUCCESS:
     binary_and_linear_search_evaluation.print_everything(10);
    
   
    -- USER DEFINED ERRORS:
    -- binary_and_linear_search_evaluation.print_everything(-10);        -- 20001 negative array size
    -- l_search_result := pkg_linear_search.linear_search(l_value, l_array1);  -- 20002 arrays do not match
     -- binary_and_linear_search_evaluation.print_everything(101);         -- 20003 too_many_numbers
    
    -- PRE-DEFINED ERRORS:
    -- (0)          ORA-01476 divisor is equal to zero (linear_and_binary_search_evaluation_body)
    --              NO_DATA_FOUND (pkg_exceptions_body)
    --              TOO_MANY_ROWS (pkg_exceptions_body)
    
    -- ()           PLS-00306 wrong number or types of arguments
    -- ('abc')      ORA-06502 character to number conversion error
    -- (10000000000000000000000000000000000000000000000000000000000)           ORA-06502 number precision too large
    -- (variable)   PLS-00201 identifier 'VARIABLE' must be declared

END;
