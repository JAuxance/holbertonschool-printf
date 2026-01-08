# _printf

A simplified implementation of the `printf` function from the C standard library.

## 📚 Documentation

- **[English Documentation](docs/README.en.md)** - Full documentation in English
- **[Documentation Française](docs/README.fr.md)** - Documentation complète en français

## 🚀 Quick Start

```bash
# Build the project
make build

# Run tests
make test

# Run the program
./bin/printf_test
```

## ✨ Features

- ✅ Format specifiers: `%c`, `%s`, `%d`, `%i`, `%b`, `%%`
- ✅ 17 automated tests (100% pass rate)
- ✅ Professional build system with Makefile
- ✅ Well-organized codebase
- ✅ Comprehensive documentation (EN & FR)

## 📋 Supported Format Specifiers

| Format | Description | Example |
|--------|-------------|---------|
| `%c` | Character | `'A'` |
| `%s` | String | `"Hello"` |
| `%d` | Integer (decimal) | `42` |
| `%i` | Integer | `-7` |
| `%b` | Binary | `1010` |
| `%%` | Literal % | `%` |

## 📁 Project Structure

```
holbertonschool-printf/
├── Makefile              # Build system
├── README.md             # This file
├── src/                  # Source code
├── tests/                # Test suite
├── docs/                 # Full documentation
├── build/                # Compiled objects (generated)
└── bin/                  # Executables (generated)
```

## 🔨 Build System

```bash
make help       # Show available commands
make build      # Compile project
make test       # Run tests
make debug      # Build with debug symbols
make clean      # Remove object files
make fclean     # Remove all generated files
make re         # Full rebuild
```

## 📖 Learn More

For detailed information, installation instructions, and usage examples, please refer to the full documentation:

- **[English Version →](docs/README.en.md)**
- **[Version Française →](docs/README.fr.md)**

## 👨‍💻 Authors

- Lucas METTETAL
- Auxance JOURDAN

---

*Holberton School Project*  
*Last updated: January 8, 2026*
