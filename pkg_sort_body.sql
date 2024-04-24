CREATE OR REPLACE PACKAGE BODY pkg_sort IS
    FUNCTION sort_array(i_arr IN pkg_definitions.arr_type) RETURN pkg_definitions.arr_type IS
        l_sorted_arr pkg_definitions.arr_type := pkg_definitions.arr_type();
        l_temp pkg_definitions.elementas;
    BEGIN
        l_sorted_arr := i_arr;

        FOR i IN 2 .. l_sorted_arr.COUNT LOOP
            l_temp := l_sorted_arr(i);
            DECLARE
            j pkg_definitions.elementas := i - 1;
            BEGIN
                WHILE j > 0 AND l_sorted_arr(j) > l_temp LOOP
                    l_sorted_arr(j + 1) := l_sorted_arr(j);
                    j := j - 1;
                END LOOP;
                l_sorted_arr(j + 1) := l_temp;
            END;
        END LOOP;

        RETURN l_sorted_arr;
    END sort_array;
END pkg_sort;
