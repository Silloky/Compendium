// blockdiag.typ ─ Block diagram automatic-layout module
// ──────────────────────────────────────────────────────────────────────────
// Requires: Typst ≥ 0.11  ·  @preview/cetz:0.3.1
//
// NODE schema ─────────────────────────────────────────────────────────────
//   (
//     id:    str,               // unique key used in edges
//     type:  "box"|"sum"|"dot", // default "box"
//     label: content,           // displayed text ("box" nodes)
//     signs: dict,              // ("sum") e.g. (w: [+], s: [−])
//     layer: int,               // OPTIONAL – override automatic column
//     row:   int,               // OPTIONAL – override automatic row (0 = top)
//   )
//
// EDGE schema ─────────────────────────────────────────────────────────────
//   (
//     from:         str,        // source node id
//     to:           str,        // target node id
//     label:        content,    // OPTIONAL signal name shown above arrow
//     back:         bool,       // if true → route south-of-diagram  (default false)
//     from-anchor:  str,        // OPTIONAL override e.g. "mynode.south"
//     to-anchor:    str,        // OPTIONAL override e.g. "mynode.north"
//   )
//
// PORT schema (inputs / outputs) ──────────────────────────────────────────
//   (to/from: str, label: content)
//
// USAGE ───────────────────────────────────────────────────────────────────
//   #import "blockdiag.typ": block-diagram
//   #block-diagram(nodes: (...), edges: (...), inputs: (...), outputs: (...))

#import "@preview/cetz:0.3.1"


// ═══════════════════════════════════════════════════════════════════════════
// LAYOUT  (pure functions, no drawing)
// ═══════════════════════════════════════════════════════════════════════════

/// Longest-path layer assignment via Bellman-Ford relaxation on the
/// forward subgraph (edges where back: false).
/// Returns  dict  node-id → layer (int, 0 = leftmost)
#let _do-layers(nodes, edges) = {
  let ids = nodes.map(n => n.id)
  let fwd = edges.filter(e => not e.at("back", default: false))
  // initialise every node at layer 0
  let L = ids.fold((:), (d, id) => d + (id: 0))
  // relax |V| times → converges to longest path
  range(ids.len()).fold(L, (L, _) =>
    fwd.fold(L, (L, e) => {
      let nl = L.at(e.from, default: 0) + 1
      if L.at(e.to, default: 0) < nl { L + (e.to: nl) } else { L }
    })
  )
}

/// Row assignment within each column.
/// Nodes with an explicit `row:` field keep that value;
/// the rest are packed 0, 1, 2 … skipping any forced slots.
/// Returns  dict  node-id → row (int, 0 = topmost)
#let _do-rows(nodes, L) = {
  let max-l = nodes.fold(0, (m, n) => calc.max(m, L.at(n.id, default: 0)))
  range(max-l + 1).fold((:), (R, l) => {
    let in-col  = nodes.filter(n => L.at(n.id, default: 0) == l)
    let forced  = in-col.filter(n => "row" in n)
    let automatic    = in-col.filter(n => "row" not in n)
    let used    = forced.map(n => n.row)
    let free    = range(in-col.len() + used.len()).filter(r => r not in used)
    let R = forced.fold(R, (R, n) => R + (n.id: n.row))
    automatic.enumerate().fold(R, (R, p) => R + (p.at(1).id: free.at(p.at(0))))
  })
}

/// Convert layer + row numbers into CeTZ coordinates.
/// Returns  dict  node-id → (x, y)
#let _do-pos(nodes, L, R, dx, dy) = nodes.fold((:), (P, n) =>
  P + (n.id: (L.at(n.id) * dx, -R.at(n.id) * dy))
)


// ═══════════════════════════════════════════════════════════════════════════
// DRAWING HELPERS  (each imports cetz.draw internally)
// ═══════════════════════════════════════════════════════════════════════════

/// Labelled rectangle
#let _draw-box(id, label, x, y) = {
  import cetz.draw: content
  content((x, y), box(stroke: 0.5pt, inset: (x: 7pt, y: 5pt))[#label], name: id)
}

/// Comparison / summation circle with × and cardinal signs
#let _draw-sum(id, signs, x, y) = {
  import cetz.draw: circle, line, content
  let r = 0.38
  circle((x, y), radius: r, stroke: 0.5pt, fill: white, name: id)
  let d = r * 0.70
  line((x - d, y + d), (x + d, y - d), stroke: 0.4pt)
  line((x + d, y + d), (x - d, y - d), stroke: 0.4pt)
  // sign offsets keyed by cardinal direction
  let off = (w: (-0.20, 0.09), e: (0.20, 0.09), s: (0, -0.26), n: (0, 0.26))
  for (dir, sign) in signs {
    let (ox, oy) = off.at(dir, default: (0, 0))
    content((x + ox, y + oy), text(size: 6.5pt, weight: "bold")[#sign])
  }
}

/// Filled branch-point dot
#let _draw-dot(id, x, y) = {
  import cetz.draw: circle
  circle((x, y), radius: 0.08, fill: black, stroke: none, name: id)
}

/// Forward arrow  east → west, with optional S-bend when rows differ.
/// If from-anchor / to-anchor are supplied in the edge, they are used
/// verbatim and no automatic bend is applied.
#let _arrow-fwd(edge, pos) = {
  import cetz.draw: line, content
  let (fx, fy) = pos.at(edge.from)
  let (tx, ty) = pos.at(edge.to)
  let fa = edge.at("from-anchor", default: edge.from + ".east")
  let ta = edge.at("to-anchor",   default: edge.to   + ".west")

  let custom = ("from-anchor" in edge) or ("to-anchor" in edge)
  let pts = if custom {
    // custom anchors: draw direct line, no automatic-bend
    (fa, ta)
  } else if calc.abs(fy - ty) < 0.01 {
    // same row: direct horizontal arrow
    (fa, ta)
  } else {
    // different rows: S-bend through horizontal midpoint
    let mx = (fx + tx) / 2
    (fa, (mx, fy), (mx, ty), ta)
  }

  line(..pts, stroke: 0.5pt, mark: (end: ">"))

  if "label" in edge {
    // place label above the higher of the two node centres
    let lx = (fx + tx) / 2
    let ly = calc.max(fy, ty) + 0.30
    content((lx, ly), edge.label)
  }
}

/// Feedback arrow  source.south → bottom rail → target.south
#let _arrow-back(edge, pos, by) = {
  import cetz.draw: line, content
  let (fx, _) = pos.at(edge.from)
  let (tx, _) = pos.at(edge.to)
  line(
    edge.from + ".south",
    (fx, by),
    (tx, by),
    edge.to   + ".south",
    stroke: 0.5pt,
    mark: (end: ">")
  )
  if "label" in edge {
    content(((fx + tx) / 2, by - 0.30), edge.label)
  }
}

/// Input port: horizontal arrow entering a node from the left
#let _port-in(node-id, label, x, y, len) = {
  import cetz.draw: line, content
  line((x - len, y), node-id + ".west", stroke: 0.5pt, mark: (end: ">"))
  if label != none {
    content((x - len * 0.5, y + 0.28), label)
  }
}

/// Output port: horizontal arrow exiting a node to the right
#let _port-out(node-id, label, x, y, len) = {
  import cetz.draw: line, content
  line(node-id + ".east", (x + len, y), stroke: 0.5pt, mark: (end: ">"))
  if label != none {
    content((x + len * 0.5, y + 0.28), label)
  }
}


// ═══════════════════════════════════════════════════════════════════════════
// PUBLIC API
// ═══════════════════════════════════════════════════════════════════════════

/// Draw an automatic-laid-out block diagram.
///
/// Parameters
/// ──────────
/// nodes    – array of node dicts (see schema at top of file)
/// edges    – array of edge dicts
/// inputs   – array of (to: str, label: content)   for input arrows
/// outputs  – array of (from: str, label: content)  for output arrows
/// dx       – horizontal spacing between columns (CeTZ units)
/// dy       – vertical spacing between rows
/// port-len – length of input/output stub arrows
/// margin   – clearance below lowest node for back-edge rail
#let block-diagram(
  nodes,
  edges,
  inputs:   (),
  outputs:  (),
  dx:       3.2,
  dy:       1.5,
  port-len: 1.0,
  margin:   0.75,
) = {
  let nodes = if type(nodes) == dictionary {
    nodes.pairs().map(p => {
      let id = p.at(0)
      let n = p.at(1)
      if "id" in n { n } else { n + (id: id) }
    })
  } else {
    nodes
  }

  // ── automatic-layout, respecting any manual overrides ──────────────────────
  let automatic-L = _do-layers(nodes, edges)
  // honour explicit layer: overrides
  let L = nodes.fold(automatic-L, (L, n) =>
    if "layer" in n { L + (n.id: n.layer) } else { L }
  )
  let R   = _do-rows(nodes, L)
  let pos = _do-pos(nodes, L, R, dx, dy)

  // back-edge routing rail: below the lowest node
  let min-y = nodes.fold(0.0, (m, n) => calc.min(m, pos.at(n.id).last()))
  let by    = min-y - margin

  // ── canvas ────────────────────────────────────────────────────────────
  cetz.canvas({
    // 1. nodes
    for n in nodes {
      let (x, y) = pos.at(n.id)
      let t = n.at("type", default: "box")
      if      t == "sum" { _draw-sum(n.id, n.at("signs", default: (w: [+], s: [−])), x, y) }
      else if t == "dot" { _draw-dot(n.id, x, y) }
      else               { _draw-box(n.id, n.at("label", default: [#n.id]), x, y) }
    }

    // 2. edges
    for e in edges {
      if e.at("back", default: false) { _arrow-back(e, pos, by) }
      else                             { _arrow-fwd(e, pos) }
    }

    // 3. I/O ports
    for p in inputs  {
      let (x, y) = pos.at(p.to)
      _port-in(p.to, p.at("label", default: none), x, y, port-len)
    }
    for p in outputs {
      let (x, y) = pos.at(p.from)
      _port-out(p.from, p.at("label", default: none), x, y, port-len)
    }
  })
}