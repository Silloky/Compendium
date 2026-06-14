#import "../../blocks.typ": *
#import "@preview/fancy-units:0.1.1": *

On note $Omega$ le nombre de micro-états accessibles par un système de macro-état donné de $N$ constituants dans un volume $V$. Alors $Omega prop U^(3/2 N) V^N$.
\ On définit l'entropie :
$ S = k_B ln(Omega) "    " = k_B ln(U^(3/2 N) V^N dot "cste") = k_B N (3/2  ln(U) + ln(V)) + "cste" $

Donc l'entropie dépend de l'énergie interne et du volume, c'est donc une fonction d'état. De plus $S prop N$ donc c'est une grandeur extensive.

#theoreme(": Deuxième principe")[
  A tout système physique est associée une grandeur appelée *entropie* :
  1. L'entropie est *extensive*
  2. Elle est une *fonction d'état*
  3. L'entropie d'un système isolé thermiquement croît avec le temps. C'est une grandeur *non conservative*.
]

Une transformation est *réversible* #ssi on peut revenir à l'état initial en suivant le même chemin (#ie en passant par les mêmes états intermédiaires).
$ "Réversible" #stack(dir: ttb, math.arrow.double.long.r, math.cancel[#math.arrow.double.long.l]) "Quasi-statique" $

Une transformation est *isentropique* #ssi elle est AQS.

=== Température et identités

On définit la température par $display(1/T = lr(pder(S, U) |)_(V))$ soit encore $1/(k_B T) = lr(pder(ln Omega, U) |)_(V)$.

Ainsi $k_B = #qty[1.38e-23][J]$ détermine l'échelle de température : $ (k_B <- 2k_B) ==> (T <- 1/2 T) $
L'entropie est une fonction d'état donc on peut écrire :
$ dif S = lr(pder(S, U) |)_V dif U + lr(pder(S, V) |)_U dif V = (dif U)/T + lr(pder(S, V) |)_U dif V $
Puisqu'elle ne dépend que de l'état choisi, on peut utiliser le cas particulier d'une transformation AQS pour déterminer le second terme.
\ Alors $dif S = 0$ et $dif U = delta W = - P dif V$ d'où $lr(pder(S, V) |)_U = P/T$.

On obtient finalement les *relations de Gibbs* :
#flexwrap(
  flex: (1fr, 1fr),
  $ dif U = T dif S - P dif V $,
  $ dif H = T dif S + V dif P $
)

Pour une transformation *quasi-statique*, on peut identifier : $display(dif S = (delta Q)/T)$

=== Variations d'entropie

==== Gaz parfait

En intégrant les relations de Gibbs :
$ #D S = C_V ln((T_2 V_2^(gamma-1))/(T_1 V_1^(gamma-1))) = C_P ln((T_2 P_2^((1-gamma)/gamma))/(T_1 P_1^((1-gamma)/gamma))) = C_V ln((P_2 V_2^gamma)/(P_1 V_1^gamma)) $

Dans le cas d'une transformation AQS, $#D S = 0$, et on retrouve les lois de Laplace. Sinon, puisque $#D S > 0$, on a $P V^gamma$ qui augmente.

==== Monophasé quelconque

//En négligeant les variations de $C_V$ et $C_P$ :
#flexwrap(
  flex: (1fr, 1fr),
  align(center, [
      Isochore \ $display(#D S = C_V ln(T_2/T_1))$
    ]),
  align(center, [
      Isobare \ $display(#D S = C_P ln(T_2/T_1))$
    ])
)

==== Phase condensée

On a $C_p sim C_v = C$ et $dif V << 1$, donc $T dif S = dif U sim C dif T$. D'où : $display(#D S = C ln(T_2 / T_1)) $

==== Thermostats

On a $display(#D S = - Q/T_"therm")$\ 
Pour que l'échange soit réversible, les températures des deux systèmes doivent être égales à tout instant. La réversibilité est d'autant meilleure que le nombre d'équilibres intermédiaires est grande.

=== Inégalité de Clausius

#flexwrap(
  flex: (1fr, 1fr),
  align(center, [
      Monotherme#v(0.5mm)$display(dif S = (delta Q)/T_"ext" + underbrace(delta S_C, >= 0))$
    ]),
  align(center, [
      Polytherme#v(0.5mm)$display(dif S = sum_i (delta Q_i)/T_("ext,"i) + underbrace(delta S_C, >= 0))$
    ])
)