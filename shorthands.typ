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
#let int = math.limits(math.integral)