// INITIALIZATION

#set text(
  font: "EB Garamond",
  size: 11pt,
  lang: "fr"
)

#set page(
  paper: "a4",
  margin: (x: 1cm, y: 1cm),
  header: align(right, text(8pt, style: "italic")[E. Kirkwood - Lettres Spé]),
)

#{
  set page(header: "")

  set align(center + horizon)
  text(7em, weight: "bold")[Arcanes de la création]
  v(-1cm)
  text(2em, style: "italic", fill: gray.darken(20%))[Cours, fiches & citations]
  line(length: 60%, stroke: 0.5pt)
  
  set align(center + bottom)
  text(1.6em)[*Elias Kirkwood*]
  v(0.1em)
  text(1.3em)[PSI — Collège Stanislas]
  v(0.1em)
  text(1.2em)[Année 2026 - 2027]
  v(5em)
  
  pagebreak()
}

#let parts = (
  "Platon/Platon.typ": [_Ion_ #v(-2.5cm)#text(size: 0.5em)[_La République_ (livre X)]],
  "Zola/Zola.typ": [_L'Œuvre_],
)


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
    *Partie #counter("toctopheadings").display("I")* : #{
      if it.body() != parts.at("Platon/Platon.typ"){
        it.body()
      } else {
        [_Ion_ & _La République_ (livre X, 595a-608b)]
      }
    }
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

#outline(indent: 2em, depth: 4, title: text("Table des matières", size: 1.4em))

#pagebreak()

#show heading.where(level: 2): it => {
  set align(left)
  pagebreak(weak: true)
  
  block(below: 2em, width: 100%)[
    #v(3em)
    #text(size: 2.4em, weight: "bold")[#it.body]
  ]
}

#show heading.where(level: 3): it => text(size: 1.9em)[#it]
#show heading.where(level: 4): it => text(size: 1.2em)[#it]


// CONTENT

#let part_page(title, num) = {
  pagebreak(weak: true)
  
  counter(heading).step(level: 1)
  
  set align(center + horizon)
  
  text(3em, weight: "bold", fill: gray.darken(50%))[
    PARTIE #num
  ]
  
  //v(1em)
  //line(length: 70%, stroke: 1.5pt)
  v(3em)
  
  [
    #set text(6em, weight: "bold")
    #show heading: set block(above: 0em, below: 0em)
    #heading(level: 1, numbering: none, outlined: true, title)
  ]
  
  v(2cm)
  line(length: 20%, stroke: 1pt)
  
  pagebreak()
}

#set par(justify: true)

#import "formats.typ": *
#show math.equation: it => {
  let func = $"text"$.body.func()
  show func: set text(font: "EB Garamond")
  it
}

#for (i, (file, part)) in parts.pairs().enumerate() {
  part_page(part, numbering("I", i+1))
  include file
}
