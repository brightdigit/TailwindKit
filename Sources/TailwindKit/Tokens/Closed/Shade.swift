//
//  Shade.swift
//  TailwindKit
//
//  Created by Leo Dion.
//  Copyright © 2026 BrightDigit.
//
//  Permission is hereby granted, free of charge, to any person
//  obtaining a copy of this software and associated documentation
//  files (the "Software"), to deal in the Software without
//  restriction, including without limitation the rights to use,
//  copy, modify, merge, publish, distribute, sublicense, and/or
//  sell copies of the Software, and to permit persons to whom the
//  Software is furnished to do so, subject to the following
//  conditions:
//
//  The above copyright notice and this permission notice shall be
//  included in all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
//  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
//  OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
//  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
//  HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
//  WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
//  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
//  OTHER DEALINGS IN THE SOFTWARE.
//

/// A Tailwind v4 color shade (the `500` in `bg-blue-500`).
///
/// Spelled `sNNN` because Swift identifiers cannot begin with a digit — e.g.
/// `.bg(.blue, .s500)`. Unlike ``Color``, shade is a **fixed** 11-step scale,
/// not an extensible theme namespace: in Tailwind v4 `blue-500` is a single
/// variable `--color-blue-500`, so a "custom shade" is not a coherent concept
/// (you would define a whole new ``Color`` instead). Hence a closed enum.
public enum Shade: Int, Sendable, CaseIterable {
  case s50 = 50
  case s100 = 100
  case s200 = 200
  case s300 = 300
  case s400 = 400
  case s500 = 500
  case s600 = 600
  case s700 = 700
  case s800 = 800
  case s900 = 900
  case s950 = 950

  /// The token fragment, e.g. `"500"`.
  internal var token: String { String(rawValue) }
}
