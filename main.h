#ifndef MAIN_H
#define MAIN_H

#include <stdarg.h>
#include <unistd.h>

/* - character/string display functions - */
int print_char(char c);
int print_string(char *s);

/* - number display functions - */
void print_int(int n);

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
