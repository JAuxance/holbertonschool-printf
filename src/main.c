#include <stdio.h>
#include "main.h"

/**
 * main - Test the _printf function
 *
 * Return: Always 0
 */
int main(void)
{
	int chars_printed;

	/* Test 1: Print a simple character */
	_printf("Test 1 - Character: %c\n", 'A');

	/* Test 2: Print a string */
	_printf("Test 2 - String: %s\n", "Hello, World!");

	/* Test 3: Print integers */
	_printf("Test 3 - Integer: %d\n", 42);
	_printf("Test 3 - Integer (i): %i\n", -100);

	/* Test 4: Print binary */
	_printf("Test 4 - Binary: %b\n", 255);

	/* Test 5: Print percent sign */
	_printf("Test 5 - Percent: %%\n");

	/* Test 6: Multiple specifiers */
	chars_printed = _printf("Test 6 - Multiple: %s is %d and %c\n", "Result", 2024, 'X');
	_printf("Characters printed: %d\n", chars_printed);

	/* Test 7: NULL string */
	_printf("Test 7 - NULL: %s\n", NULL);

	/* Test 8: Integer boundaries */
	_printf("Test 8 - INT_MIN: %d\n", -2147483648);

	/* Test 9: Zero in binary */
	_printf("Test 9 - Binary Zero: %b\n", 0);

	/* Test 10: Empty string */
	_printf("Test 10 - Empty string: '%s'\n", "");

	return (0);
}
