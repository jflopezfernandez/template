
#include "template.h"

#include <check.h>

START_TEST(safe_free_sets_ptr_to_NULL)
{
    time_t current_time = time(NULL);
    const char* str = strdup(asctime(localtime(&current_time)));

    ck_assert_ptr_nonnull(str);

    FREE(str);

    ck_assert_ptr_null(str);
}
END_TEST

Suite* safe_free_suite(void)
{
    Suite* test_suite = suite_create("safe_free");

    TCase* test_case_set_null = tcase_create("Set NULL");
    tcase_add_test(test_case_set_null, safe_free_sets_ptr_to_NULL);

    suite_add_tcase(test_suite, test_case_set_null);

    return test_suite;
}

int main(void)
{
    Suite* test_suite = safe_free_suite();

    SRunner* suite_test_runner = srunner_create(test_suite);

    srunner_run_all(suite_test_runner, CK_VERBOSE);

    int tests_failed = srunner_ntests_failed(suite_test_runner);

    srunner_free(suite_test_runner);

    return (tests_failed) ? EXIT_FAILURE : EXIT_SUCCESS;
}
