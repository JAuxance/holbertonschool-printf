# _printf

[![en](https://img.shields.io/badge/lang-en-red.svg)](README.en.md)

## C'est quoi ?

Une version simplifiée de la fonction `printf` de la bibliothèque standard C. Cette implémentation permet d'afficher du texte formaté sur la sortie standard (stdout) en utilisant des spécificateurs de conversion.

### Spécificateurs supportés

| Format | Description | Exemple |
|--------|-------------|---------|
| `%c` | Affiche un caractère | `_printf("%c", 'A')` → `A` |
| `%s` | Affiche une chaîne de caractères | `_printf("%s", "Hello")` → `Hello` |
| `%d` | Affiche un entier décimal (base 10) | `_printf("%d", 42)` → `42` |
| `%i` | Affiche un entier (identique à %d) | `_printf("%i", -7)` → `-7` |
| `%%` | Affiche le caractère % littéral | `_printf("%%")` → `%` |

---

## Requirements

- **OS** : Ubuntu 20.04 LTS
- **Compilateur** : GCC 9.4.0 ou supérieur
- **Éditeur** : vi, vim, emacs ou VS Code
- **Git** : Pour le versioning du code
- **Style** : Code conforme au style Betty

---

## Comment compiler ?

```bash
gcc -Wall -Werror -Wextra -pedantic -std=gnu89 *.c -o test
```

---

## Exemples d'utilisation

### Code d'exemple

```c
#include "main.h"

int main(void)
{
    int len;

    _printf("Hello\n");                     /* Affiche: Hello */
    _printf("Lettre: %c\n", 'A');           /* Affiche: Lettre: A */
    _printf("Mot: %s\n", "monde");          /* Affiche: Mot: monde */
    _printf("Nombre: %d\n", 42);            /* Affiche: Nombre: 42 */
    _printf("Negatif: %i\n", -123);         /* Affiche: Negatif: -123 */
    _printf("Pourcent: %%\n");              /* Affiche: Pourcent: % */

    len = _printf("Test\n");
    _printf("Longueur: %d\n", len);         /* Affiche: Longueur: 5 */

    return (0);
}
```

### Résultat attendu

```
Hello
Lettre: A
Mot: monde
Nombre: 42
Negatif: -123
Pourcent: %
Test
Longueur: 5
```

---

## Tests avec Valgrind

Pour vérifier qu'il n'y a pas de fuites mémoire :

```bash
# Compiler avec les symboles de debug
gcc -Wall -Werror -Wextra -pedantic -std=gnu89 -g *.c -o test

# Exécuter avec Valgrind
valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes ./test
```

### Résultat attendu (pas de fuites)

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
# Version anglaise
man ./man_pages/_printf.1.en

# Version française
man ./man_pages/_printf.1.fr
```

---

## Les fichiers du projet

| Fichier | Description |
|---------|-------------|
| `_printf.c` | La fonction principale |
| `print_char.c` | Pour afficher les caractères et chaînes |
| `print_number.c` | Pour afficher les nombres |
| `main.h` | Les prototypes des fonctions |

---

## Comment ça marche ?

1. `_printf` lit la chaîne caractère par caractère
2. Quand il voit un `%`, il regarde le caractère suivant
3. Il appelle la bonne fonction pour afficher la valeur
4. Il compte combien de caractères ont été affichés

---

## Auteurs

- Lucas METTETAL
- Auxance JOURDAN

---

*Projet Holberton School*