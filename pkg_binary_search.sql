CREATE OR REPLACE PACKAGE pkg_binary_search IS
    FUNCTION binary_search(
        i_value IN pkg_definitions.elementas,
        i_arr IN pkg_definitions.arr_type
    ) RETURN pkg_definitions.search_result_type;
END pkg_binary_search;
