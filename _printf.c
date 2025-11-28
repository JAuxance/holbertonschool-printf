#include "main.h"

/**
 * _printf - simplified printf implementation
 * @format: format string provided by the user
 *
 * Return: number of characters printed, or -1 on error
 */
int _printf(const char *format, ...)
{
    va_list args;            /* stockage of variadic arguments */
    unsigned int index1 = 0; /* current position in the 'format' chain */
    int index2;              /* index to traverse the table 'ops' */
    int count = 0;           /* total number of printed characters */
    int found;               /* (0 or 1) indicating whether a known specifier has been found */

    /* An array of structures with a format character and function pointer */
    t_print_format ops[] = {
        {'c', print_char_path},
        {'s', print_string_path},
        {'d', print_int_path},
        {'i', print_int_path},
        {'%', print_percent_path},
        {'b', print_binary_path},
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

        if (format[index1] == '\0') /*If this next character is the null terminator,
                                     it means ends with a single %,
                                     In that case I call va_end and return -1.*/
        {
            va_end(args);
            return (-1);
        }
        /*preparation of ops[]*/
        found = 0;
        index2 = 0;

        /* while in the table ops[] */
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

    /* Clean up and return the total number of characters printed*/
    va_end(args);
    return (count);
}
