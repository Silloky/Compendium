#import "../../blocks.typ": *
#import "@preview/cetz:0.5.0"

#definition("SLCI")[
  On appelle *SLCI* un système :
  - _linéaire_ : les équations qui le régissent sont linéaires (mais pas nécessairement homogènes),
  - _continu_ : les grandeurs qui le caractérisent sont continues,
  - _invariant_ : les équations qui le régissent ne dépendent pas du temps,
  - _à entrée unique_ : il n'y a qu'une seule grandeur d'entrée,
  - _à sortie unique_ : il n'y a qu'une seule grandeur de sortie.
]

On déduit de la linéarité les principes de superposition et de proportionnalité.

#warning()[Ne pas confondre la caractéristique d'un système $s = f(e)$ avec la courbe de réponse en fonction du temps $s(t)$.]

=== Équations différentielles d'ordre 1 <SLCI-ED-1>

#theoreme("SLCI d'ordre 1")[
  Un SLCI d'ordre 1 est caractérisé par une équation différentielle de la forme :
  $ tau der(s(t), t)+s(t) = K e(t) $
  Où :
  - $tau$ est la constante de temps, de dimension $[T]$
  - $K$ est le gain statique, de dimension $[S]/[E]$
]

#propriete("Réponse temporelle à un échelon")[
  On suppose l'entrée de la forme $e(t) = e_0 u(t)$, où $u(t)$ est la fonction de Heaviside.
  Alors :
  $ s(t) = K e_0 (1 - e^(-t/tau)) u(t) $
]

#preuve()[
  On résout l'équation différentielle en utilisant la méthode de variation de la constante.
  \ La solution générale de l'équation homogène associée est $s_h (t) = A e^(-t/tau)$.
  \ En cherchant une solution particulière de la forme $s_p (t) = B$, on trouve $B = K e_0$.
  \ En appliquant les CI, on trouve que $A = -K e_0$.
  Ainsi, la solution complète est :
  $ s(t) = s_h(t) + s_p(t) = K e_0 (1 - e^(-t/tau)) u(t) $
]

*Valeurs remarquables de la réponse à un échelon :*

#align(center, table(
  columns: (auto, auto, auto, auto),
  inset: 5pt,
  align: center,
  $t$, $tau$, $3 tau$, $5 tau$,
  [% de $s_oo$], $63%$, $95%$, $99%$
))

La pente de la tangente à l'origin est non-nulle et vaut $(K e_0) / tau$.

=== Équations différentielles d'ordre 2 <SLCI-ED-2>

#theoreme("SLCI d'ordre 2")[
  Un SLCI d'ordre 2 est caractérisé par une équation différentielle de la forme :
  $ frac(1, omega_0^2) der(s(t), t, n: 2) + frac(2 xi, omega_0) der(s(t), t) + s(t) = K e(t) $
  Où :
  - $omega_0$ est la pulsation propre (_non amortie_), de dimension $[T^(-1)]$
  - $xi$ est le coefficient d'amortissement, sans dimension
  - $K$ est le gain statique, de dimension $[S]/[E]$
]

Il faut distinguer trois cas selon la valeur de $xi$ :

==== Régime apériodique ($xi > 1$)

La solution est de la forme, en prenant des conditions initiales nulles :
$ s(t)= K e_0 [ 1 - frac(1, T_1-T_2) (T_1 e^(-t/T_1) - T_2 e^(-t/T_2) ) ] u(t) $
Où $T_1$ et $T_2$ sont les constantes de temps du système, données par :
$ T_(1,2)=frac(1, xi omega_0 plus.minus omega_0 sqrt(xi^2-1)) $

#propriete("")[
  - La sortie tend vers sa valeur finale $s_oo = K e_0$ de manière monotone.
  - La pente de la tangente à l'origine est nulle.
  - Plus $xi$ est proche de $1$, plus la réponse est rapide.
  - Si $abs(T_2) >> abs(T_1)$, la réponse peut être approchée par une réponse du premier ordre de constante de temps $T_2$ _(avec un retard égal à $T_1$)_.
]

==== Régime critique ($xi = 1$)

Dans l'hypothèse des conditions initiales nulles, la solution est de la forme :
$ s(t)= K e_0 [ 1- (omega_0 t +1) e^(-omega_0 t) ] u(t) $

Il s'agit d'un cas particulier du régime apériodique, ainsi les propriétés sont identiques.

==== Régime pseudo-périodique ($xi < 1$)

Si les conditions initiales sont nulles, la réponse est de la forme :
$ s(t)= K e_0 [ 1 - 1/sqrt(1-xi^2) e^(-xi omega_0 t) sin(omega_p + phi)] u(t) $
Où :
- $omega_p = omega_0 sqrt(1-xi^2)$ est la _pseudo-pulsation_ de dimension $[T^(-1)]$,
- $phi = arctan(sqrt(1-xi^2)/xi)$ le _déphasage_ sans dimension 
On note aussi $T_p = (2 pi)/ omega_p$ la _pseudo-période_ de dimension $[T]$.

La réponse est visiblement oscillante, et présente donc des dépassements.
Le temps du $k$-ième dépassement est donné par :
$ t_k = k/2 T_p = (k pi)/ omega_p = (k pi)/(omega_0 sqrt(1-xi^2)) $
Et le $k$-ième dépassement relatif vaut : $D_k^%= abs((s(t_k) - s_oo)/s_oo)=e^(-xi t_k)$.

Pour l'identification de $xi$, on a alors : $xi = (1+ (k^2 pi^2)/(ln^2 (D_k^%)))^(-1/2) $

#propriete("")[
  - Plus $xi$ est petit, plus les dépassements sont importants.
  - La réponse tend vers sa valeur finale $s_oo = K e_0$ de manière oscillante.
  - La pente de la tangente à l'origine est nulle.
  - Plus $xi$ est proche de $0.69$, plus la réponse est rapide. Le premier dépassement est alors d'environ $5%$.
]

=== Schéma-bloc acausal

Le schéma-bloc standard d'un servomécanisme motorisé est :

#figure(
  caption: "Asservissement de vitesse",
  kind: "schema-bloc",
  supplement: "Schéma-Bloc"
)[
  #cetz.canvas({
    import cetz.draw: *

    content((0,0), box(stroke: 0.5pt, inset: 5pt)[Adaptateur], name: "Adaptateur")
    
    circle((2.5, 0), radius: 0.5, stroke: 0.5pt, fill: white, name: "Comparateur")
    line((2.1, 0.3), (2.9, -0.3), stroke: 0.5pt)
    line((2.9, 0.3), (2.1, -0.3), stroke: 0.5pt)
    content((2.5,-0.25), [#sym.minus])
    content((2.2, 0), [#sym.plus])

    line("Adaptateur.east", "Comparateur.west", stroke: 0.5pt, mark: (end: ")>"))
    content((1.55, 0.3), [$u_c$])

  })
]