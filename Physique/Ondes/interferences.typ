#import "../../blocks.typ": *

On considère deux ondes progressives sinusoïdales synchrones #ie de même pulsation $omega$.

Soit $M$ un point de l'espace où les ondes se superposent. On a : #box(flexwrap(flex: (1fr, 1fr), $ s_1 (M, t) = S_1 cos(omega t + phi_1) $, $ s_2 (M, t) = S_2 cos(omega t + phi_2) $))

On note $phi = phi_2- phi_1$.
On pose $s(M, t) = s_1 (M, t) + s_2 (M, t)$ et on note $S$ l'amplitude de l'onde résultante.

#theoreme(": Intensité résultante")[
  $ I = I_1 + I_2 + 2 sqrt(I_1 I_2) cos(phi) "   et   " I=2I_0(1+ cos(phi)) "si" I_1 = I_2 = I_0 $
]

#preuve()[
  On introduit les grandeurs complexes associées à $s_1$, $s_2$ et $s$ :
  #box(flexwrap(flex: (1fr, 1fr, 1fr), $ cm(s_1) = S_1 e^(j (omega t + phi_1 (M))) $, $ cm(s_2) = S_2 e^(j (omega t + phi_2 (M))) $, $ cm(s) = cm(S) e^(j omega t) $))
  On a alors : $cm(S) = S_1 e^(j phi_1) + S_2 e^(j phi_2) = e^(j phi_1) (S_1 + S_2 e^(j phi))$ \
  En prenant le module : $S = abs(cm(S)) = sqrt(S_1^2 + S_2^2 + 2 S_1 S_2 cos(phi))$ \
  D'où le résultat avec $I = S^2$.
]

#propriete("")[
  - Si $phi$ est un multiple de $ 2 pi$, l'interférence est constructive et $S = S_1 + S_2$
  - Si $phi$ est un nombre impair de $pi$, l'interférence est destructive et \ $S = abs(S_1 - S_2)$
]

#definition("")[On note $p(M) = phi(M)/(2 pi)$ l'*ordre d'interférence* au point $M$.]

Dans le cas des fentes d'Young, on a $i = lambda/(2 sin theta)$ pour l'interfrange, où $theta$ est l'angle de déviation.