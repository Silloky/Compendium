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

#let cm = math.underline