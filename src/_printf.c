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
    unsigned int current_pos = 0; /* current position in the 'format' chain */
    int spec_index;          /* index to traverse the table 'ops' */
    int chars_printed = 0;   /* total number of printed characters */
    int found;               /* (0 or 1) indicating whether a known specifier has been found */

    /* An array of structures with a format character and function pointer */
    t_format_handler ops[] = {
        {'c', print_char_path},
        {'s', print_string_path},
        {'d', print_int_path},
        {'i', print_int_path},
        {'b', print_binary_path},
        {'%', print_percent_path},
        {'\0', NULL}
    };

    /* Guard: format must not be NULL */
    if (format == NULL)
        return (-1);

    /* Initialize access to variable arguments */
    va_start(args, format);

    /* Walk through the format string */
    while (format[current_pos] != '\0')
    {
        /* Regular character: print directly */
        if (format[current_pos] != '%')
        {
            _putchar(format[current_pos]);
            chars_printed++;
            current_pos++;
            continue;
        }

        /* Found '%': advance to the specifier character */
        current_pos++;

        if (format[current_pos] == '\0') /*If this next character is the null terminator,
                                     it means ends with a single %,
                                     In that case I call va_end and return -1.*/
        {
            va_end(args);
            return (-1);
        }
        /*preparation of ops[]*/
        found = 0;
        spec_index = 0;

        /* while in the table ops[] */
        while (ops[spec_index].specifier != '\0')
        {
            if (ops[spec_index].specifier == format[current_pos])
            {
                chars_printed += ops[spec_index].print_function(args);
                found = 1;
                break;
            }
            spec_index++;
        }

        /* Unknown specifier: print it literally as "%x" */
        if (!found)
        {
            _putchar('%');
            _putchar(format[current_pos]);
            chars_printed += 2;
        }

        current_pos++;
    }

    /* Clean up and return the total number of characters printed*/
    va_end(args);
    return (chars_printed);
}
