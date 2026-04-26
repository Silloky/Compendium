#import "../../blocks.typ": *
#import "@preview/fancy-units:0.1.1": *

=== Définitions

#definition("")[
  $attach(X, tl: A, bl: Z)$ est un *nucléide* de symbole $X$, de nombre de masse $A$ et de numéro atomique $Z$.

  $Z$ définit un *élément*, $A$ définit un *isotope*.
]

La masse molaire d'un nucléide est donnée par la formule $M = A #unit[g / mol]$, avec une incertitude relative :
- $< 1%$ pour l'hydrogène
- $< 0.1%$ pour les autres 

On définit l'unité de masse atomique : $u = g/N_A = #qty[1.6605 e-27][kg]$, ce qui permet d'écrire $M = A u$ (avec les mêmes incertitudes).

=== Familles, périodes

Les *colonnes* du tableau périodique sont appelées *familles* d'éléments, les *lignes* sont appelées *périodes*.

Le tableau périodique est organisé en blocs :

- Bloc $s$ : 
  - Colonne 1 : métaux alcalins
  - Colonne 2 : métaux alcalino-terreux
- Bloc $p$ :
  - Colonne 13 : métaux terreux
  - Colonne 14 : carbonides
  - Colonne 15 : azotides
  - Colonne 16 : chalcogènes
  - Colonne 17 : halogènes
  - Colonne 18 : gaz rares
- Bloc $d$ : métaux de transition
- Bloc $f$ : lanthanides et actinides