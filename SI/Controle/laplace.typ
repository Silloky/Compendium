#import "../../blocks.typ": *

#definition("")[
  Soit $f$ une fonction du temps $t$, définie sur $RR$.
  Sous réserve d'existence, on note $F(p)$ la transformée de Laplace $cal(L){f(t)}$ de la fonction $f(t)$, définie par :
  $ f(t) stretch(->)^cal(L) F(p)= limits(integral)_(t=0)^oo f(t) e^(-p t) dif t $
  Où $p$ est une variable complexe.
]

#formulaire("Transformées de Laplace usuelles", true, none)[
  #block(
    flexwrap(
      flex: (1fr, 1.3fr),
      table(
        columns: (auto, auto),
        table.header($x(t)$, $X(p)$),
        stroke: 0.6pt,
        [$delta(t)$ (Dirac)], $ 1 $,
        $ A u(t) $, $ A/p $,
        $ a t dot u(t) $, $ a/p^2 $,
        $ e^(-a t) dot u(t) $, $ 1/(p+a) $,
      ),
      table(
        columns: (auto, auto),
        table.header($x(t)$, $X(p)$),
        stroke: 0.6pt,
        $ t e^(-a t) dot u(t) $, $ 1/(p+a)^2 $,
        $ cos(omega t) dot u(t) $, $ p/(p^2 + omega^2) $,
        $ sin(omega t) dot u(t) $, $ omega/(p^2 + omega^2) $,
        $ e^(-a t) dot cos(omega t) dot u(t) $, $ omega/((p+a)^2 + omega^2) $,
      )
    )
  )
]

=== Propriétés générales

#propriete("")[
  1. Bi-univocité :
  $ cal(L){cal(L)^(-1){F(p)}} &= F(p) \  cal(L)^(-1){cal(L){f(t)}} &= f(t) $
  2. Linéarité :
  $ cal(L){lambda f(t) + mu g(t)} &= lambda cal(L){f(t)} + mu cal(L){g(t)} \
  cal(L)^(-1){lambda F(p) + mu G(p)} &= lambda cal(L)^(-1){F(p)} + mu cal(L)^(-1){G(p)}
  $
]

#preuve()[
  1. *Bi-univocité*
  \ C'est évident à partir de la définition de la transformée avec l'intégrale.

  2. *Linéarité*
  C'est évident avec la linéarité de l'intégrale :
  $ cal(L){lambda f(t) + mu g(t)} &= limits(integral)_(t=0)^oo (lambda f(t) + mu g(t)) e^(-p t) dif t \ &= lambda limits(integral)_(t=0)^oo f(t) e^(-p t) dif t + mu limits(integral)_(t=0)^oo g(t) e^(-p t) dif t  \ cal(L){lambda f(t) + mu g(t)} &= lambda cal(L){f(t)} + mu cal(L){g(t)} $
  De même pour la linéarité de la transformée inverse.
]

#propriete("Transformée d'une dérivée")[
  Soit $f$ une fonction du temps et $n in NN$. On suppose $f$ de classe $cal(C)^n$ sur $RR$.
  Alors :
  $ cal(L){ der(f(t), t)} &= p F(p) - f(0^-) \
  cal(L){ der(f(t), t, n: 2)} &= p^2 F(p) - p f(0^-) - dot(f)(0^-) \
  cal(L){ der(f(t), t, n: n)} &= p^n F(p) - sum_(k=1)^n p^(n-k) f^((k-1))(0^-)
  $
]

#preuve()[
  On prouve par intégration par parties.

  $ cal(L){ der(f(t), t) }  = [f(t) e^(-p t)]_(0^-)^oo + int_(0^-)^oo p f(t) e^(-p t) dif t = p F(p) - f(0^-) $

  $ cal(L){ der(f(t), t, n: 2) } &= [f(t) e^(-p t)]_(0^-)^oo + int_(0^-)^oo p f(t) e^(-p t) dif t \ &= p^2 F(p) - p f(0^-) - dot(f)(0^-) $

  Avec une récurrence, on montre à l'ordre $n$.
]

#propriete("Transformée d'une intégrale")[
  Soit $f$ une fonction du temps et $n in NN$. On suppose $f$ de classe $cal(C)^n$ sur $RR$.
  Alors :
  $ cal(L){ int_0^t f(tau) dif tau} &= frac(F(p), p) \
  cal(L){ int_0^t int_0^tau f(sigma) dif sigma dif tau} &= frac(F(p), p^2) \
  cal(L){ int_0^t ... int_0^(tau_(n-1)) f(sigma) dif sigma ... dif tau} &= frac(F(p), p^n)
  $
]

#preuve()[
  Au premier ordre, par intégration par parties :

  $ cal(L){ int_0^t f(tau) dif tau} &= int_(0^-)^oo int_(0^-)^t f(tau) e^(-p tau) dif tau\  
  &= [ int_(0^-)^t f(tau) dif tau dot e^(-p t)/(-p) dif tau ]_(0^-)^oo + int_(0^-)^oo f(t)/p e^(- p t) dif t \ 
  cal(L){ int_0^t f(tau) dif tau} &= frac(F(p), p) $
]

=== Théorèmes

#theoreme("de la valeur initiale")[
  $ lim_(t -> 0)f(t) = lim_(p -> oo) p F(p) $
]

#preuve()[
  D'après l'expression de la transformée d'une dérivée, on a :
$ cal(L){ der(f(t), t) }  = p F(p) - f(0^-) $
En faisant tendre $p$ vers l'infini, on trouve :
$ lim_(p -> oo) p F(p) = f(0^-) + lim_(p -> oo) underbrace(int_0^oo der(f(t), t) e^(-p t) dif t , stretch(->)_(p ->  oo) 0) = f(0^-) $
]

#theoreme("de la valeur finale")[
  $ lim_(t -> oo)f(t) = lim_(p -> 0) p F(p) $
] <th-valeur-finale>

#preuve()[
  D'après l'expression de la transformée d'une dérivée d'ordre 1, on a :
  $ lim_(p -> 0) int_(0^-)^oo der(f(t), t) e^(-p t) dif t = lim_(p -> 0) p F(p) - f(0^-) $
  Or $lim_(p -> 0) int_(0^-)^oo der(f(t), t) e^(-p t) dif t = [f(t)]_(0^-)^oo = lim_(t -> oo) f(t) - f(0^-)$
  D'où $ lim_(t -> oo)f(t) - f(0^-)= lim_(p -> 0) p F(p) - f(0^-) $
  D'où le résultat.
]

#theoreme("du retard")[
  Soit $f$ une fonction du temps et $tau > 0$. On suppose $f$ nulle dans les temps négatifs.
  Alors :
  $ cal(L){f(t - tau)} = e^(-p tau) cal(L){f(t)} $
]

#preuve()[
  Par changement de variable $sigma = t - tau$, on trouve :
  $ cal(L){f(t - tau)} &= int_(- sigma)^oo f(sigma) e^(-p (sigma + tau)) dif sigma  \ 
  &= e^(-p tau) int_(- tau)^oo f(sigma) e^(-p sigma) dif sigma  \ 
  &= e^(-p tau) int_(0^-)^oo f(sigma) e^(-p sigma) dif sigma  \
  cal(L){f(t - tau)} &= e^(-p tau) cal(L){f(t)} $
]