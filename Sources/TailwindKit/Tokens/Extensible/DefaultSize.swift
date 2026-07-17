//
//  DefaultSize.swift
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

/// The built-in width/height values.
public struct DefaultSize: Size,
  ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral
{
  /// `full` — 100%.
  public static let full = DefaultSize("full")
  /// `screen` — the viewport dimension.
  public static let screen = DefaultSize("screen")
  /// `auto`.
  public static let auto = DefaultSize("auto")
  /// `min` — `min-content`.
  public static let min = DefaultSize("min")
  /// `max` — `max-content`.
  public static let max = DefaultSize("max")
  /// `fit` — `fit-content`.
  public static let fit = DefaultSize("fit")

  /// The rendered fragment, e.g. `"4"`, `"full"`, `"1/2"`.
  public let token: String

  /// Creates a size from an integer literal on the spacing scale (e.g. `4`).
  public init(integerLiteral value: Int) {
    self.token = String(value)
  }

  /// Creates a size from a floating-point literal, dropping a trailing `.0`.
  public init(floatLiteral value: Double) {
    self.token =
      value.rounded() == value
      ? String(Int(value))
      : String(value)
  }

  internal init(_ token: String) {
    self.token = token
  }
}

extension Size where Self == DefaultSize {
  /// `full` — 100%.
  public static var full: DefaultSize { .full }
  /// `screen` — the viewport dimension.
  public static var screen: DefaultSize { .screen }
  /// `auto`.
  public static var auto: DefaultSize { .auto }
  /// `min` — `min-content`.
  public static var min: DefaultSize { .min }
  /// `max` — `max-content`.
  public static var max: DefaultSize { .max }
  /// `fit` — `fit-content`.
  public static var fit: DefaultSize { .fit }

  /// A documented width fraction, e.g. `.fraction(1, 2)` → `w-1/2`.
  ///
  /// Tailwind v4 documents fractions with denominators 2–6 only; twelfths
  /// (`w-5/12`) are not a documented width utility, so they are not offered.
  public static func fraction(_ numerator: Int, _ denominator: Int)
    -> DefaultSize
  {
    .init("\(numerator)/\(denominator)")
  }

  /// A documented [arbitrary value](https://tailwindcss.com/docs/adding-custom-styles),
  /// e.g. `.arbitrary("137px")` on `.w` → `w-[137px]`. Spaces become underscores.
  public static func arbitrary(_ value: String) -> DefaultSize {
    .init("[\(value.replacingOccurrences(of: " ", with: "_"))]")
  }
}
