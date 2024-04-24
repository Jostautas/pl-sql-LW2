CREATE OR REPLACE PACKAGE BODY pkg_binary_search IS
    FUNCTION binary_search(
        i_value IN pkg_definitions.elementas,
        i_arr IN pkg_definitions.arr_type
    ) RETURN pkg_definitions.search_result_type IS
        f_low pkg_definitions.elementas := 1;
        f_high pkg_definitions.elementas := i_arr.COUNT;
        f_mid pkg_definitions.elementas;
        f_steps pkg_definitions.elementas := 0;
        f_result pkg_definitions.search_result_type;
    BEGIN
        WHILE f_low <= f_high LOOP
            f_steps := f_steps + 1;
            f_mid := TRUNC((f_low + f_high) / 2);
            
            IF i_arr(f_mid) = i_value THEN
                f_result.searched_element := i_value;
                f_result.steps_count := f_steps;
                RETURN f_result;
            ELSIF i_arr(f_mid) < i_value THEN
                f_low := f_mid + 1;
            ELSE
                f_high := f_mid - 1;
            END IF;
        END LOOP;
        
        f_result.searched_element := i_value;
        f_result.steps_count := f_steps;
        RETURN f_result;
    END binary_search;
END pkg_binary_search;
