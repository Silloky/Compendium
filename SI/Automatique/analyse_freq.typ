#import "../../blocks.typ": *

#theoreme(": Transformée de Fourier")[
  Tout signal périodique de pulsation $omega_0$ peut s'écrire sous la forme d'une série :
  $ f(t)= a_0/2 + sum_(k=1)^oo (a_k cos(k omega_0 t) + b_k sin(k omega_0 t)) $
]

// Dans le cas des fonctions causales ($f(t)<0$ pour $t < 0$), la transformée de Fourier revient à celle de Laplace, en posant une variable symbolique $p = j omega$.

La réponse $S(p)$ en régime établi d'un SLCI de fonction de transfert $H$ à une entrée $e(t) = e_0 sin(omega t)$ est donnée par : $s(t)= |H(j omega)| e_0 sin(omega t + arg(H(j omega)))$.

=== Gain, phase et diagrammes de Bode

// On appelle *gain*, exprimé en décibels, la quantité $G_(d B)(omega) = 20 log_10(|H(j omega)|)$.

// On appelle *phase*, exprimée en degrés, la quantité $phi(omega) = arg(H(j omega))$.

#figure(
  caption: "Diagrammes de Bode asymptotiques",
  kind: "table",
  supplement: "Tableau",
)[#image("assets/bode_asymptotique.png", width: 71.5%)]


Pour un SLCI d'ordre 2, si $xi < sqrt(2)/2 = 1/sqrt(2)$, alors le gain admet un maximum à la pulsation dite de *résonance* $omega_r = omega_0 sqrt(1-2xi^2)$. \

Le gain à la résonance vaut alors $G(w_r) = 20 log(K Q_S)$ où $Q_S$ est le *facteur de surtension* : $Q_S = abs(H(j omega_r)/K) = 1/(2xi sqrt(1-xi^2)) approx Q$ le facteur de qualité, pour $xi$ petit.

Quant à la phase, plus $xi$ est petit, plus elle est proche de ses asymptotes.

=== Stabilité et critères de Nyquist et du revers

// Pour déterminer la stabilité de la réponse en fonction de $omega$, on analyse les pôles de la$#si.ftbf$, #ie l'équation caractéristique $1 + #si.ftbo= 0$.

Si la $#si.ftbo (j omega)$ se rapproche trop de $-1$ dans le plan complexe, le module de la #si.ftbf, et la réponse n'est plus forcément bornée.

// Le diagramme de Nyquist fait apparaître le lieu de $#si.ftbo (j omega)$ dans le plan complexe.

#theoreme(": Critère de Nyquist")[
  On note :
  - $P$ le nombre de pôles de #si.ftbo dans le demi-plan droit ($Re(p) > 0$)
  - $N$ le nombre de tours du lieu autour du point $-1$ dans le sens trigonométrique
  - $Z$ le nombre de pôles de #si.ftbf dans le demi-plan droit
  Alors, $Z = P + N$.
]

Ainsi un système est stable si et seulement si $Z = 0$, c'est à dire $N = -P$ ; en particulier, si #si.ftbo est stable, il faut que son lieu ne fasse aucun tour autour de $-1$.

#theoreme(": Critère du revers")[
  Si la #si.ftbo est stable, alors la #si.ftbf est stable si et seulement si le point critique $-1$ n'est pas contenu par le lieu.
]

Sur les diagrammes :
- de Black : le point critique est $(-180°, 0)$
- de Bode : les deux conditions suivantes doivent être vérifiées :
  - $G(omega) < 0$ dB pour $phi(omega) = -180°$
  - $phi(omega) > -180°$ pour $G(omega) = 0$ dB

On appelle :
- *marge de phase* la grandeur $M_phi = 180 + arg(#si.ftbo (j omega_u))$ où $omega_u$ est la _pulsation gain unitaire_ pour laquelle $|#si.ftbo (j omega_u)| = 1$ (#ie $G(omega_u)=0$);
- *marge de gain* la grandeur $M_G = 0 -20 log_10(|#si.ftbo (j omega_g)|)$ où $omega_g$ est la _pulsation d'opposition de phase_ pour laquelle $arg(#si.ftbo (j omega_g)) = -180°$

La marge de gain n'est pas définie au premier et deuxième ordres car la phase n'atteint jamais $-180°$. La marge de gain n'est définie que si $K_(b o) >= 1$.