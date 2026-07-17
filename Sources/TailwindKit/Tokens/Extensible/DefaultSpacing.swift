//
//  DefaultSpacing.swift
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

/// The built-in spacing values — integer/float literals plus `px`/`auto` and
/// the negative helper. Public type with no public initializer beyond the
/// literal conformances, so it isn't constructed by name.
public struct DefaultSpacing: Spacing,
  ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral
{
  /// The `px` keyword (a single CSS pixel), e.g. `p-px`.
  public static let px = DefaultSpacing("px")  // swiftlint:disable:this identifier_name
  /// The `auto` keyword, e.g. `mx-auto`.
  public static let auto = DefaultSpacing("auto")

  /// The rendered fragment, e.g. `"4"`, `"2.5"`, `"px"`.
  public let token: String

  /// Creates a spacing value from an integer literal (e.g. `4` renders `4`).
  public init(integerLiteral value: Int) {
    self.token = String(value)
  }

  /// Creates a spacing value from a floating-point literal, dropping a
  /// trailing `.0` (e.g. `2.5` renders `2.5`, `2.0` renders `2`).
  public init(floatLiteral value: Double) {
    self.token =
      value.rounded() == value
      ? String(Int(value))
      : String(value)
  }

  internal init(_ token: String) {
    self.token = token
  }

  /// Builds the Tailwind class for `prefix` with this spacing value, moving a
  /// leading negative sign ahead of the prefix (`-top-4`, `-mx-2`, `-space-x-2`)
  /// as Tailwind v4 requires. Non-negative values render `prefix-<token>`
  /// unchanged. Every spacing/inset/gap utility routes through this so negatives
  /// are formatted identically, not just margins.
  internal func className(prefix: String) -> String {
    token.hasPrefix("-")
      ? "-\(prefix)-\(token.dropFirst())"
      : "\(prefix)-\(token)"
  }
}

extension Spacing where Self == DefaultSpacing {
  /// The `px` keyword (a single CSS pixel), e.g. `p-px`.
  public static var px: DefaultSpacing {  // swiftlint:disable:this identifier_name
    .px
  }

  /// The `auto` keyword, e.g. `mx-auto`.
  public static var auto: DefaultSpacing { .auto }

  /// A negative spacing value, e.g. `.neg(2)` on `.mx` → `-mx-2`,
  /// on `.top` → `-top-2`.
  ///
  /// Tailwind emits negatives by prefixing the whole utility with `-`; every
  /// spacing/inset/gap utility routes through ``DefaultSpacing/className(prefix:)``
  /// so the `-` is moved ahead of the prefix consistently.
  public static func neg(_ value: Int) -> DefaultSpacing {
    .init("-\(value)")
  }

  /// A documented [arbitrary value](https://tailwindcss.com/docs/adding-custom-styles),
  /// e.g. `.arbitrary("13px")` on `.gap` → `gap-[13px]`. Spaces become
  /// underscores (Tailwind converts them back at build time).
  public static func arbitrary(_ value: String) -> DefaultSpacing {
    .init("[\(value.replacingOccurrences(of: " ", with: "_"))]")
  }
}
