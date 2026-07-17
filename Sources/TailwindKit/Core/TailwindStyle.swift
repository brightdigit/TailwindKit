//
//  TailwindStyle.swift
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

/// The shared **seam** the TailwindKit capability protocols implement against.
///
/// Each capability (``ColorStyling``, ``SpacingStyling``, …) provides its fluent
/// members in a protocol extension constrained on `Self: TailwindStyle`,
/// composing new styles through the two primitives declared here, so
/// ``TailwindStyleBuilder`` itself is only storage plus `init`/``TailwindStyleBuilder/rendered``
/// — it carries no fluent method bodies. This mirrors how `ButtondownKit`'s
/// capability protocols implement against `UnderlyingClientProtocol.underlying`.
///
/// This protocol must be **public**: the capability protocols' members are
/// public requirements witnessed by those constrained extensions, and Swift
/// forbids a `public` member in an extension whose generic constraint refers to
/// a non-public protocol ("cannot declare a public instance method in an
/// extension with internal requirements").
///
/// Crucially — and unlike a naive port of the `underlying` seam — neither
/// primitive accepts a raw `String`. ``appending(_:)`` takes a ``TailwindClass``
/// and ``prefixing(_:_:)`` takes a ``Variant``, both of whose built-in
/// conformers have `internal` initializers. So exposing the seam publicly does
/// **not** open a raw-string hole in the API; the modeled surface stays closed.
public protocol TailwindStyle {
  /// Returns a new style with `tailwindClass` appended.
  ///
  /// The single composition primitive behind every non-variant utility. Built-in
  /// utilities pass a ``DefaultTailwindClass``; a downstream module may pass its
  /// own ``TailwindClass`` conformer.
  func appending(_ tailwindClass: some TailwindClass) -> Self

  /// Returns a new style with every token of `other` prefixed by `variant`.
  ///
  /// Models responsive/state variants; prefixes stack, so
  /// `.md(.hover(.bg(.blue, .s700)))` renders `"md:hover:bg-blue-700"`.
  func prefixing(_ variant: some Variant, _ other: TailwindStyleBuilder)
    -> Self
}
