#import "../../blocks.typ": *

Pour des SLCI plus complexes, il faut utiliser utiliser la transformée de Laplace pour trouver la solution de l'équation différentielle.

=== Définition

#definition("Fonction de transfert")[
  Soit un SLCI linéaire dont l'entrée est $e(t)$ et la sortie $s(t)$. On suppose que les conditions initiales sont nulles (hypothèse de Heaviside).
  \ La fonction de transfert du système est définie par :
  $ H(p) = frac(S(p), E(p)) $
  Où $S(p)$ et $E(p)$ sont respectivement les transformées de Laplace de la sortie $s(t)$ et de l'entrée $e(t)$.
]

Toute fonction de transfert peut être mise sous la forme canonique suivante :
$ H(p) = K/p^alpha (1+ b_1 p + b_2 p^2 + ... + b_n p^n)/(1+ a_1 p + a_2 p^2 + ... + a_m p^d) $
On appelle :
- $K$ le *gain statique* du système, de dimension $[S]/[E]$
- $alpha$ la *classe* du système, un entier naturel
- $d + alpha$ l'*ordre* du système, un entier naturel

D'après les propriétés de la transformée de Laplace, la classe $alpha$ est le nombre d'intégrateurs dans le système.

=== Formes canonique

#propriete("Fonctions de transfert")[
  On obtient pour les 3 premiers ordres les formes canoniques suivantes :
  
  #box(
    flexwrap(
      main-spacing: 2em,
      $ H_0(p) = K $,
      $ H_1(p) = K/(1+ tau p) $,
      $ H_2(p) = K/(1 + (2 xi)/omega_0 p + 1/omega_0^2 p^2) $
    )
  )
]

#preuve()[
  C'est évident à partir des #link(<SLCI-ED-1>, "équations différentielles") associées à ces fonctions de transfert.
]

=== Systèmes bouclés

#propriete("")[L'association en série de plusieurs fonctions de transfert correspond au produit de ces fonctions de transfert. \ L'association en parallèle correspond à la somme de ces fonctions de transfert.]

// #definition("")[
//   - #si.ftbf : FT du système en boucle fermée
//   - #si.ftcd : FT de la chaîne directe 
//   - #si.ftcr : FT de la chaîne de retour
//   - #si.ftbo = #si.ftcd #si.ftcr : FT du système en boucle ouverte
// ]

// #image("assets/ftbf-ftcd-ftcr.png")
// #image("assets/ftbo-ftcd-ftcr.png")

#theoreme(": Formule de Black")[
  $ si.ftbf = si.ftcd/(1 + si.ftbo) = si.ftcd/(1 + si.ftcd si.ftcr) $
]