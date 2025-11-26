# _printf

## C'est quoi ?

Une version simplifiée de `printf` qui affiche du texte/nombre avec des formats.

---

## Requirements

- **OS** : Ubuntu 20.04 LTS
- **Compilateur** : GCC 9.4.0 ou supérieur
- **Éditeur** : vi, vim, emacs ou VS Code
- **Git** : Pour le versioning du code
- **Style** : Code conforme au style Betty
- Tous les fichiers doivent se terminer par une nouvelle ligne
- Pas plus de 5 fonctions par fichier
- Fonctions autorisées : `write`, `malloc`, `free`, `va_start`, `va_end`, `va_copy`, `va_arg`

---

## Comment compiler ?

```bash
gcc -Wall -Werror -Wextra -pedantic -std=gnu89 *.c -o test
```

---

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