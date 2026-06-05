#import "../../blocks.typ": *

#theoreme(": Premier principe")[
  A tout système physique est associée une grandeur appelée énergie *interne* :
  1. L'énergie interne est *extensive*
  2. Elle est une *fonction d'état*
  3. L'énergie totale d'un système est la somme de son énergie macroscopique et de  son énergie interne. C'est une grandeur *conservative*.
]

Le bilan d'énergie s'écrit : $dif E + dif U = delta W + delta Q$. 

On appelle *enthalpie* la grandeur $H = U + P V$.


=== Travail

On considère une partie de frontière mésoscopique autour d'un point $M$, de surface $delta S$ et de normale $vc(n)$ (sortant du fluide). Elle exerce sur les molécules du fluide une force $delta vc(F)_"ext" = -P(M) delta S vc(n)$.

Si la surface se déplace, la force travaille ($delta W = delta vc(F)_"ext" dot dif vc(O M) $) et vaut le volume balayé $delta V_B$ multiplié par la pression : $delta W = plus.minus P(M) delta V_B$.

Si la pression est uniforme sur la surface, on a en intégrant : $delta W = -P_F dif V$.

On suppose la *pression uniforme dans le fluide*. Alors :
$W = - int_(V_1)^(V_2) P dif V $

Le travail est égal à :
- l'aire sous la courbe de Clapeyron pour une compression
- son opposé pour une détentex  

Dans le cas d'un cycle, le travail est égal :
- l'aire du cycle pour une compression (#ie sens trigonométrique)
- son opposé pour une détente (#ie sens horaire)

Pour une transformation :
- isochore : $W = 0$
- isobare : $W = -P #D V$

=== Transfert thermique

La puissance thermique $cal(P)_"th"$ est (positivement) proportionnelle à $#D T$.

Une frontière est *diatherme* si elle est infiniment conductrice de chaleur.

Une transformation :
- isotherme : lente, en contact avec un thermostat, $Q eq.not 0$
- adiabatique : rapide, sans contact avec un thermostat, $Q eq 0$, $#D T eq.not 0$

Pour une transformation :
- isochore : $W = 0$, donc $Q = #D U$.
- isobare : $Q = #D U - W = (U_2 + P_2 V_2) - (U_1 + P_1 V_1) = #D H$


=== Capacités thermiques

Pour un fluide quelconque, on a :

#box(flexwrap(
  flex: (1fr, 1fr),
  $ dif U = underbrace(lr(pder(U, T) |)_V, C_V) dif T + lr(pder(U, V) |)_T dif V $,
  $ dif H = underbrace(lr(pder(H, T) |)_P, C_P) dif T + lr(pder(H, P) |)_T dif P $,
))
En supposant que :
- $U$ ne dépend pas du volume, on a la *capacité thermique isochore*.
- $H$ ne dépend pas de la pression, on a la *capacité thermique isobare*.

Pour un gaz parfait, on pose $gamma = C_P/C_V$ et on a $H = U + n R T$.
\ Donc $der(H, T) = der(U, T) + n R$, d'où la *relation de Mayer* :

#box(flexwrap(
  flex: (1fr, 1fr, 1fr),
  $ C_(P_m) - C_(V_m) = R $,
  $ C_(V_m) = R/(gamma -1) $,
  $ C_(P_m) = (R gamma)/(gamma -1) $,
))

Le rapport $gamma$ vaut :
- $5\/3$ pour un gaz parfait monoatomique,
- $7\/5$ pour un gaz parfait diatomique
- $9\/7$ pour un gaz parfait triatomique

Pour une *phase condensée* (#ie liquide ou solide), $P V << U$ donc :
$ dif U = C_V dif T approx dif H = C_P dif T "   donc   " C_P approx C_V $

=== Transformations isothermes et loi de Laplace

==== Isothermes

Un transformation isotherme est toujours lente, donc quasi-statique.
On a :
$ W_(12) = - int_(V_1)^(V_2) P dif V = - int_(V_1)^(V_2) n R T (dif V)/V = -n R T ln(V_2 / V_1) = - P_1 V_1 ln(V_2/V_1) $
De plus $#D T = 0$ donc $#D U = 0$. D'où $Q_(12) = - W_(12)$

==== Adiabatiques quasi-statiques (AQS)

D'après le premier principe : $dif U = delta W + 0 = -P dif V = - n R T (dif V)/V$.

Or le gaz étant parfait, on a $dif U = C_V dif T = (n R)/(gamma -1) dif T$.

En simplifiant, il vient : $(gamma -1) (dif V)/V + (dif T)/T = 0$, soit en intégrant :

#box(flexwrap(
  flex: (1fr, 1fr, 1fr),
  $ T_2/T_1 = (V_1 / V_2)^(gamma -1) $,
  $ P_2/P_1 = (V_1 / V_2)^gamma $,
  $ T_2/T_1 = (P_2/P_1)^((gamma -1)/gamma) $
))

La *loi de Laplace* s'écrit aussi :

#box(flexwrap(
  flex: (1fr, 1fr, 1fr),
  $ P V^gamma = "cste" $,
  $ T V^(gamma -1) = "cste" $,
  $ T P^((1-gamma)/gamma) = "cste" $
))

Par définition, $Q_12 = 0$, et :
$ W_12 = C_V (T_2 - T_1) = (n R)/(gamma -1) (T_2 - T_1) = (P_2 V_2 - P_1 V_1)/(gamma -1) $

=== Compressibilité