#include "main.h"

/**
 * _printf - simplified printf implementation
 * @format: format string provided by the user
 *
 * Return: number of characters printed, or -1 on error
 */
int _printf(const char *format, ...)
{
    va_list args;                 /* variable arguments after 'format' */
    unsigned int index1 = 0;      /* index to traverse 'format' */
    int index2;                   /* index to traverse the dispatch table */
    int count = 0;                /* total number of printed characters */
    int found;                    /* whether a specifier was matched */

    /* Dispatch table: maps a specifier to its handler function */
    t_print_format ops[] = {
        {'c', print_char_path},
        {'s', print_string_path},
        {'d', print_int_path},
        {'i', print_int_path},
        {'%', print_percent_path},
        {'\0', NULL}
    };

    /* Guard: format must not be NULL */
    if (format == NULL)
        return (-1);

    /* Initialize access to variable arguments */
    va_start(args, format);

    /* Walk through the format string */
    while (format[index1] != '\0')
    {
        /* Regular character: print directly */
        if (format[index1] != '%')
        {
            _putchar(format[index1]);
            count++;
            index1++;
            continue;
        }

        /* Found '%': advance to the specifier character */
        index1++;
        if (format[index1] == '\0')
        {
            va_end(args);
            return (-1);
        }

        found = 0;
        index2 = 0;

        /* Look up a matching specifier in the dispatch table */
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

        /* Unknown specifier: print it literally as "%x" */
        if (!found)
        {
            _putchar('%');
            _putchar(format[index1]);
            count += 2;
        }

        index1++;
    }

    /* Cleanup and return the total */
    va_end(args);
    return (count);
}
