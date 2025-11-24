#include "main.h"
/**
 * _printf - a simplified version of printf
 * @format: the format string
 *
 * Return: the number of characters printed
 */
int _printf(const char *format, ...)
{
	va_list args;
	unsigned int i = 0;
	t_print_format ops[] = {
		{'c', print_char_path},
		{'s', print_string_path},
		{'d', print_int_path},
		{'i', print_int_path},
		{'\0', NULL}};
}
