CREATE OR REPLACE PACKAGE BODY binary_and_linear_search_evaluation IS

    PROCEDURE print_everything(
        number_of_numbers pkg_definitions.elementas
    ) IS
        l_arr pkg_definitions.arr_type := pkg_definitions.arr_type();
        l_sorted_arr pkg_definitions.arr_type := pkg_definitions.arr_type();
        l_num_of_numbers pkg_definitions.elementas := number_of_numbers;

    BEGIN

        << check_input_validity >>
        BEGIN
            IF l_num_of_numbers < 0 THEN
                RAISE pkg_exceptions.negative_array_size;
            ELSIF l_num_of_numbers > 100 THEN
                RAISE pkg_exceptions.too_many_numbers;
            END IF;
            
        EXCEPTION
            WHEN pkg_exceptions.negative_array_size THEN
                pkg_exceptions.process_error;
            When pkg_exceptions.too_many_numbers THEN
                pkg_exceptions.process_error;
        END;
        
        
        << generating_random_values >>
        BEGIN
            FOR i IN 1 .. l_num_of_numbers LOOP
                l_arr.EXTEND;
                l_arr(i) := DBMS_RANDOM.VALUE(1, 100);
            END LOOP;
        END;

        << print_initial_state >>
        BEGIN
            dbms_output.put_line('Initial array:');
            FOR i IN 1 .. l_num_of_numbers LOOP
                dbms_output.put_line(l_arr(i));
            END LOOP;
        END;

        l_sorted_arr := pkg_sort.sort_array(l_arr);

        << print_sorted_array >>
        BEGIN
            dbms_output.put_line('Sorted array:');
            FOR i IN 1 .. l_num_of_numbers LOOP
                dbms_output.put_line(l_sorted_arr(i));
            END LOOP;
        END;

        << linear_search_evaluation >>
        DECLARE
            l_linear_search_results pkg_definitions.result_arr_type;
            l_avarage NUMBER := 0;
        BEGIN
            FOR i IN 1 .. l_num_of_numbers LOOP
                l_linear_search_results(i) := pkg_linear_search.linear_search(l_arr(i), l_sorted_arr);
            END LOOP;

            << count_l_avarage_step_number >>
            BEGIN
                FOR i IN 1 .. l_num_of_numbers LOOP
                    l_avarage := l_avarage + l_linear_search_results(i).steps_count;
                END LOOP;
                    l_avarage := l_avarage / l_num_of_numbers;
                    
            EXCEPTION
                WHEN ZERO_DIVIDE THEN
                    pkg_exceptions.process_error;
                        
            END;
            dbms_output.put_line('Linear search steps:');
            dbms_output.put_line(l_avarage);
        END;

        << binary_search_evaluation >>
        DECLARE
            l_binary_search_results pkg_definitions.result_arr_type;
            l_average NUMBER := 0;
            l_index pkg_definitions.elementas;
        BEGIN
            FOR i IN 1 .. l_num_of_numbers LOOP
                l_binary_search_results(i) := pkg_binary_search.binary_search(l_arr(i), l_sorted_arr);
            END LOOP;

            l_index := 1;
            WHILE l_index <= l_num_of_numbers LOOP
                l_average := l_average + l_binary_search_results(l_index).steps_count;
                l_index := l_index + 1;
            END LOOP;

            l_average := l_average / l_num_of_numbers;

            dbms_output.put_line('Binary search steps:');
            dbms_output.put_line(l_average);
            
        EXCEPTION
                WHEN ZERO_DIVIDE THEN
                    pkg_exceptions.process_error;
        END;
    
    END;

END binary_and_linear_search_evaluation;
