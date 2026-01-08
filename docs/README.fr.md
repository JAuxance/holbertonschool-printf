# _printf

[![en](https://img.shields.io/badge/lang-en-red.svg)](README.en.md) [![man-page](https://img.shields.io/badge/man%20page-fr-blue)](_printf.1.fr)

## Qu'est-ce que c'est ?

Une version simplifiée de la fonction `printf` de la bibliothèque standard C. Cette implémentation vous permet d'afficher du texte formaté sur la sortie standard (stdout) en utilisant des spécificateurs de conversion.

### Spécificateurs supportés

| Format | Description | Exemple |
|--------|-------------|---------|
| `%c` | Affiche un caractère | `_printf("%c", 'A')` → `A` |
| `%s` | Affiche une chaîne | `_printf("%s", "Hello")` → `Hello` |
| `%d` | Affiche un entier décimal (base 10) | `_printf("%d", 42)` → `42` |
| `%i` | Affiche un entier (identique à %d) | `_printf("%i", -7)` → `-7` |
| `%b` | Affiche un entier non signé en binaire | `_printf("%b", 1024)` → `10000000000` |
| `%%` | Affiche le caractère % littéral | `_printf("%%")` → `%` |

---

## Prérequis

- **OS**: Ubuntu 20.04 LTS
- **Compilateur**: GCC 9.4.0 ou supérieur
- **Système de build**: Make
- **Git**: Pour la gestion de version

---

## Comment compiler ?

```bash
# En utilisant le Makefile (recommandé)
make build

# Ou manuellement avec gcc
gcc -Wall -Werror -Wextra -pedantic -std=gnu89 -Isrc src/*.c -o printf_test
```

---

## Exemples d'utilisation

### Code exemple

```c
#include "main.h"

int main(void)
{
    int len;

    _printf("Bonjour\n");                   /* Affichage: Bonjour */
    _printf("Lettre: %c\n", 'A');           /* Affichage: Lettre: A */
    _printf("Mot: %s\n", "monde");          /* Affichage: Mot: monde */
    _printf("Nombre: %d\n", 42);            /* Affichage: Nombre: 42 */
    _printf("Négatif: %i\n", -123);         /* Affichage: Négatif: -123 */
    _printf("Pourcent: %%\n");              /* Affichage: Pourcent: % */
    _printf("Binaire: %b\n", 13);           /* Affichage: Binaire: 1101 */

    len = _printf("Test\n");
    _printf("Longueur: %d\n", len);         /* Affichage: Longueur: 5 */

    return (0);
}
```

### Affichage attendu

```
Bonjour
Lettre: A
Mot: monde
Nombre: 42
Négatif: -123
Pourcent: %
Test
Longueur: 5
Binaire: 1101
```

---

## Structure du projet

```
holbertonschool-printf/
├── Makefile                 # Système de build automatisé
├── README.en.md             # Documentation anglaise
├── README.fr.md             # Documentation française
│
├── src/                     # Code source (7 fichiers)
│   ├── main.h               # En-têtes avec prototypes
│   ├── _printf.c            # Implémentation principale
│   ├── main.c               # Programme de test
│   ├── print_char.c         # Impression de caractères/chaînes
│   ├── print_number.c       # Impression d'entiers
│   ├── print_binary.c       # Conversion en binaire
│   └── print_percent.c      # Gestionnaire du %
│
├── tests/                   # Suite de tests
│   └── run_tests.sh         # 17 tests shell automatisés
│
├── docs/                    # Documentation
│   ├── README.en.md         # Docs anglaises
│   ├── README.fr.md         # Docs françaises
│   ├── _printf.1.en         # Page man (anglais)
│   ├── _printf.1.fr         # Page man (français)
│   └── flowchart__printf.png # Diagramme de processus
│
├── build/                   # Fichiers objets (générés)
└── bin/                     # Exécutables (générés)
    ├── printf_test          # Exécutable de test
    └── libprintf.a          # Bibliothèque statique
```

---

## Système de build - Makefile

### Cibles disponibles

| Commande | Description |
|----------|-------------|
| `make build` | Crée la bibliothèque statique et l'exécutable de test |
| `make test` | Exécute la suite de tests shell (17 tests) |
| `make debug` | Build avec symboles de débogage |
| `make clean` | Supprime les fichiers objets |
| `make fclean` | Supprime tous les fichiers générés |
| `make re` | Reconstruction complète |
| `make help` | Affiche l'aide |

### Flags de compilation

```makefile
CC       = gcc
CFLAGS   = -Wall -Werror -Wextra -pedantic -std=gnu89
CPPFLAGS = -D_POSIX_C_SOURCE=200809L
```

---

## Qualité du code & Implémentation

### Noms de variables améliorés

Tous les noms de variables sont explicites et significatifs :

| Ancien nom | Nouveau nom | Objectif |
|-----------|------------|---------|
| `index1` | `current_pos` | Position courante dans la chaîne de format |
| `index2` | `spec_index` | Index dans le tableau des spécificateurs |
| `count` | `chars_printed` | Nombre total de caractères imprimés |
| `i` | `current_index` / `binary_index` | Index de boucle (contexte-spécifique) |

### Noms de structures

- `t_print_format` → `t_format_handler` (plus descriptif)

### Caractéristiques principales

✓ **Fonctions variadiques**: Utilisation de `va_list` et `va_arg`
✓ **Pointeurs de fonction**: Correspondance spécificateurs-gestionnaires
✓ **Récursion**: Conversion entier vers chaîne
✓ **Gestion d'erreurs**: Cas spéciaux comme INT_MIN
✓ **Tests complets**: 17 tests automatisés avec 100% de réussite
✓ **Système de build professionnel**: Makefile bien organisé
✓ **Documentation appropriée**: Commentaires et définitions de types

---

## Tests

### Exécuter les tests

```bash
# Utiliser le Makefile
make test

# Ou directement
bash tests/run_tests.sh
```

### Suite de tests (17 tests)

✓ **Tests de compilation** (4 tests)
- Existence du Makefile
- Reconstruction du projet
- Création d'exécutable
- Création de bibliothèque

✓ **Tests de fonctionnalité** (10 tests)
- Impression de caractères (%c)
- Impression de chaînes (%s)
- Impression d'entiers (%d)
- Impression en binaire (%b)
- Signe de pourcentage (%%)
- Gestion des chaînes NULL
- Entiers négatifs
- Zéro en binaire
- Spécificateurs mixtes
- Vérification de la valeur de retour

✓ **Tests de qualité de code** (3 tests)
- Existence des fichiers source
- Présence des header guards
- Documentation des fonctions

**Résultat**: 17/17 tests réussis (100% de taux de réussite)

---

## Comment ça fonctionne ?

1. **Analyser la chaîne de format**: `_printf` lit la chaîne caractère par caractère
2. **Trouver les spécificateurs**: Quand il rencontre `%`, il identifie le spécificateur
3. **Dispatcher le gestionnaire**: Appelle la fonction appropriée
4. **Compter les caractères**: Accumule le total de caractères imprimés
5. **Retourner le compte**: Retourne le nombre total de caractères écrits

### Gestionnaires de formats supportés

- `%c` → `print_char_path()` → `print_char()`
- `%s` → `print_string_path()` → `print_string()`
- `%d` / `%i` → `print_int_path()` → `print_int()`
- `%b` → `print_binary_path()` → `print_binary()`
- `%%` → `print_percent_path()`

---

## Mémoire & Valgrind

Pour vérifier les fuites mémoire :

```bash
# Compiler avec symboles de débogage
make debug

# Exécuter avec Valgrind
valgrind --leak-check=full --show-leak-kinds=all ./bin/printf_test
```

Attendu: **Aucune fuite mémoire détectée**

---

## Pages man

```bash
# Version anglaise
man ./docs/_printf.1.en

# Version française
man ./docs/_printf.1.fr
```

---

## Aperçu des fichiers du projet

| Fichier | Description |
|---------|-------------|
| `src/_printf.c` | Fonction principale - analyse les chaînes de format et dispatche les gestionnaires |
| `src/print_char.c` | Fonctions d'impression de caractères et chaînes |
| `src/print_number.c` | Impression d'entiers avec récursion |
| `src/print_binary.c` | Conversion de représentation binaire |
| `src/print_percent.c` | Gestionnaire du signe de pourcentage |
| `src/main.h` | Prototypes de fonctions et définitions de structures |
| `src/main.c` | Programme de test démontrant la fonctionnalité |

---

## Résultats d'apprentissage

Ce projet démontre:
- Les fonctions variadiques en C et la gestion des arguments
- L'utilisation de pointeurs de fonction et callbacks
- Les algorithmes récursifs
- L'automatisation Makefile et les processus de build
- Les scripts shell pour les tests
- L'organisation professionnelle du code
- La conformité au style Betty
- Les pratiques de test complet

---

## Auteurs

- Lucas METTETAL
- Auxance JOURDAN

---

## Licence

Ceci est un projet de l'école Holberton.

*Dernière mise à jour : 8 janvier 2026*

---

[Aller à la version anglaise →](README.en.md)
