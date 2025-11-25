# _printf

## C'est quoi ?

Une version simplifiée de `printf` qui affiche du texte avec des formats.

## Qu'est-ce que ça fait ?

| Format | Affiche | Exemple |
|--------|---------|---------|
| `%c` | Un caractère | `_printf("%c", 'A')` → `A` |
| `%s` | Une chaîne | `_printf("%s", "Hello")` → `Hello` |
| `%d` ou `%i` | Un nombre | `_printf("%d", 42)` → `42` |
| `%%` | Le symbole % | `_printf("%%")` → `%` |

## Comment compiler ?

```bash
gcc -Wall -Werror -Wextra -pedantic -std=gnu89 *.c -o test
```

## Exemples simples

```c
#include "main.h"

int main(void)
{
    _printf("Hello\n");
    _printf("Lettre: %c\n", 'A');
    _printf("Mot: %s\n", "monde");
    _printf("Nombre: %d\n", 42);
    
    return (0);
}
```

## Les fichiers du projet

- `_printf.c` - La fonction principale
- `print_char.c` - Pour afficher les caractères et chaînes
- `print_number.c` - Pour afficher les nombres
- `main.h` - Les prototypes des fonctions

## Comment ça marche (simple)

1. `_printf` lit la chaîne caractère par caractère
2. Quand il voit un `%`, il regarde le caractère suivant
3. Il appelle la bonne fonction pour afficher la valeur
4. Il compte combien de caractères ont été affichés

## Auteurs
Lucas METTETAL Auxance JOURDAN
Projet Holberton School
