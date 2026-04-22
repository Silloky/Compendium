#import "../../blocks.typ": *

#formulaire("Opérations vectorielles", true, none)[
  *Produit scalaire*
  $ vec(A_1, A_2, A_3) dot vec(B_1, B_2, B_3) = A_1 B_1 + A_2 B_2 + A_3 B_3 $
  
  *Produit vectoriel*
  $ vec(A_1, A_2, A_3) and vec(B_1, B_2, B_3) = vec(A_2 B_3 - A_3 B_2, A_3 B_1 - A_1 B_3, A_1 B_2 - A_2 B_1) $

  *Produit mixte*
  $ (vc(A) and vc(B)) dot vc(C) = (vc(B) and vc(C)) dot vc(A)= (vc(C) and vc(A)) dot vc(B) $

  *Formule de Gibbs*
  $ (vc(A) and vc(B)) and vc(C) = (vc(A) dot vc(C)) vc(B) - (vc(B) dot vc(C)) vc(A) $

  *Décomposition orthogonale*
  #box(
      width: 100%,
      inset: (x: 1em, y: 0.5em),
      flexwrap(
        main-spacing: 4em,
        cross-spacing: 1em,

        $arrow(A)_parallel = frac(arrow(A) dot arrow(B), ||arrow(B)||^2) arrow(B) $,
        $arrow(A)_perp = arrow(A) - arrow(A)_parallel $,

      )
    )
] <ope>
