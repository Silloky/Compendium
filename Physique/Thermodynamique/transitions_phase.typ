#import "../../blocks.typ": *
#import "@preview/wrap-it:0.1.1": wrap-content

#wrap-content(
  image("assets/trans_phase.png", width:100%),
  [On appelle *corps pur* un ensemble de molécules ou d'atomes caractérisé par une formule chimique unique.  \ On appelle *phase* une partie homogène à l'échelle, dans laquelle les paramètres intensifs ont la même valeur partout.],
  align: right
)


=== Diagrammes

#flexwrap(
  flex: (1fr, 1fr, 1fr),
  image("assets/surfaces_états.png", width: 100%),
  image("assets/andrews.png", width: 100%),
  image("assets/diagramme_PT.png", width: 100%)
)

A partir d'un diagramme PVT, on peut extraire le diagramme PV (dit _d'Andrews_) et le diagramme PT (dit _de phases_).

Sur le diagramme PV, en suivant une isotherme dans le sens de la compression, on rencontre le *point de rosée*, puis le *point d'ébullition*. \ L'ensemble des points forme la *courbe de saturation*. Sous la courbe, les isothermes sont des droites horizontales, donc une transition de phase isotherme est isobare (et réciproquement). \ Au delà du *point critique* $C$, il n'y a plus de transition de phase.


=== Fonctions d'état d'un corps pur diphasé

On note $m$ la masse et $x$ le titre en vapeur d'un fluide diphasé. Pour toute température $T$, on note $h_"liq" (T)$ l'enthalpie massique de du liquide saturant et $h_"vap" (T)$ l'enthalpie massique de la vapeur saturante. \ On pose l'*enthalpie massique de vaporisation* : $L_V (T) = h_"vap" (T) - h_"liq" (T)$.

Par extensivité, l'enthalpie totale vaut : $H = m (h_"liq" (T) + x L_V (T))$

Une masse $dif m_"vap" = m dif x$ évolue de manière isotherme donc isobare :$ delta Q = dif H = L_V (T) dif m_"vap" = L_V (T) m dif x $
Dans ces mêmes conditions, on a $dif H = T dif S$, d'où $s_"vap" (T) - s_"liq" (T) = (L_V (T))/T$. C'est la largeur de la courbe d'ébullition dans un diagramme ST.

$L_V (T)$ est toujours positif et s'annule en la température critique. \ Localement, elle peut s'approximer comme une fonction affine de la température, de pente faible, donc quasi-constante.

#wrap-content(
  image("assets/theo_moments_andrews.png"),
  [$A$ est le point d'ébullition, $B$ le point de rosée. On note $v$ le volume massique au point $M$. On a : $ V &= m_"liq" v_"liq" + m_"vap" v_"vap" \ V &= (1-x)m v_"liq" + x m v_"vap" $ D'où $v = (1-x)v_"liq" + x m_"vap"$ et enfin : $ x = (v - v_"liq")/(v_"vap" - v_"liq") = (s - s_"liq")/(s_"vap" - s_"liq") = (A M)/(A B) $],
  align: right
)

En somme, $M$ est le barycentre des points $A$ et $B$, affectés des coefficients $1-x$ et $x$.

=== Diagramme de Mollier

#align(center, image("assets/mollier.png", width: 80%))