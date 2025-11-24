#include "main.h"
#include <limits.h>

/**
 * print_int - prints an integer to standard output
 * @n: the integer to print
 *
 * Return: int
 */

int print_int(int n)
{
	int count = 0;
	char digit;

	if (n == INT_MIN)
	{
		count += write(1, "-", 1);
		count += write(1, "2", 1);
		count += print_int(147483648);
		return (count);
	}
	if (n < 0)
	{
		count += write(1, "-", 1);
		n = -n;

	}
	if (n / 10)
	count += print_int(n / 10);

	digit = (n % 10) + '0';
	count += write(1, &digit, 1);
	return (count);

}
/**
 * print_int_path - path function to extract integer from va_list
 * @args: va_list containing the integer
 *
 * Return: void
 */
int print_int_path(va_list args)
{
	int n = va_arg(args, int);

	return (print_int(n));
}
