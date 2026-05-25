#import "../../blocks.typ": *

=== Isothermes

Un transformation isotherme est toujours lente, donc quasi-statique.
On a :
$ W_(12) = - int_(V_1)^(V_2) P dif V = - int_(V_1)^(V_2) n R T (dif V)/V = -n R T ln(V_2 / V_1) = - P_1 V_1 ln(V_2/V_1) $
De plus $#D T = 0$ donc $#D U = 0$. D'où $Q_(12) = - W_(12)$

=== Adiabatiques quasi-statiques (AQS)

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

// === Compressibilité

