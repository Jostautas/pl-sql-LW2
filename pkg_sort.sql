CREATE OR REPLACE PACKAGE pkg_sort IS
    FUNCTION sort_array(i_arr IN pkg_definitions.arr_type) RETURN pkg_definitions.arr_type;
END pkg_sort;
