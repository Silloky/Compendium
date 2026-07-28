#import "../../blocks.typ": *

Le principe industriel est utilisé dans le cas d'un flux continu dans un système. \ Le volume rouge est supposé constant.


#let piston(niveau: 0pt, vanne-g: true, vanne-d: true, mouvement: "") = box(width: 1.4cm, height: 1.7cm)[
  #place(bottom, rect(width: 1.4cm, height: 1.6cm, stroke: 0.6pt))
  #place(top, dy: niveau+4pt, line(length: 1.4cm, stroke: 1.5pt + green))
  #if niveau > 0pt {
    place(top, dy: niveau + 3pt, rect(width: 1.4cm, height: -niveau - 1pt, fill: red.transparentize(70%)))
  }
  #if mouvement != "" {
    place(top, dy: niveau + 2mm, dx: 0.7cm, line(end: (0cm, 4mm), stroke: green))
    if mouvement == "montée" {
      place(top, dy: niveau + 2mm, dx: 0.7cm, line(angle: 45deg, length: 1.5mm, stroke: green))
      place(top, dy: niveau + 2mm, dx: 0.7cm, line(angle: 135deg, length: 1.5mm, stroke: green))
    } else if mouvement == "descente" {
      place(top, dy: niveau + 6mm, dx: 0.7cm, line(angle: -45deg, length: 1.5mm, stroke: green))
      place(top, dy: niveau + 6mm, dx: 0.7cm, line(angle: -135deg, length: 1.5mm, stroke: green))
    }
  }
]

#let vanne(pos, angle: 45deg, ouverte: false) = place(
  dx: pos.at(0), dy: pos.at(1),
  rotate(angle, line(length: 6pt, stroke: 1.2pt + (if ouverte { green } else { black })))
)

#let reservoir(actif: false, reste-inactif: false, w: 1.4cm, h: 0.8cm) = box(width: w, height: h)[
  #place(rect(width: w, height: h, stroke: 0.6pt,
    fill: if actif { red.transparentize(70%) } else { blue.transparentize(85%) }))
  #if reste-inactif {
    place(dx: w - 0.25cm, rect(width: 0.25cm, height: h, stroke: 0.6pt,
      fill: blue.transparentize(70%)))
  }
]

#let tuyau(depart: (0cm,0cm), coude: (0cm,0cm), arrivee: (0cm,0cm), couleur: blue) = {
  place(dx: depart.at(0), dy: depart.at(1),
    line(end: (coude.at(0) - depart.at(0), coude.at(1) - depart.at(1)), stroke: 1pt + couleur))
  place(dx: coude.at(0), dy: coude.at(1),
    line(end: (arrivee.at(0) - coude.at(0), arrivee.at(1) - coude.at(1)), stroke: 1pt + couleur))
}

#let etape(
  label: "",
  amont-actif: false,
  aval-actif: false,
  vanne-g-ouverte: false,
  vanne-d-ouverte: false,
  niveau: 0cm,
  fluide-actif: false,
  mouvement: ""
) = box(width: 4cm, height: 4.6cm)[
  // numéro d'étape
  #place(top + left, text(size: 7pt)[#label])

  // réservoirs amont / aval
  #place(top + left, dx: 0.2cm, dy: 0.3cm, reservoir(actif: amont-actif, reste-inactif: amont-actif))
  #place(top + right, dx: -0.2cm, dy: 0.3cm, reservoir(actif: aval-actif, reste-inactif: aval-actif))

  // tuyaux : deux courbes qui descendent vers le centre (approx. par lignes brisées)
  #tuyau(depart: (0.9cm, 1.1cm), coude: (1.6cm, 1.35cm), arrivee: (1.6cm, 1.8cm),
         couleur: if amont-actif { red } else { blue })
  #tuyau(depart: (3.1cm, 1.1cm), coude: (2.4cm, 1.35cm), arrivee: (2.4cm, 1.8cm),
         couleur: if aval-actif { red } else { blue })

  // vannes sur chaque branche, juste avant la jonction
  #vanne((1.5cm, 1.55cm), angle: 45deg, ouverte: vanne-g-ouverte)
  #vanne((2.3cm, 1.55cm), angle: -45deg, ouverte: vanne-d-ouverte)

  // cylindre (réutilise ton piston existant)
  #place(top, dx: 1.3cm, dy: 1.7cm, piston(
    niveau: niveau,
    vanne-g: not vanne-g-ouverte,
    vanne-d: not vanne-d-ouverte,
    mouvement: mouvement
  ))
]

#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 2mm,
  row-gutter: -1cm,
  etape(label: "①", amont-actif: true,  niveau: 0cm,
        vanne-g-ouverte: false, vanne-d-ouverte: false),
  etape(label: "②", amont-actif: true,  niveau: 0.8cm,
        vanne-g-ouverte: true,  vanne-d-ouverte: false, mouvement: "descente"),
  etape(label: "③", niveau: 1.58cm),
  etape(label: "④", niveau: 0.5cm, mouvement: "montée"),
  etape(label: "⑤", aval-actif: true, niveau: 0.4cm,
        vanne-g-ouverte: false, vanne-d-ouverte: true),
  etape(label: "⑥", aval-actif: true, niveau: 0cm),
)

#v(-1cm)

On peut identifier les aires sur les diagrammes de Watt et Clapeyron : $ tau + P_"amont"V_"max" = W + P_"aval"V_"min" "   i.e.   " tau = W + #D (P V)   $
Or $H = U + P V$ donc $#D H = #D U + #D (P V) = W + Q + #D (P V) = tau + Q$

Démontrée ici pour un compresseur à piston, on peut le faire dans le cas général.

#flexwrap(
  flex: (1fr, 1fr),
  align(center, image("assets/watt_indus.svg", height: 3.9cm)),
  align(center, image("assets/clapeyron_indus.svg", height: 3.9cm))
)
