#include "main.h"

/**
 * print_string_path - prints a string to standard output
 * @args: variadic argument list holding the string
 *
 * Return: number of characters printed
 */

int print_string_path(va_list args)
{
	char *str = va_arg(args, char *);
	int count = 0;
	int i = 0;

	/* If the string is NULL, print "(null)" to avoid dereferencing NULL */
	if (str == NULL)
		str = "(null)";

	/* Walk the string and print one character at a time */
	while (str[i] != '\0')
	{
		_putchar(str[i]);
		count++;
		i++;
	}
	return (count);
}

/**
 * _putchar - writes a character to stdout
 * @character: The character to print
 *
 * Return: On success 1. On error, -1 and sets errno (wrapper over write(2)).
 */

int _putchar(char character)
{
	return (write(1, &character, 1));
}

/**
 * print_char_path - extracts and prints one character
 * @args: va_list containing the character (promoted int)
 *
 * Return: 1 (number of characters printed)
 */
int print_char_path(va_list args)
{
	int c = va_arg(args, int);
	char ch = (char)c;

	_putchar(ch);
	return (1);
}
