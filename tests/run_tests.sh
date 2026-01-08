#!/bin/bash

# Test Suite for _printf project
# This script runs comprehensive tests on the _printf implementation

set -e

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Test counters
TOTAL_TESTS=0
PASSED_TESTS=0
FAILED_TESTS=0

# ============================================================================
# Helper Functions
# ============================================================================

print_header() {
    echo -e "\n${BLUE}========================================${NC}"
    echo -e "${BLUE}$1${NC}"
    echo -e "${BLUE}========================================${NC}\n"
}

print_test() {
    TOTAL_TESTS=$((TOTAL_TESTS + 1))
    echo -e "${YELLOW}[Test $TOTAL_TESTS]${NC} $1"
}

pass_test() {
    PASSED_TESTS=$((PASSED_TESTS + 1))
    echo -e "${GREEN}✓ PASSED${NC}\n"
}

fail_test() {
    FAILED_TESTS=$((FAILED_TESTS + 1))
    echo -e "${RED}✗ FAILED${NC}"
    echo -e "${RED}Reason: $1${NC}\n"
}

# ============================================================================
# Compilation Test
# ============================================================================

print_header "COMPILATION TESTS"

print_test "Check if Makefile exists"
if [ -f "Makefile" ]; then
    pass_test
else
    fail_test "Makefile not found"
fi

print_test "Clean and rebuild project"
if make clean > /dev/null 2>&1 && make build > /dev/null 2>&1; then
    pass_test
else
    fail_test "Compilation failed"
    exit 1
fi

print_test "Check if executable was created"
if [ -f "bin/printf_test" ]; then
    pass_test
else
    fail_test "Executable bin/printf_test not found"
    exit 1
fi

print_test "Check if library was created"
if [ -f "bin/libprintf.a" ]; then
    pass_test
else
    fail_test "Library bin/libprintf.a not found"
fi

# ============================================================================
# Functionality Tests
# ============================================================================

print_header "FUNCTIONALITY TESTS"

# Create a simple test C program
TEST_PROGRAM="test_printf_temp.c"
TEST_EXECUTABLE="./test_printf_temp"

# Test 1: Basic character printing
print_test "Basic character printing (%c)"
cat > "$TEST_PROGRAM" << 'EOF'
#include "main.h"

int main(void) {
    _printf("%c", 'X');
    return (0);
}
EOF
gcc -Wall -Wextra -pedantic -std=gnu89 -Isrc -o "$TEST_EXECUTABLE" "$TEST_PROGRAM" src/_printf.c src/print_char.c src/print_number.c src/print_binary.c src/print_percent.c 2>/dev/null
RESULT=$($TEST_EXECUTABLE)
if [ "$RESULT" = "X" ]; then
    pass_test
else
    fail_test "Expected 'X', got '$RESULT'"
fi
rm -f "$TEST_PROGRAM" "$TEST_EXECUTABLE"

# Test 2: String printing
print_test "String printing (%s)"
cat > "$TEST_PROGRAM" << 'EOF'
#include "main.h"

int main(void) {
    _printf("%s", "Hello");
    return (0);
}
EOF
gcc -Wall -Wextra -pedantic -std=gnu89 -Isrc -o "$TEST_EXECUTABLE" "$TEST_PROGRAM" src/_printf.c src/print_char.c src/print_number.c src/print_binary.c src/print_percent.c 2>/dev/null
RESULT=$($TEST_EXECUTABLE)
if [ "$RESULT" = "Hello" ]; then
    pass_test
else
    fail_test "Expected 'Hello', got '$RESULT'"
fi
rm -f "$TEST_PROGRAM" "$TEST_EXECUTABLE"

# Test 3: Integer printing
print_test "Integer printing (%d)"
cat > "$TEST_PROGRAM" << 'EOF'
#include "main.h"

int main(void) {
    _printf("%d", 42);
    return (0);
}
EOF
gcc -Wall -Wextra -pedantic -std=gnu89 -Isrc -o "$TEST_EXECUTABLE" "$TEST_PROGRAM" src/_printf.c src/print_char.c src/print_number.c src/print_binary.c src/print_percent.c 2>/dev/null
RESULT=$($TEST_EXECUTABLE)
if [ "$RESULT" = "42" ]; then
    pass_test
else
    fail_test "Expected '42', got '$RESULT'"
fi
rm -f "$TEST_PROGRAM" "$TEST_EXECUTABLE"

# Test 4: Binary printing
print_test "Binary printing (%b)"
cat > "$TEST_PROGRAM" << 'EOF'
#include "main.h"

int main(void) {
    _printf("%b", 10);
    return (0);
}
EOF
gcc -Wall -Wextra -pedantic -std=gnu89 -Isrc -o "$TEST_EXECUTABLE" "$TEST_PROGRAM" src/_printf.c src/print_char.c src/print_number.c src/print_binary.c src/print_percent.c 2>/dev/null
RESULT=$($TEST_EXECUTABLE)
if [ "$RESULT" = "1010" ]; then
    pass_test
else
    fail_test "Expected '1010', got '$RESULT'"
fi
rm -f "$TEST_PROGRAM" "$TEST_EXECUTABLE"

# Test 5: Percent sign
print_test "Percent sign printing (%%)"
cat > "$TEST_PROGRAM" << 'EOF'
#include "main.h"

int main(void) {
    _printf("%%");
    return (0);
}
EOF
gcc -Wall -Wextra -pedantic -std=gnu89 -Isrc -o "$TEST_EXECUTABLE" "$TEST_PROGRAM" src/_printf.c src/print_char.c src/print_number.c src/print_binary.c src/print_percent.c 2>/dev/null
RESULT=$($TEST_EXECUTABLE)
if [ "$RESULT" = "%" ]; then
    pass_test
else
    fail_test "Expected '%', got '$RESULT'"
fi
rm -f "$TEST_PROGRAM" "$TEST_EXECUTABLE"

# Test 6: NULL string handling
print_test "NULL string handling"
cat > "$TEST_PROGRAM" << 'EOF'
#include "main.h"

int main(void) {
    _printf("%s", NULL);
    return (0);
}
EOF
gcc -Wall -Wextra -pedantic -std=gnu89 -Isrc -o "$TEST_EXECUTABLE" "$TEST_PROGRAM" src/_printf.c src/print_char.c src/print_number.c src/print_binary.c src/print_percent.c 2>/dev/null
RESULT=$($TEST_EXECUTABLE)
if [ "$RESULT" = "(null)" ]; then
    pass_test
else
    fail_test "Expected '(null)', got '$RESULT'"
fi
rm -f "$TEST_PROGRAM" "$TEST_EXECUTABLE"

# Test 7: Negative number
print_test "Negative integer printing"
cat > "$TEST_PROGRAM" << 'EOF'
#include "main.h"

int main(void) {
    _printf("%d", -123);
    return (0);
}
EOF
gcc -Wall -Wextra -pedantic -std=gnu89 -Isrc -o "$TEST_EXECUTABLE" "$TEST_PROGRAM" src/_printf.c src/print_char.c src/print_number.c src/print_binary.c src/print_percent.c 2>/dev/null
RESULT=$($TEST_EXECUTABLE)
if [ "$RESULT" = "-123" ]; then
    pass_test
else
    fail_test "Expected '-123', got '$RESULT'"
fi
rm -f "$TEST_PROGRAM" "$TEST_EXECUTABLE"

# Test 8: Binary zero
print_test "Binary zero printing"
cat > "$TEST_PROGRAM" << 'EOF'
#include "main.h"

int main(void) {
    _printf("%b", 0);
    return (0);
}
EOF
gcc -Wall -Wextra -pedantic -std=gnu89 -Isrc -o "$TEST_EXECUTABLE" "$TEST_PROGRAM" src/_printf.c src/print_char.c src/print_number.c src/print_binary.c src/print_percent.c 2>/dev/null
RESULT=$($TEST_EXECUTABLE)
if [ "$RESULT" = "0" ]; then
    pass_test
else
    fail_test "Expected '0', got '$RESULT'"
fi
rm -f "$TEST_PROGRAM" "$TEST_EXECUTABLE"

# Test 9: Mixed format string
print_test "Mixed format specifiers"
cat > "$TEST_PROGRAM" << 'EOF'
#include "main.h"

int main(void) {
    _printf("%s %d", "Test", 123);
    return (0);
}
EOF
gcc -Wall -Wextra -pedantic -std=gnu89 -Isrc -o "$TEST_EXECUTABLE" "$TEST_PROGRAM" src/_printf.c src/print_char.c src/print_number.c src/print_binary.c src/print_percent.c 2>/dev/null
RESULT=$($TEST_EXECUTABLE)
if [ "$RESULT" = "Test 123" ]; then
    pass_test
else
    fail_test "Expected 'Test 123', got '$RESULT'"
fi
rm -f "$TEST_PROGRAM" "$TEST_EXECUTABLE"

# Test 10: Return value test
print_test "Return value of _printf"
cat > "$TEST_PROGRAM" << 'EOF'
#include "main.h"

int main(void) {
    int count = _printf("%d", 100);
    return (0);
}
EOF
gcc -Wall -Wextra -pedantic -std=gnu89 -Isrc -o "$TEST_EXECUTABLE" "$TEST_PROGRAM" src/_printf.c src/print_char.c src/print_number.c src/print_binary.c src/print_percent.c 2>/dev/null
RESULT=$($TEST_EXECUTABLE)
if [ "$RESULT" = "100" ]; then
    pass_test
else
    fail_test "Expected '100' characters printed, got '$RESULT'"
fi
rm -f "$TEST_PROGRAM" "$TEST_EXECUTABLE"

# ============================================================================
# Code Quality Tests
# ============================================================================

print_header "CODE QUALITY TESTS"

# Test 11: Check for source files exist
print_test "Source files exist"
REQUIRED_FILES=("src/_printf.c" "src/main.h" "src/print_char.c" "src/print_number.c" "src/print_binary.c" "src/print_percent.c")
ALL_EXIST=1
for file in "${REQUIRED_FILES[@]}"; do
    if [ ! -f "$file" ]; then
        ALL_EXIST=0
        break
    fi
done

if [ $ALL_EXIST -eq 1 ]; then
    pass_test
else
    fail_test "Some source files are missing"
fi

# Test 12: Check for header guards in main.h
print_test "Header guards in main.h"
if grep -q "#ifndef MAIN_H" src/main.h && grep -q "#define MAIN_H" src/main.h && grep -q "#endif" src/main.h; then
    pass_test
else
    fail_test "Header guards not properly defined"
fi

# Test 13: Check for proper function documentation
print_test "Function documentation"
if grep -q "/\*\*" src/_printf.c && grep -q "\* @" src/_printf.c && grep -q "\* Return:" src/_printf.c; then
    pass_test
else
    fail_test "Proper documentation not found"
fi

# ============================================================================
# Final Report
# ============================================================================

print_header "TEST SUMMARY"

echo -e "${BLUE}Total Tests:${NC}  $TOTAL_TESTS"
echo -e "${GREEN}Passed:${NC}       $PASSED_TESTS"
echo -e "${RED}Failed:${NC}        $FAILED_TESTS"

SUCCESS_RATE=$((PASSED_TESTS * 100 / TOTAL_TESTS))
echo -e "\n${BLUE}Success Rate:${NC}  $SUCCESS_RATE%\n"

if [ $FAILED_TESTS -eq 0 ]; then
    echo -e "${GREEN}✓ All tests passed!${NC}\n"
    exit 0
else
    echo -e "${RED}✗ Some tests failed. Please review the output above.${NC}\n"
    exit 1
fi
