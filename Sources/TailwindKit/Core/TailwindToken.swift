//
//  TailwindToken.swift
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

/// A single value fragment in a Tailwind utility class — the `blue` in
/// `bg-blue-500`, the `lg` in `rounded-lg`, the `4` in `gap-4`.
///
/// `TailwindToken` is the shared seam for Tailwind v4's **theme-scale** value
/// families (the `@theme` namespaces `--color-*`, `--text-*`, `--radius-*`, …).
/// Each such family is modeled as a protocol refining `TailwindToken`, with the
/// documented built-in values exposed as static members on a `Default…`
/// conforming type — mirroring how SwiftUI models `ButtonStyle`, `TextFieldStyle`,
/// etc. Because these scales are extensible in Tailwind (you add values via
/// `@theme`), the Swift model is open too: conform your own type to add a custom
/// color, size, radius, and so on.
///
/// ```swift
/// // Built-in, via the leading-dot static member:
/// TW.bg(.blue, .s500).rendered            // "bg-blue-500"
///
/// // Custom, by conforming your own token type in your module:
/// struct BrandColor: Color { let token = "brand" }
/// extension Color where Self == BrandColor {
///   static var brand: BrandColor { .init() }
/// }
/// TW.bg(.brand, .s500).rendered           // "bg-brand-500"
/// ```
///
/// Tailwind's **fixed keyword sets** (position, object-fit, flex-direction, the
/// color *shade* steps, …) are *not* modeled with this protocol — a custom value
/// there is not a coherent concept, so they remain closed enums.
public protocol TailwindToken: Sendable {
  /// The rendered fragment, e.g. `"blue"`, `"lg"`, `"4"`.
  ///
  /// Consumed by ``TailwindStyleBuilder`` builder methods when composing a class
  /// string; not intended to be read directly by callers.
  var token: String { get }
}
