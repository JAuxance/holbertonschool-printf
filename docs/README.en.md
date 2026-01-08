# _printf

[![fr](https://img.shields.io/badge/lang-fr-blue.svg)](README.fr.md) [![man-page](https://img.shields.io/badge/man%20page-en-red)](_printf.1.en)

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
- **Build System**: Make
- **Git**: For code versioning

---

## How to compile?

```bash
# Using the Makefile (recommended)
make build

# Or manually with gcc
gcc -Wall -Werror -Wextra -pedantic -std=gnu89 -Isrc src/*.c -o printf_test
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

## Project Structure

```
holbertonschool-printf/
├── Makefile                 # Build automation system
├── README.en.md             # English documentation
├── README.fr.md             # French documentation
│
├── src/                     # Source code (7 files)
│   ├── main.h               # Header with function prototypes
│   ├── _printf.c            # Main printf implementation
│   ├── main.c               # Test program
│   ├── print_char.c         # Character/string printing
│   ├── print_number.c       # Integer printing
│   ├── print_binary.c       # Binary representation
│   └── print_percent.c      # Percent sign handler
│
├── tests/                   # Test suite
│   └── run_tests.sh         # 17 automated shell tests
│
├── docs/                    # Documentation
│   ├── README.en.md         # English docs
│   ├── README.fr.md         # French docs
│   ├── _printf.1.en         # Man page (English)
│   ├── _printf.1.fr         # Man page (French)
│   └── flowchart__printf.png # Process flowchart
│
├── build/                   # Object files (generated)
└── bin/                     # Executables (generated)
    ├── printf_test          # Test executable
    └── libprintf.a          # Static library
```

---

## Build System - Makefile

### Available Targets

| Command | Description |
|---------|-------------|
| `make build` | Create static library and test executable |
| `make test` | Run comprehensive shell test suite (17 tests) |
| `make debug` | Build with debug symbols and no optimization |
| `make clean` | Remove object files |
| `make fclean` | Remove all generated files |
| `make re` | Rebuild everything from scratch |
| `make help` | Display help message |

### Compilation Flags

```makefile
CC       = gcc
CFLAGS   = -Wall -Werror -Wextra -pedantic -std=gnu89
CPPFLAGS = -D_POSIX_C_SOURCE=200809L
```

---

## Code Quality & Implementation

### Variable Naming (Improved)

All variables have explicit, meaningful names:

| Old Name | New Name | Purpose |
|----------|----------|---------|
| `index1` | `current_pos` | Current position in format string |
| `index2` | `spec_index` | Index in specifier array |
| `count` | `chars_printed` | Number of characters printed |
| `i` | `current_index` / `binary_index` | Loop index (context-specific) |

### Structure Naming

- `t_print_format` → `t_format_handler` (more descriptive)

### Key Features

✓ **Variadic Functions**: Using `va_list` and `va_arg`
✓ **Function Pointers**: Mapping specifiers to handlers
✓ **Recursion**: Integer to string conversion
✓ **Error Handling**: Special cases like INT_MIN
✓ **Comprehensive Tests**: 17 automated tests with 100% pass rate
✓ **Professional Build System**: Well-organized Makefile
✓ **Proper Documentation**: Function comments and type definitions

---

## Testing

### Run Tests

```bash
# Using Makefile
make test

# Or directly
bash tests/run_tests.sh
```

### Test Suite (17 tests)

✓ **Compilation Tests** (4 tests)
- Makefile existence
- Project rebuild
- Executable creation
- Library creation

✓ **Functionality Tests** (10 tests)
- Character printing (%c)
- String printing (%s)
- Integer printing (%d)
- Binary printing (%b)
- Percent sign (%%)
- NULL string handling
- Negative integers
- Binary zero
- Mixed format specifiers
- Return value verification

✓ **Code Quality Tests** (3 tests)
- Source file existence
- Header guards
- Function documentation

**Result**: 17/17 tests passed (100% success rate)

---

## How it works

1. **Parse Format String**: `_printf` reads the string character by character
2. **Find Specifiers**: When it encounters `%`, it identifies the format specifier
3. **Dispatch Handler**: Calls the appropriate function to handle the format
4. **Count Characters**: Accumulates total characters printed
5. **Return Count**: Returns total number of characters written

### Supported Format Handlers

- `%c` → `print_char_path()` → `print_char()`
- `%s` → `print_string_path()` → `print_string()`
- `%d` / `%i` → `print_int_path()` → `print_int()`
- `%b` → `print_binary_path()` → `print_binary()`
- `%%` → `print_percent_path()`

---

## Memory & Valgrind

To check for memory leaks:

```bash
# Compile with debug symbols
make debug

# Run with Valgrind
valgrind --leak-check=full --show-leak-kinds=all ./bin/printf_test
```

Expected: **No memory leaks detected**

---

## Man pages

```bash
# English version
man ./docs/_printf.1.en

# French version
man ./docs/_printf.1.fr
```

---

## Project Files Overview

| File | Description |
|------|-------------|
| `src/_printf.c` | Main function - parses format strings and dispatches handlers |
| `src/print_char.c` | Character and string printing functions |
| `src/print_number.c` | Integer printing with recursion |
| `src/print_binary.c` | Binary representation conversion |
| `src/print_percent.c` | Percent sign handler |
| `src/main.h` | Function prototypes and structure definitions |
| `src/main.c` | Test program demonstrating functionality |

---

## Learning Outcomes

This project demonstrates:
- C variadic functions and argument handling
- Function pointer usage and callbacks
- Recursive algorithms
- Makefile automation and build processes
- Shell scripting for testing
- Professional code organization
- Betty style compliance
- Comprehensive testing practices

---

## Authors

- Lucas METTETAL
- Auxance JOURDAN

---

## License

This is a Holberton School project.

*Last updated: January 8, 2026*

---

[Go to French version →](README.fr.md)
