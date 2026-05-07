#let ddot = math.dot.double
#let vc = math.arrow
#let iff = math.arrow.l.r.double.long

#let der(a, b, n: 1) = {
  if n == 1 {
    math.frac([#math.dif #a], [#math.dif #b])
  } else {
    math.frac([#math.attach(math.dif, tr: n) #a], [#math.dif #math.attach(b, tr: n)])
  }
}
#let pder(a, b, n: 1) = {
  if n == 1 {
    math.frac([#math.partial #a], [#math.partial #b])
  } else {
    math.frac([#math.attach(math.partial, tr: n) #a], [#math.partial #math.attach(b, tr: n)])
  }
}

#let int = math.limits(math.integral)

#let si = (
  ftbf: $ F T B F (p)$,
  ftcd: $ F T C D (p)$,
  ftcr: $ F T C R (p)$,
  ftbo: $ F T B O (p)$
)

#let ie = [_i.e._]
#let ex = [_ex._]
#let etc = [_etc._]
#let proofEnd = [#v(-1em) #align(right)[$square$]]

#let cm = math.underline
#let avg = math.overline
#let D = math.Delta
#let intrg(a, b) = $bracket.stroked.l #a, #b bracket.stroked.r$
#let mod(a) = [#h(0.2em) $[#a]$]
#let cg = math.equiv
#let gcd = math.and