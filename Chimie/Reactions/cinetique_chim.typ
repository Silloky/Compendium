#import "../../blocks.typ": *
#import "@preview/unify:0.8.0": *

=== Vitesse de réaction

On considère une réaction chimique d'équation $alpha_1 R_1 + alpha_2 R_2 --> beta_1 P_1 + beta_2 P_2$. \
On a :
$ v= 1/V der(xi, t) = -1/alpha_i der([R_i], t) = 1/beta_i der([P_i], t) = k(T) times [R_1]^(x_1) [R_2]^(x_2) $
Où :
- $v$ : vitesse de la réaction #sym.arrow #unit("N L^-3 T^-1")
- $V$ : volume de la solution #sym.arrow #unit("L^3")
- $xi$ : avancement de la réaction #sym.arrow #unit("N")
- $k(T)$ : constante de vitesse #sym.arrow #unit("L^3(x_1+x_2-1) N^1-x_1-x_2 T^-1")
- $x_1$ et $x_2$ : ordres partiels de réactifs #sym.arrow $emptyset$

La constante de vitesse est donnée par la *loi d'Arrhenius* : $ k(T) = k_max e^(-E_a / (R T)) "   d'où   " ln(k_2 / k_1) = -E_a / (R) (1/T_2 - 1/T_1) $

=== Méthodes expérimentales de suivi

La mesure de l'absorbance $A = log_10 (phi_0/phi)$ donne une fonction affine de l'avancement, d'après la loi de Beer-Lambert :
$ A = A_S + L sum epsilon_i [E_i] $
Où :
- $A_S$ : absorbance du solvant #sym.arrow $emptyset$
- $L$ : largeur de la cuve #sym.arrow #unit("L")
- $epsilon_i$ : coefficient d'extinction molaire de l'espèce $E_i$ #sym.arrow #unit("L² N^-1")

Méthode des vitesses initiales : $ v_01 / v_02 = ([A]_01 / [A]_02)^(x_A) $

=== Méthode intégrale

Si le mélange réactionnel est initialement stœchiométrique, il le reste au cours de la réaction, et on peut accéder à _l'ordre global_. \
Pour une réaction $A + 2B --> "produits"$ :
$ [B]_0 = 2 [A]_0 ==> - der([A], t) = k [A]^p [B]^q = (2^q k) times [A]^(p+q) $

Si un réactif est en grand excès, on peut le considérer comme constant, et on accède à _l'ordre partiel_ de l'autre réactif. Pour la même réaction :
$ [B]_0 >> 2[A]_0 ==> - der([A], t) = k [A]^p [B]_0^q = (k[B]_0^q) times [A]^p $

Dans tous les cas, on obtient une équation différentielle du type $ der(C, t) = -lambda C^n $

Pour vérifier la cohérence d'une hypothèse d'ordre, on trace :

#box(flexwrap(flex: (1fr, 1fr, 1fr),
  align(center, [*$n = 1$* $ ln(C/C_0) = -lambda t $]),
  align(center, [*$n = 2$* $ 1/C - 1/C_0 = lambda t $]),
  align(center, [*Ordre quelconque* $ C^(1-n) - C_0^(1-n) = lambda (n-1) t $])
))

=== Contrôle

*Contrôle thermodynamique* : on laisse toutes les réactions possibles se produire

*Contrôle cinétique* : on bloque certaines réactions, en arrêtant la réaction à un stade intermédiaire