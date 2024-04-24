CREATE OR REPLACE PACKAGE BODY pkg_linear_search IS
    FUNCTION linear_search(
        i_value IN pkg_definitions.elementas,
        i_unsorted_arr IN pkg_definitions.arr_type
    ) RETURN pkg_definitions.search_result_type IS
        f_result pkg_definitions.search_result_type;
        f_steps pkg_definitions.elementas;
        found BOOLEAN;
    BEGIN
        f_result.searched_element := -1;
            f_steps := 0;
            found := FALSE;
            FOR j IN 1 .. i_unsorted_arr.COUNT LOOP
                f_steps := f_steps + 1;
                CASE
                    WHEN i_value = i_unsorted_arr(j) THEN
                        f_result.searched_element := i_value;
                        f_result.steps_count := f_steps;
                        return f_result;
                    ELSE
                        NULL;
                END CASE;
        END LOOP;
        IF f_result.searched_element = -1 THEN
                    dbms_output.put_line('ERROR: arrays do not match');
                    RAISE pkg_exceptions.arrays_do_not_match;
                END IF;
        
        RETURN f_result;
    EXCEPTION
    WHEN pkg_exceptions.arrays_do_not_match THEN
        pkg_exceptions.process_error;

    END linear_search;
END pkg_linear_search;
