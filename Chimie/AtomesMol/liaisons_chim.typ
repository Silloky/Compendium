#import "../../blocks.typ": *
#import "@preview/unify:0.8.0": *

=== Généralités

*Liaison localisée* : la liaison n'implique que deux atomes

*Energie de dissociation* : énergie nécessaire pour rompre une liaison chimique ; entre $qty(2, "electronVolt")$ et $qty(5, "electronVolt")$

// *Energie molaire de dissociation* : énergie de dissociation exprimée par mole de liaisons à rompre

*Longueur de liaison* : distance entre les noyaux des atomes liés, généralement en picomètres ($unit("pico meter")$) ou en angströms ($unit("angstrom")$)

=== Polarité

Une molécule est _polaire_ si le barycentre $Delta_-$ des charges négatives $-delta$ ne coïncide pas avec le barycentre $Delta_+$ des charges positives $+delta$.

*Moment dipolaire* : vecteur $vc(p) = delta vc("AB")$ où $delta$ est la charge partielle et $A$ et $B$ sont les centres des atomes liés.

#warning()[Le moment dipolaire est toujours orienté du centre de charge négative vers le centre de charge positive.]

#figure(caption: "Electronégativités de Pauling", kind: "table", supplement: "Tableau")[
  #table(
    columns: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
    [H : $2.1$ ], "", "", "", "", "", "",
    [Li : $1.0$], [Be : $1.5$], [B : $2.0$], [C : $2.5$], [N : $3.0$], [O : $3.5$], [F : $4.0$],
    [Na : $0.9$], [Mg : $1.2$], [Al : $1.5$], [Si : $1.8$], [P : $2.1$], [S : $2.5$], [Cl : $3.0$],
    [K : $0.8$], [Ca : $1.0$], [Ga : $1.6$], [Ge : $1.8$], [As : $2.0$], [Se : $2.4$], [Br : $2.8$]
  )
]

=== Types de liaisons

On définit le degré d'ionicité par : $I = delta\/e$

*Liaison covalente* : $I = 0$

*Liaison ionique* : $I = 1$



