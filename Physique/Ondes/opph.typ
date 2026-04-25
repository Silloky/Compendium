#import "../../blocks.typ": *

#import "@preview/unify:0.8.0": *

#definition("OPPH")[
  On appelle onde _progressive plane harmonique_ une onde dont la fonction est de la forme :
  $ s(x,t) = S cos(phi_p (x, t)) "avec" phi_p (x,t) = omega t plus.minus k x + phi_0 $
  Où :
  - $phi_p$ : phase de l'onde #sym.arrow $unit("rad")$
  - $S$ : amplitude #sym.arrow $[s]$
  - $omega$ : pulsation (temporelle) #sym.arrow $ unit("rad/T")$
  - $k$ : pulsation spatiale #sym.arrow $unit("/L")$
  - $phi_0$ : phase à l'origine #sym.arrow $unit("rad")$
]


#formulaire("Propriétés ondulatoires", true, none, box(flexwrap(
  main-spacing: 1em,
  flex: (1fr, 1fr, 1fr, 100%, 100%),
  cross-spacing: 1.4em,
  
  align(center, [Période temporelle $ T = (2 pi) / omega $]),
  align(center, [Période spatiale $ lambda = (2 pi) / k $]),
  align(center, [Fréquence spatiale $ sigma = 1/lambda = k/(2 pi) $]),
  align(center, "Formules pour la phase dans la fonction d'onde"),

  $ phi_p (x,t) &= omega t plus.minus k x + phi_0  \ 
  &= omega(t - x/c) + phi_0 \
  &= -k(x - c t) + phi_0 \
  phi_p (x,t) &= 2 pi (t/T - x/lambda) + phi_0 \
  $
)))