CREATE OR REPLACE PACKAGE pkg_definitions IS
    subtype elementas IS NUMBER(3);
    TYPE arr_type IS TABLE OF elementas;
    TYPE search_result_type IS RECORD (
        searched_element elementas,
        steps_count elementas
    );
    TYPE result_arr_type IS TABLE OF search_result_type INDEX BY PLS_INTEGER;
END pkg_definitions;