#include "main.h"

/**
 *
 * print_srting - prints a string to standard output
 *
 * Return: int
 *
 */

int print_string_path(va_list args)
{
	char *str = va_arg(args, char *);
	int count = 0;
	int i = 0;

	if (str == NULL)
		str = "(null)";
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
 * Return: On success 1.
 * On error, -1 is returned, and errno is set appropriately.
 */

int _putchar(char character)
{
	return (write(1, &character, 1));
}

/**
 * print_char - prints a character to standard output
 * Return: int
 */

int print_char_path(va_list args)
{
}
