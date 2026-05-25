#import "../../blocks.typ": *
#import "@preview/fancy-units:0.1.1": *

=== Description et conformité du modèle

Les courbes isothermes sur le diagramme d'Amagat sont des lignes (_considérées_) horizontales pour des pressions inférieures à $#qty[10][bar]$.
\ De plus, à température et quantités de matière fixées $T$ et $n$, pour tous les gaz, on a la *loi de Mariotte* :
$ P V stretch(->)_(P -> 0) R times n T "avec" R = #qty[8.314][J/K/mol] $

#definition("Gaz parfait")[
  Gaz théorique qui à toutes pressions et températures respecte la loi de Mariotte, #ie qui suppose aucune interaction entre les molécules qui le composent.
]

Pour un gaz réel, l'approximation est d'autant meilleure que $P/T$ est petit.

On appelle *atomicité* d'un gaz le nombre d'atomes par molécule.

On définit le volume molaire, le volume massique, la masse volumique, la densité :
#block(flexwrap(
  flex: (1fr, 1fr, 1fr, 1fr),
  $ V_m = V/n = (R T)/P $,
  $ v = V_m / M = (R T)/(M P) $,
  $ mu = 1/v = (M P)/(R T) $,
  $ d = mu_"gaz"/mu_"air"=M/M_"air" $
))


=== Point de vue cinétique de la pression

Soit un gaz parfait contenu par une paroi et $vc(u_x)$ un vecteur normal (et orienté vers) à la paroi. On ne considère que les molécules dont le vecteur vitesse est colinéaire et de même sens à $vc(u_x)$.

*Hypothèses simplificatrices* :
- Le gaz est macroscopiquement au repos et uniforme
- La distribution des vecteurs est *isotrope* #ie chaque couple (direction, sens) a une fréquence d'$1\/6$.
- Les vecteurs vitesses sont de même norme $v$
- Le gaz est en équilibre thermique avec la paroi : les molécules repartent dès qu'elles arrivent.

Les molécules qui arrivent sur une surface $delta S$ entre les instants $t$ et $t + dif t$ étaient contenues à l'instant $t$ dans un cylindre de base $delta S$ et de hauteur $v dif t$. Donc : $ delta N = (v dif t delta S)/V dot N/6 $
Chacune arrive avec une quantité de mouvement $m v vc(u_x)$ et repart avec $-m v vc(u_x)$. Il y a eu transfert de $+2 m v vc(u_x)$ à la paroi, #ie au total :
$ delta vc(p) =  2m v vc(u_x) dot delta N =  1/3 m N/V v^2 delta S dif t vc(u_x) "    d'où la force    " delta vc(F) = (delta vc(p))/(dif t) = (N m v^2)/(3 V) dot delta S vc(u_x) $

On pose l'*énergie cinétique de translation* $epsilon = 1/2 m v^2$ et on identifie avec la définition de la pression $delta vc(F) = P dot delta S vc(u_x)$ :
$ P = (N m v^2)/(3V) "   d'où   " P V = 2/3 N epsilon $

En considérant la moyenne statistique $avg(epsilon)$ pour palier aux inégalités de masse #etc, et en introduisant la *constante de Boltzmann* $k_B = R/cal(N)_A$, on a :
$ n R T = P V = 2/3 N avg(epsilon) "   d'où    " avg(epsilon) = 3/2 k_B T $

Si on note $v^* = sqrt(avg(v^2))$ la *vitesse quadratique moyenne*, on a :
$ 1/2 m (v^*)^2 = 1/2 m avg(v^2) = avg(epsilon) "   d'où   " v^* = sqrt((3 k_B T)/(m)) = sqrt((3 R T)/M) $

On remarque qu'elle ne dépend pas de la pression, seulement de la température.


=== Energie interne des gaz

On appelle *énergie cinétique d'agitation thermique* la somme des énergies cinétiques de _translation_ (vue ci-dessus), de _rotation_ et de _vibration_. Il n'y pas d'énergie potentielle car pas d'interaction au sein d'un gaz parfait.
\ L'énergie totale, dite *interne* et notée $U$, est juste l'énergie cinétique, qui dépend uniquement d'après la *première loi de Joule* de la température.

On définit la *capacité thermique isochore* (#ie à volume constant), qui est extensive, et ses dérivées molaires et massiques, intensives :
#block(flexwrap(
  flex: (1fr, 1fr, 1fr),
  $ C_V = der(U, T) $,
  $ C_(V m) = C_V/n = 1/n der(U, T) $,
  $ c_v = C_V/m = 1/m der(U, T) $,
))

A température donnée, l'énergie interne est d'autant plus grande que l'atomicité du gaz, car plus il y a d'atomes par molécule, plus il y a de vibrations possibles.

Pour un gaz parfait monoatomique, il n'y a que l'énergie cinétique de translation :
$ U = sum_i 1/2 m_i v_i^2 = N avg(epsilon) = 3/2 N k_B T = 3/2 n R T $
Si le gaz est biatomique, avec $#qty[300][K] <= T <= #qty[600][K]$, on a environ : $U approx 5/2 n R T$.

// \ Sur un grand intervalle de température, on ne peut pas considérer $C_(V m)$ constant :
// $ #D U = integral_(T_1)^(T_2) n C_(V m) dif T  $


=== Statistique de Maxwell-Boltzmann

En supposant l'homogénéité, l'isotropie et l'équilibre thermodynamique du gaz, on obtient un *nuage de points* à symétrie sphérique (dans un repère des vitesses).

On pose $N_0$ le nombre de molécules dans l'échantillon et $N(u)$ le nombre de molécules ayant une vitesse de norme inférieure à $u$, #ie le total du nombre de point dans la sous-sphère de rayon $u$.

La densité statistique est la dérivée de $N$ par rapport à $u$ et est de la forme :
$ N'(u) = A u^2 e^(- (m u^2)/(2k_B T)) "   avec "A" tel que   "integral_0^oo N'(u) = N_0 $

Le coefficient $e^(- (m v^2)/(2k_B T))$ est appelé *facteur de Boltzmann*.

Cette définition pour $A$ permet d'obtenir des courbes de distribution normale. 
\ La vitesse où $N'(u)$ est maximale est la vitesse la plus probable, et elle est du même ordre de grandeur que la vitesse quadratique moyenne $v^*$.