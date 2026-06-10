#import "../../blocks.typ": *

#table(
  align: center,
  columns: (1fr, 1fr, 1fr, 1fr),
  [Système], [Temps continu], [Temps discret], [Séquentiel],
  [Entrée], $t in RR_+$, $t_k in T_e NN$, $k in NN$,
  [Sortie $s in RR$], [Analogique], [Echantillonée], $times$,
  [Sortie $n in NN$], [Quantifiée], [Numérique], $times$,
  [Sortie $a in {0,1}$], $times$, $times$, [Séquentielle]
)

On appelle *système (logique) combinatoire* un système tel qu'à toute combinaison d'entrées correspond une unique combinaison de sorties.

=== Algèbre de Boole

On considère l'ensemble $B = {0, 1}$ muni des lois :
#flexwrap(
  flex: (1fr, 1fr),
  $ "OR"=plus: cases(B times B &-> B, (a, b) &|-> (a = 1 or b =1)) $,
  $ "AND"=times: cases(B times B &-> B, (a, b) &|-> (a = 1 and b =1)) $,
)

On y ajoute la loi unaire $"NOT"=not$ qui est l'unique telle que $forall a in B, cases(a "OR" not a = 1, a "AND" not a = 0 )$

Cette définition ensemble-centrée rapproche OR et $union$, AND et $inter$ et NOT du complémentaire dans un ensemble $E$, car $cal(P)(E)$ est isomorphe à $B^E$ (#ie les indicatrices de parties de $E$).

Cependant, avec ces lois, $(B, "OR", "AND")$ n'est pas un anneau car ainsi défini, $"OR"$ n'admet pas d'inverse. 

On introduit alors un "ou exclusif" (qui correspond à la différence symétrique $#D$ pour les ensembles) :
$ "XOR"=plus: cases(B times B &-> B, (a,b) &|-> (a "OR" b) and not(a "AND" b)) $
Dans ce cas $(B, "XOR", "AND")$ est un anneau, qui s'identifie à $ZZ\/2ZZ$ muni de ses lois canoniques $+_2$ et $times$. Dans ce cas on a simplement $"NOT": a |-> 1+a$.

=== Machines et diagrammes d'état

Une *action* est un traitement élémentaire (insécable), alors qu'une *activité* peut être interrompu à chaque instant (ou plutôt entre les actions le constituant).

Comportements associés à un état : _entry/action_, _do/activité_ et _exit/action_. \
Indication associées à une transition : _évènement [condition de garde]/effet_.

Il y a plusieurs types d'évènements :
- *de signal* : un front d'une variable binaire (stimulation externe)
- *de temps* : écoulement du temps, notée _after T_ (relatif) ou _at T_ (absolu)
- *de changement* : d'une expression booléenne, noté _when(expr)_

Pour les *points de jonction* (ronds), toutes les conditions de garde sont évaluées en même temps, au départ de l'état, alors que pour les *points de décisions* (losanges), elles sont évaluées au moment à l'arrivée au point.

*Toutes conditions de garde simultanées (menant à des états différents) doivent être mutuellement exclusives.*

Dans un *état orthogonal*, plusieurs états peuvent être actif en même temps, car il y a 2 flux (_linéairement_) indépendants.

Il y a 2 états historiques :
- _shallow_ ou simple : la réactivation d'un état composite interrompu reprend un un niveau de profondeur 1
- _deep_ : réactivation récursive.

#image("assets/etats_brosse_a_dents.png")