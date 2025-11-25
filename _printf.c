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
	int count = 0;
	t_print_format ops[] = {
		{'c', print_char_path},
		{'s', print_string_path},
		{'d', print_int_path},
		{'i', print_int_path},
		{'%', print_percent_path},
		{'\0', NULL}};

if (format == NULL)
        return (-1);

    va_start(args, format);

    while (format[i] != '\0')
    {
        if (format[i] != '%')
        {
            _putchar(format[i]);
            count++;
            i++;
            continue;
        }

        /* format[i] == '%' */
        i++;
        if (format[i] == '\0')
        {
            va_end(args);
            return (-1);
        }

        count += handle_format(format[i], args);
        i++;
    }

    va_end(args);
    return (count);
}
