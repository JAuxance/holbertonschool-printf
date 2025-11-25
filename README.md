🖨️ holbertonschool-printf

Reproduction de la fonction printf du langage C dans le cadre du cursus Holberton School.
Ce projet consiste à réimplémenter une version simplifiée (mais fonctionnelle) de printf, en gérant plusieurs spécificateurs de format et en respectant les contraintes techniques imposées.

🎯 Objectif

Créer une fonction :

int _printf(const char *format, ...);


qui affiche du texte formaté dans la sortie standard, en gérant différents types d’arguments variadiques.

🛠️ Fonctionnalités prises en charge

Votre _printf doit gérer au minimum :

Spécificateur	Description
%c	Affiche un caractère
%s	Affiche une chaîne de caractères
%d / %i	Affiche un entier signé
%%	Affiche le caractère %

Selon votre progression, vous pouvez ajouter d'autres spécificateurs :

%b → conversion en binaire

%u → unsigned int

%o → octal

%x / %X → hexadécimal

%p → pointeur

etc.

📁 Organisation du projet

Exemple de structure typique du repo :

holbertonschool-printf/
│
├── _printf.c
├── get_func.c
├── functions.c
├── functions2.c
├── main.h
├── README.md
└── man_3_printf

📌 Contraintes

Pas d’utilisation de la fonction printf standard.

Seulement les appels système autorisés (write, malloc, free, etc.).

Respect strict des normes Holberton (Betty).

Gestion correcte des arguments variadiques (va_list, va_start, va_arg, va_end).

Le projet doit renvoyer le nombre de caractères imprimés.

🚀 Compilation

Compiler avec :

gcc -Wall -Werror -Wextra -pedantic *.c -o printf

🧪 Exemple d'utilisation
_printf("Hello %s! You are %d years old.\n", "Lucas", 26);


Sortie :

Hello Lucas! You are 26 years old.

🧑‍🤝‍🧑 Auteurs

Projet réalisé dans le cadre du programme Holberton par :

Lucas Mettetal
Auxance Jourdan
