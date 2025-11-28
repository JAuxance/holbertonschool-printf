#include "main.h"
/**
 * print_binary_path - extracts an unsigned int from
 * va_list and prints it in binary
 * @n: the unsigned int to print
 *
 * Return: number of characters printed
 */
int print_binary(unsigned int n)
{
	int count = 0;
	int i = 0;
	int bits[32];

	if (n == 0)
	{
		_putchar('0');
		return (1);
	}
	while (n > 0)
	{
		bits[i] = n % 2;
		n = n / 2;
		i++;
	}

	while (i--)
	{
		count += _putchar(bits[i] + '0');
	}
	return (count);
}

int print_binary_path(va_list args)
{
	unsigned int n = va_arg(args, unsigned int);

	return (print_binary_path(n));
}
