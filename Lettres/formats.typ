#let c(citation, p: "") = [
  "#text(citation, style: "italic", size: 1em)" 
  #if not p == "" {
    text(size: 0.7em)[(#p)]
  }
]

#let cb(oeuvre, auteur, page, citation) = {
  pad(left: 1em)[
    #block(
      width: 100%,
      stroke: (left: 0.75pt + luma(100)), // Subtle dark gray bar
      inset: (left: 0.9em, top: 0.5em, bottom: 0.5em, right: 0.5em),
      above: 1.5em,
      below: 1.5em,
      //fill: rgb("#f7f7f7"),
    )[
      #set par(justify: true)
      #text(style: "italic", size: 1em, hyphenate: true)[
        #citation
      ]
      
      #v(-1em)
      #align(right)[
        #text(style: "normal", size: 0.9em)[— #auteur, _#oeuvre _, #page]
      ]
    ]
  ]
} 

#let cbion(page, citation) = cb("Ion", "Platon", page, citation)
#let cbrep(page, citation) = cb("La République", "Platon", page, citation)
#let cboe(page, citation) = cb("L'Œuvre", "E. Zola", "p. "+str(page), citation)

#let So = [Socrate]
#let Pl = [Platon]
#let G = [Glaucon]


#let LO = [_L'Œuvre_]
#let Sd = [Sandoz]
#let Lt = [Lantier]
#let Cl = [Claude]
#let Z = [Zola]
#let Cr = [Christine]
#let Vz = [Mme. Vanzade]
#let Db = [Dubuche]
#let Mg = [le père Malgras]
#let Ch = [Chaîne]
#let Jy = [Jory]
#let Mh = [Mahoudeau]
#let Fg = [Fagerolles]
#let Ib = [Irma Bécot]
#let Gn = [Gagnière]
#let Bg = [Bongrand]

#let ie = [_ie._]
#let e = [[...]]
#let ê = super("e")

#let cad = [c'est-à-dire]
