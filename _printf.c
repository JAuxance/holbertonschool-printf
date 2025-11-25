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
    unsigned int index1 = 0;
    int index2 = 0;
    int count = 0;
    int found;
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

    while (format[index1] != '\0')
    {
        if (format[index1] != '%')
        {
            _putchar(format[index1]);
            count++;
            index1++;
            continue;
        }

        /* format[i] == '%' */
        index1++;
        if (format[index1] == '\0')
        {
            va_end(args);
            return (-1);
        }
        found = 0;
        index2 = 0;

        while (ops[index2].specifier != '\0')
        {
            if (ops[index2].specifier == format[index1])

            {

                count += ops[index2].print_function(args);
                found = 1;
                break;
            }
            index2++;
        }

        if (!found)
        {
            _putchar('%');
            _putchar(format[index1]);
            count += 2;
        }
        index1++;
    }
}

va_end(args);
return (count);
}
