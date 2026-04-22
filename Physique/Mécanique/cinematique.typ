#import "../../blocks.typ": *

#definition("")[
  La dérivée d'une grandeur vectorielle $arrow(U)$ dépend du référentiel $cal(R)$ dans lequel elle est exprimée. On  note :
  $ lr(frac(dif arrow(U), dif xi) |)_cal(R) = lim_(Delta xi -> 0) frac(arrow(U)(xi + Delta xi) - arrow(U)(xi), Delta xi) $
]

#propriete("")[
  La dérivée d'un vecteur de norme constante est orthogonale à ce vecteur ou nulle. 
  C'est le cas des vecteurs unitaires.
]

#preuve()[
  On suppose $arrow(U)$ de norme constante. Alors $ 0 = frac(dif U^2, dif xi) = frac(dif, dif xi)(arrow(U) dot arrow(U))= 2(arrow(U) dot frac(dif arrow(U), dif xi)) $
  D'où $arrow(U) perp frac(dif arrow(U), dif xi) $
]

#remarque("")[
  Le vecteur vitesse est la somme des vecteurs vitesses si l'on fait varier une seule coordonnée dans une base donnée.
]

Seul un mouvement à la fois rectiligne et uniforme est non accéléré. 
\ Un mouvement uniforme (vitesse constante), mais non rectiligne est accéléré, car la
direction du vecteur vitesse est variable, donc l'accélération n'est pas nulle.


#formulaire("Vecteurs cinématiques dans les repères usuels", true, auto)[
    
    *Repère cartésien*

    #box(
      flexwrap(
        main-spacing: 4em,
        cross-spacing: 1em,
        $ vc(l) =x vc(e)_x+y vc(e)_y +z vc(e)_z $,
        $ vc(v) = dot(x) vc(e)_x + dot(y) vc(e)_y + dot(z) vc(e)_z $,
        $ vc(a) = ddot(x) vc(e)_x + ddot(y) vc(e)_y + ddot(z) vc(e)_z $
      )
    )
    
    *Repère cylindrique*

    #box(
      flexwrap(
        main-spacing: 4em,
        cross-spacing: 1em,
        $ vc(l) = rho vc(e)_rho + z vc(e)_z $,
        $ vc(v) = dot(rho) vc(e)_rho + rho dot(phi) vc(e)_phi + dot(z) vc(e)_z $,
        $  
          vc(a) &= (ddot(rho) - rho dot(phi)^2) vc(e)_rho + (2 dot(rho) dot(phi) + rho ddot(phi)) vc(e)_phi + ddot(z) vc(e)_z \
          vc(a) &=(ddot(rho)-rho dot(phi)^2) vc(e)_rho + 1/rho frac(dif(rho^2 dot(phi)), dif t) vc(e)_phi + ddot(z) vc(e)_z
        $
      )
    )

    *Cas particulier du mouvement plan*

    #box(
      flexwrap(
        main-spacing: 4em,
        cross-spacing: 1em,
        $ vc(l) = r vc(e)_r $,
        $ vc(v) = dot(r) vc(e)_r + r dot(theta) vc(e)_theta $,
        $ vc(a) = (ddot(r) - r dot(theta)^2) vc(e)_r + (2 dot(r) dot(theta) + r ddot(theta)) vc(e)_theta $
      )
    )

    *Cas particulier du mouvement circulaire uniforme*
    #box(
      flexwrap(
        main-spacing: 4em,
        cross-spacing: 1em,
        $ vc(l) = R vc(e)_r $,
        $ vc(v) = R dot(theta) vc(e)_theta $,
        $ vc(a) = -R dot(theta)^2 vc(e)_r $
      )
    )

    *Repère sphérique*

    #box(
      flexwrap(
        main-spacing: 4em,
        cross-spacing: 1em,
        $ vc(l) = r vc(e)_r $,
        $ vc(v) = dot(r) vc(e)_r + r dot(theta) vc(e)_theta + r sin(theta) dot(phi) vc(e)_phi $,
        [L'accélération n'est pas au programme]
      )
    )
] <vecteurs-cinématiques>



