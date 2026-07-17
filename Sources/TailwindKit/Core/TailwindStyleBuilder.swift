//
//  TailwindStyleBuilder.swift
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

/// A type-safe, fluent builder for [Tailwind CSS v4](https://tailwindcss.com)
/// utility class strings.
///
/// `TailwindStyleBuilder` is a pure value type with **no dependency on Plot** (or any
/// HTML library). Every member — bare utilities exposed as computed properties
/// and parameterized utilities exposed as methods — returns a new
/// `TailwindStyleBuilder`, so styles are composed by chaining:
///
/// ```swift
/// TW.flex.items(.center).gap(4).bg(.blue, .s500).rendered
/// // "flex items-center gap-4 bg-blue-500"
/// ```
///
/// The final class string is produced by ``rendered``. To attach a style to a
/// Plot element, use the single `.tailwind(_:)` convenience (see
/// `Node+Tailwind.swift`):
///
/// ```swift
/// Node.div(.tailwind(.flex.items(.center).gap(4)), .text("Hi"))
/// ```
///
/// The set of modeled utilities is intentionally **closed** and grown
/// component-driven: add cases as components need them. For any class not yet
/// modeled, the escape hatch is Plot's existing `.class("…")` — `TailwindStyleBuilder`
/// itself never accepts raw strings.
public struct TailwindStyleBuilder: Sendable, Equatable, Hashable {
  /// The ordered, fully-prefixed utility tokens (e.g. `"items-center"`,
  /// `"md:gap-4"`), rendered space-separated by ``rendered``.
  private let tokens: [String]

  /// The composed Tailwind class string, tokens joined by a single space.
  ///
  /// ```swift
  /// TW.flex.gap(4).rendered // "flex gap-4"
  /// ```
  public var rendered: String {
    tokens.joined(separator: " ")
  }

  /// Creates an empty style.
  ///
  /// Chain utilities to build it up, or start a chain from a static member
  /// such as `.flex`.
  public init() {
    self.tokens = []
  }

  private init(tokens: [String]) {
    self.tokens = tokens
  }

  /// Returns a new style with the raw token string `token` appended.
  ///
  /// File-private: the only raw-string composition point. The public seam
  /// (``appending(_:)`` taking a ``TailwindClass``) forwards here, so no
  /// raw-string entry point is ever exposed.
  private func appendingToken(_ token: String) -> TailwindStyleBuilder {
    TailwindStyleBuilder(tokens: tokens + [token])
  }

  /// Returns a new style with every token of `other` prefixed by
  /// `"\(prefix):"` and appended.
  ///
  /// Used to model responsive/state variants (e.g. `md`, `hover`); prefixes
  /// stack, so `.md(.hover(.bg(.blue, .s700)))` renders `"md:hover:bg-blue-700"`.
  private func prefixingToken(_ prefix: String, _ other: TailwindStyleBuilder)
    -> TailwindStyleBuilder
  {
    TailwindStyleBuilder(tokens: tokens + other.tokens.map { "\(prefix):\($0)" })
  }
}

// The public seam (see ``TailwindStyle``). Both primitives forward to the
// file-private string helpers above; retyping the *public* surface to
// ``TailwindClass`` / ``Variant`` is what lets the seam be public without ever
// accepting a raw `String`.
extension TailwindStyleBuilder: TailwindStyle {
  /// Returns a new style with `tailwindClass` appended.
  public func appending(_ tailwindClass: some TailwindClass) -> Self {
    appendingToken(tailwindClass.className)
  }

  /// Returns a new style with every token of `other` prefixed by `variant`.
  public func prefixing(_ variant: some Variant, _ other: TailwindStyleBuilder) -> Self {
    prefixingToken(variant.token, other)
  }
}
