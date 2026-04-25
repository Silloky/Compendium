#import "../../blocks.typ": *

#theoreme(": Série de Fourier")[
  Tout signal périodique $s$ peut être représenté par une somme de fonctions sinusoïdales de fréquences multiples de la fréquence fondamentale du signal $f$.
  $ s(t)= S_0 + sum_(n=1)^oo S_n cos(n 2 pi f + phi_n) $
]

#definition("")[
  On appelle _fonction d'onde_ au sens de d'Alembert une fonction de deux variables $s(x, t)$ vérifiant l'équation suivante :
  $ pder(s, x, n: 2) = 1/c^2 pder(s, t, n: 2) $
]

Si une onde vérifie cette équation aux dérivées partielles, alors le milieu qu'elle traverse est dit _linéaire_ et _non dispersif_.

#theoreme("")[
  Toute solution de l'équation de d'Alembert peut être exprimée comme :
  - une fonction de la position, pour une onde se propageant dans le sens...
    - positif de l'axe $x$: $s(x, t) = f(x - c t)$
    - négatif :  $s(x,t)=f(x+ c t)$
  - une fonction du temps, pour une onde se propageant dans le sens...
    - positif de l'axe $x$: $s(x, t) = g(t - x/c)$
    - négatif :  $s(x,t)=g(t+ x/c)$
]

#propriete("Décalages", box(flexwrap(
  main-spacing: 1em,
  flex: (1fr, 1fr),
  
  align(center,[Décalage *temporel* $ s(x_1, t) = s(x_2, t + (x_2-x_1)/c) $]),
  align(center, [Décalage *spatial* $ s(x, t_1) = s(x + c(t_2 - t_1), t_2) $])
)))

