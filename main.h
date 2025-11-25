#ifndef MAIN_H
#define MAIN_H

#include <stdarg.h>
#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>

/* - character/string display functions - */
int print_char(char c);
int print_string(char *s);

/* - number display functions - */
int print_int(int n);

/* - path functions - */
int print_char_path(va_list args);
int print_string_path(va_list args);
int print_int_path(va_list args);
int print_percent_path(va_list args);

/* - mini-printf - */
int _printf(const char *format, ...);

/**
 * struct print_format - structure to map format specifiers to functions
 * @specifier: format specifier character
 * @print_function: pointer to the corresponding print function
 */
typedef struct print_format
{
	char specifier;
	int (*print_function)(va_list args);
} t_print_format;

#endif /* MAIN_H */
