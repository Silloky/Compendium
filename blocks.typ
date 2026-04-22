#import "shorthands.typ": *
#import "@preview/biceps:0.0.1": *
#import "@preview/lucide:0.1.0": *


#let important(label, col, body) = block(
  width: 100%,
  stroke: 0.2pt + col,
  radius: 2pt,
  inset: (top: 1.2em, bottom: 1em, left: 1em, right: 1em),
  fill: col.lighten(95%),
  above: 2em,
  {
    // This places the label on the top border
    place(
      top + left,
      dx: 0.5em,
      dy: -1.75em, // Adjust this to sit perfectly on the line
      box(fill: white, inset: (x: 5pt))[
        #set text(fill: col, weight: "bold")
        #label
      ]
    )
    body
  }
)

#let definition(label, body) = {
  label = "Définition" + if label != "" {
    " : " + label
  }
  important(label, rgb("#0794b8"))[
    #body
  ]
}

#let propriete(label, body) = {
  label = "Propriété" + if label != "" {
    " : " + label
  }
  important(label, rgb("#21a300"))[
    #body
  ]
}

#let theoreme(label, body) = {
  label = "Théorème" + if label != "" {
    " " + label
  }
  important(label, rgb("#800080"))[
    #body
  ]
}

#let exemple(label, body) = {
  label = "Exemple" + if label != "" {
    " : " + label
  }
  important(label, rgb("#cccccc"))[
    #body
  ]
}

#let remarque(label, body) = important({"Remarque" + if label != "" {
    " : " + label
  }}, rgb("#ffa500"))[
    #body
  ]

#let preuve(body) = {
  
  pad(block(
    width: 100%,
    stroke: (left: 2pt + luma(100)), // Subtle dark gray bar
    inset: (left: 1.2em, top: 0.5em, bottom: 0.5em, right: 0.5em),
    above: 1.5em,
    below: 1.5em,
    fill: rgb("#f7f7f7"),
  )[
    #text()[_Preuve._] 
    #h(0.2em)
    #linebreak() 
    #body
    #v(-1em)
    #align(right)[$square$] // The QED symbol
  ], left: 1em)
}

#let warning(label, body) = box(
  //stroke: 1pt + black,
  flexwrap(
    flex: (1fr, 10fr),
    lucide-icon("triangle-alert", size: 2em, stroke: 0.1pt),
    body
  )
)


#let part_page(title, num) = {
  //pagebreak(weak: true, to: "odd")
  pagebreak(weak: true)
  
  // We manually step the heading counter so the chapters 
  // inside this part start at 1, not 0.
  counter(heading).step(level: 1)
  
  set align(center + horizon)
  
  text(2em, weight: "bold", fill: gray.darken(50%))[
    PARTIE #num
  ]
  
  v(1em)
  line(length: 60%, stroke: 1.5pt)
  v(1.5em)
  
  // This heading is invisible on the page but shows up in the TOC
  // We don't include the number here because we styled it above
  [
    #set text(3em, weight: "bold")
    #show heading: set block(above: 0em, below: 0em)
    #heading(level: 1, numbering: none, outlined: true)[#title]
  ]
  
  v(2em)
  line(length: 20%, stroke: 1pt)
  
  pagebreak()
}

#let formulaire(title, out, place, body) = figure(
  caption: title,
  kind: "formulaire",
  supplement: "Formulaire",
  placement: place,
  outlined: out
)[
  #block(
    stroke: 1pt + gray,
    inset: (left: 0.8em, top: 0.8em, bottom: 0.8em, right: 0.8em),
    width: 100%,
    radius: 2pt
  )[
    #underline()[#text(size: 1.1em)[*#title*]]
    #v(0.2em)
    #body
  ]
]