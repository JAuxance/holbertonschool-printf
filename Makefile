# Makefile for _printf project
# A simple printf-like function implementation

# ============================================================================
# Compiler and Compiler Flags
# ============================================================================
CC          := gcc
CFLAGS      := -Wall -Werror -Wextra -pedantic -std=gnu89
DEBUG_FLAGS := -g -O0 -DDEBUG
CPPFLAGS    := -D_POSIX_C_SOURCE=200809L

# ============================================================================
# Directory Structure
# ============================================================================
SRC_DIR     := src
BUILD_DIR   := build
TEST_DIR    := tests
BIN_DIR     := bin
DOCS_DIR    := docs

# ============================================================================
# Source Files
# ============================================================================
SOURCES     := _printf.c \
               print_char.c \
               print_number.c \
               print_binary.c \
               print_percent.c

MAIN_FILE   := main.c
OBJECTS     := $(addprefix $(BUILD_DIR)/,$(SOURCES:%.c=%.o))
MAIN_OBJ    := $(BUILD_DIR)/main.o

# ============================================================================
# Target Executables
# ============================================================================
LIBRARY     := $(BIN_DIR)/libprintf.a
EXECUTABLE  := $(BIN_DIR)/printf_test

# ============================================================================
# Phony Targets
# ============================================================================
.PHONY: all build test clean debug help install uninstall

# ============================================================================
# Default Target
# ============================================================================
all: build

# ============================================================================
# Build Target - Creates static library and executable
# ============================================================================
build: directories $(LIBRARY) $(EXECUTABLE)

$(LIBRARY): $(OBJECTS)
	@echo "[AR] Creating static library: $@"
	ar rc $@ $^
	ranlib $@

$(EXECUTABLE): $(OBJECTS) $(MAIN_OBJ)
	@echo "[CC] Linking executable: $@"
	$(CC) $(CFLAGS) -o $@ $^

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c
	@echo "[CC] Compiling: $<"
	$(CC) $(CFLAGS) $(CPPFLAGS) -I$(SRC_DIR) -c -o $@ $<

# ============================================================================
# Directories Target - Create necessary directories
# ============================================================================
directories:
	@mkdir -p $(BUILD_DIR) $(BIN_DIR) $(TEST_DIR) $(DOCS_DIR)

# ============================================================================
# Test Target - Run shell tests
# ============================================================================
test: build
	@echo "[TEST] Running tests..."
	@bash $(TEST_DIR)/run_tests.sh

# ============================================================================
# Debug Target - Build with debug symbols
# ============================================================================
debug: CFLAGS += $(DEBUG_FLAGS)
debug: clean build

# ============================================================================
# Clean Targets
# ============================================================================
clean:
	@echo "[CLEAN] Removing object files and build directory..."
	@rm -rf $(BUILD_DIR)

fclean: clean
	@echo "[CLEAN] Removing library, executable, and bin directory..."
	@rm -rf $(BIN_DIR) $(DOCS_DIR)/build

re: fclean all

# ============================================================================
# Help Target - Display help message
# ============================================================================
help:
	@echo "==================================================================="
	@echo "  _printf Project - Makefile Targets"
	@echo "==================================================================="
	@echo ""
	@echo "Usage: make [target]"
	@echo ""
	@echo "Main Targets:"
	@echo "  all       - Build library and executable (default)"
	@echo "  build     - Create static library and test executable"
	@echo "  test      - Run shell test suite"
	@echo "  debug     - Build with debug symbols and no optimization"
	@echo "  clean     - Remove object files"
	@echo "  fclean    - Remove all built files (objects, library, executable)"
	@echo "  re        - Rebuild everything from scratch"
	@echo "  help      - Display this help message"
	@echo ""
	@echo "==================================================================="
