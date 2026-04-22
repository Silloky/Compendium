// INITIALIZATION

#set text(
  font: "New Computer Modern",
  size: 12pt,
  lang: "fr"
)

#set page(
  paper: "a5",
  margin: (x: 1cm, y: 1cm),
  header: align(right, text(8pt, style: "italic")[E. Kirkwood - Sciences de l'ingénieur MPSI]),
)

#{
  set page(header: "")
  set align(center)
  v(3cm)
  
  text(5em, weight: "bold")[Sciences de l'ingénieur]
  
  v(1em)
  text(1.5em, style: "italic", fill: gray.darken(20%))[Résumés de cours, preuves et méthodes]
  
  line(length: 40%, stroke: 0.5pt)
  
  v(1em)
  text(1.2em)[MPSI — Collège Stanislas]
  
  v(4cm)
  
  text(1.1em)[*Elias Kirkwood*]
  v(0.1em)
  text(0.9em)[Année 2025 - 2026]
  
  pagebreak()
}



// TITLE FORMATTING AND TOC

#set heading(numbering: (..nums) => {
  let n = nums.pos()
  if n.len() == 1 { numbering("I", ..n) }
  else if n.len() == 2 { numbering("1.", n.at(1)) }
  else { numbering("1.1", ..n.slice(1)) }
})

#counter("toctopheadings").step()

#show outline.entry.where(level: 1): it => block(
  above: 1.5em,
  below: 0.5em,
)[
  #text(size: 1.4em)[
    *Partie #counter("toctopheadings").display("I")* : #it.body()
  ]
  #counter("toctopheadings").step()
  #line(length: 100%)
  #v(0.5em)
]
#show outline: it => {
  show heading: h => {
    v(1em)
    text(size: 1.5em, weight: "light")[#h.body]
    v(0.5em)
  }
  it
}

#outline(indent: 2em, depth: 3)

#pagebreak()

#show heading.where(level: 2): it => {
  pagebreak(weak: true)
  set align(left)
  block(below: 2em, width: 100%)[
    #v(3em)
    #text(size: 2em, weight: "bold")[#it.body]
    #v(-1.2em)
    // The Grey Number Underneath
    #text(fill: gray.darken(10%), size: 1.2em, weight: "regular")[
      CHAPITRE #counter(heading).display()
    ]
    #v(1em)
  ]
}

#show heading.where(level: 3): set text(size: 1.3em)

// CONTENT

#import "../blocks.typ": *
#import "@preview/cetz:0.5.0"

#let parts = (
  "Théorie du contrôle": "Controle/controle.typ",
  "Mécanique": "Mécanique/meca_si.typ",
)

#for (i, (part, file)) in parts.pairs().enumerate() {
  part_page(part, numbering("I", i+1))
  include file
}

