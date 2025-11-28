# _printf

[![fr](https://img.shields.io/badge/lang-fr-blue.svg)](README.fr.md) [![man-page](https://img.shields.io/badge/man%20page-en-red)](man_pages/_printf.1.en)

## What is it?

A simplified version of the `printf` function from the C standard library. This implementation allows you to display formatted text on standard output (stdout) using conversion specifiers.

### Supported specifiers

| Format | Description | Example |
|--------|-------------|---------|
| `%c` | Prints a character | `_printf("%c", 'A')` → `A` |
| `%s` | Prints a string | `_printf("%s", "Hello")` → `Hello` |
| `%d` | Prints a decimal integer (base 10) | `_printf("%d", 42)` → `42` |
| `%i` | Prints an integer (same as %d) | `_printf("%i", -7)` → `-7` |
| `%b` | Prints an unsigned integer in binary | `_printf("%b", 1024)` → `10000000000` |
| `%%` | Prints the literal % character | `_printf("%%")` → `%` |

---

## Requirements

- **OS**: Ubuntu 20.04 LTS
- **Compiler**: GCC 9.4.0 or higher
- **Editor**: vi, vim, emacs or VS Code
- **Git**: For code versioning
- **Style**: Code compliant with Betty style

---

## How to compile?

```bash
gcc -Wall -Werror -Wextra -pedantic -std=gnu89 *.c -o test
```

---

## Usage examples

### Example code

```c
#include "main.h"

int main(void)
{
    int len;

    _printf("Hello\n");                     /* Output: Hello */
    _printf("Letter: %c\n", 'A');           /* Output: Letter: A */
    _printf("Word: %s\n", "world");         /* Output: Word: world */
    _printf("Number: %d\n", 42);            /* Output: Number: 42 */
    _printf("Negative: %i\n", -123);        /* Output: Negative: -123 */
    _printf("Percent: %%\n");               /* Output: Percent: % */
    _printf("Binary: %b\n", 13);            /* Output: Binary: 1101 */

    len = _printf("Test\n");
    _printf("Length: %d\n", len);           /* Output: Length: 5 */

    return (0);
}
```

### Expected output

```
Hello
Letter: A
Word: world
Number: 42
Negative: -123
Percent: %
Test
Length: 5
Binary: 1101
```

---

## Testing with Valgrind

To check for memory leaks:

```bash
# Compile with debug symbols
gcc -Wall -Werror -Wextra -pedantic -std=gnu89 -g *.c -o test

# Run with Valgrind
valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes ./test
```

### Expected result (no leaks)

```
==12345== HEAP SUMMARY:
==12345==     in use at exit: 0 bytes in 0 blocks
==12345==   total heap usage: 0 allocs, 0 frees, 0 bytes allocated
==12345==
==12345== All heap blocks were freed -- no leaks are possible
```

---

## Man pages

```bash
# English version
man ./man_pages/_printf.1.en

# French version
man ./man_pages/_printf.1.fr
```

---

## Project files

| File | Description |
|------|-------------|
| `_printf.c` | The main function |
| `print_char.c` | For displaying characters and strings |
| `print_number.c` | For displaying numbers |
| `main.h` | Function prototypes |

---

## How does it work?

1. `_printf` reads the string character by character
2. When it sees a `%`, it looks at the next character
3. It calls the appropriate function to display the value
4. It counts how many characters have been printed

---

<img width="2254" height="4985" alt="flowchart printg (2)" src="https://github.com/user-attachments/assets/4ae3d4e7-2231-4926-9d29-9c572a1602df" />

---

## Authors

- Lucas METTETAL
- Auxance JOURDAN

---

*Holberton School Project*
