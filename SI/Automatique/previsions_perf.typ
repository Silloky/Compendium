#import "../../blocks.typ": *

=== Analyse temporelle

==== Stabilité

#propriete("")[
  Un système est stable (au sens EB-SB, "_entrée bornée-sortie bornée_") si sa fonction de transfert ne possède pas de pôle à partie réelle positive ou nulle, donc en particulier une classe nulle.
]

// #preuve()[
//   Soit un système linéaire dont la fonction de transfert est donnée par :
//   $ H(p) = (N(p))/(p^m product_k (p-p_ k)) $
//   où $N(p)$ est un polynôme de degré inférieur à $m$, $m$ est la classe du système, et $p_k$ sont les pôles du système. 
//   \ Pour une entrée en échelon unitaire de fonction $E(p) = 1/p$, la sortie est
//   $S(p) = (H(p))/p$, soit dans le domaine temporel :

//   $ s(t) = s_0 t + sum_k alpha_k t^ell e^(p_k t) + sum_(n=2)^(m+1) beta_n (t^(n-1))/(n-1)! $

//   Ainsi $s$ est bornée si et seulement si :
//   - $m=0$ sinon il y divergence polynomiale
//   - $Re(p_1) = ... =0$ sinon il y a divergence exponentielle
// ]

#theoreme(": Critère de Routh-Hurwitz")[
  //- Ordre 0 : toujours stable
  - Ordre 1 : stable si $tau > 0$
  - Ordre 2 : stable si tous les coefficients du dénominateur sont non-nuls et de même signe
  - Ordre 3 : stable si tous les coefficients du dénominateur sont de même signe et que $a_0 a_3 < a_1 a_2$ (cri)
]

*Position des pôles dans le plan complexe et stabilité d'un système du deuxième ordre*

#image("assets/poles_complexes_ordre_2.png")

En général, les couples de pôles conjugués se trouvent dans un _gabarit_ de stabilité, donné par un trapèze défini pas :
- une borne droite à $-3/T_"max"$ : pour garantir une convergence rapide
- $|Re(p_i)| > |Im(p_i)|$ : pour éviter trop d'oscillations

==== Précision

// Il y a 3 types de précision : en _position_, en _vitesse_ et en _accélération_, chacune correspondant à un ordre de fonctions d'entrée.

Soit système asservi à retour unitaire. On note $H_"bo" (p)=si.ftbo$, $K_"bo"$ son gain statique et $alpha$ la classe. On a :

#align(center, table(
  align: center,
  columns: (auto, auto, auto, auto, auto),
  rows: (auto, 2em, 2em, 2em),
  [*Type*], [*Impulsion*], [*Position*], [*Vitesse*], [*Accélération*],
  [*Transformée*], $1$, $1/p$, $1/p^2$, $1/p^3$,
  $alpha=0$, $0$, $1/(1+K_"bo")$, $oo$, $oo$,
  $alpha=1$, $0$, $0$, $1/K_"bo"$, $oo$,
  $alpha=2$, $0$, $0$, $0$, $1/K_"bo"$
))

#preuve()[
  On considère une entrée de la forme $E(p)=1/p^beta$.
  On a $ mu(p)=E(p)-S(p) = (E(p))/(1+H_"bo"(p)) $
  D'où avec $H_"bo"(p) = K_"bo"/(p^alpha) (1+a_1 p+...+a_d p^d)/(1+ b_1 p + ... + b_n p^n)$, on en déduit une expression de $mu_s= lim_(p->0) p mu(p)$.

  Une disjonction de cas sur $beta$ puis $alpha$ permet d'obtenir les résultats du tableau.
]

#warning()[Le théorème de la valeur finale n'est utilisable que pour les systèmes stables.]

// #align(center, table(
//   align: center,
//   columns: (auto, auto, auto, auto),
//   rows: (auto, 2em),
//   [*Type*], "Position", "Vitesse", "Accélération",
//   [*Entrée*], $e_0 /p$, $a/p^2$, $(2gamma)/p^3$
// ))


==== Sensibilité aux perturbations

#propriete("")[
  Un système à retour unitaire est _insensible à une perturbation_ en échelon s'il existe au moins une intégration dans la chaîne directe, en amont de la perturbation.
]

#align(center, image(width: 60%, "assets/asservi_perturbation.png"))

#preuve()[
  Le système est linéaire, il y a donc superposition des réponses à l'entrée et à la perturbation.
  $ S(p)= underbrace((H(p)G(p))/(1+ H(p)G(p))E(p), "Réponse à l'entrée" ) + underbrace((G(p))/(1+ H(p)G(p))F(p), "Réponse à la perturbation" ) $
  On considère $H$ de gain $H_0$ et de classe $alpha$ et $G$ de gain $G_0$ et de classe $beta$.
  On réalise une étude en _régulation_, donc $E(p) = 0$ et $F(p) = F_0 /p$.
  Donc :
  $ s_oo = lim_(p -> 0)p S(p) = lim_(p -> 0)  (F_0 G(p))/(1+H(p)G(p)) = lim_(p -> 0) (G_0 F_0 p^alpha)/(p^(alpha+beta) + H_0 G_0) $
  D'où :
  - Si $alpha = beta = 0$ : $s_oo = (G_0 F_0)/(1+ H_0 G_0)$
  - Si $alpha = 0$ et $beta >= 1$ : $s_oo = (G_0 F_0)/(H_0 G_0)$
  - Si $alpha >= 1$ : $s_oo = 0$
]


=== Analyse fréquentielle