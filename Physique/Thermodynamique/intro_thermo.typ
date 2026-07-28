#import "../../blocks.typ": *
#import "@preview/fancy-units:0.1.1": *

=== Etats de la matière

Parmi les verres, les ges, les cristaux liquides, on trouve surtout : l'état *solide* (atomes limités à des vibrations de max. $#qty[1e-11][m]$), et l'état *fluide* (molécules sont en désordre, liberté de mouvement totale)
\ Pour les corps purs, on peut définir des sous-types de fluides : les liquides (concentration $> #qty[10][mol/L]$) et les gaz.

#table(
  columns: (auto, 1fr, 1fr),
  rows: (auto, auto, auto),
  align: center,
  stroke: 0.4pt,
  [*Type*], [*Concentration moléculaire*], [*Distance entre molécules*],
  "Liquide", $> #qty[10][mol/L]$, "Diamètre d'une molécule",
  "Gaz", [$<< #qty[1][mol/L]$ si $P < #qty[10][bar]$], "Grand devant le diamètre"
)

=== Systèmes et variables d'état

On appelle _extérieur_ tout ce qui ne fait pas partie d'un système donné.

*Fermé* : ensemble d'entités microscopiques (défini à l'instant initial) qui n'échange pas de matière avec l'extérieur au cours du temps.

*Isolé* : fermé, qui n'échange pas d'énergie avec l'extérieur.

*Ouvert* : volume d'étude, de délimitation imaginaire, duquel des échanges avec l'extérieur peuvent avoir lieu.

Une fonction de 3 variables d'état (#ie $f(P, V, T)$) permet de caractériser un état avec seulement 2 paramètres.

=== Grandeurs extensives et intensives

Soit $Sigma$ un système et $G$ une grandeur sur $Sigma$, $G_1$ et $G_2$ les analogues sur des sous-systèmes $Sigma_1$ et $Sigma_2$.
On dit que $G$ est :
- *extensive* : si $G = G_1 + G_2$ (#ex volume d'un fluide, longueur d'un fil)
- *intensive* : si $G = G_1 = G_2$ (#ex température, pression)

On a : $["extensive"] times ["intensive"] = ["extensive"]$

Si $A$ est extensive, les grandeurs $a = A/m$ et $A_m = A/n$ sont intensives



