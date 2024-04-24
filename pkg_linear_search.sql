CREATE OR REPLACE PACKAGE pkg_linear_search IS
    FUNCTION linear_search(
        i_value IN pkg_definitions.elementas,
        i_unsorted_arr IN pkg_definitions.arr_type
    ) RETURN pkg_definitions.search_result_type;
END pkg_linear_search;
