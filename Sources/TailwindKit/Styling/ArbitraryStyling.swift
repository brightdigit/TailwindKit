//
//  ArbitraryStyling.swift
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

/// The **arbitrary value** escape hatch utilities.
///
/// A capability protocol whose members are witnessed against the
/// ``TailwindStyle`` seam; ``TailwindStyleBuilder`` conforms to it. See
/// ``TailwindStyle`` for why the surface is organized this way.
///
/// These members intentionally take raw `String` arguments: they are the
/// escape hatch for expressing Tailwind classes that have no strongly typed
/// counterpart. Spaces in values are escaped to underscores per Tailwind's
/// arbitrary-value syntax.
public protocol ArbitraryStyling {
  /// `<prefix>-[<value>]`, e.g. `.arbitrary("top", value: "117px")` → `top-[117px]`.
  ///
  /// Spaces in `value` are escaped to underscores.
  func arbitrary(_ prefix: String, value: String) -> Self
  /// `<prefix>-(<name>)`, e.g. `.arbitrary("bg", variable: "--brand")` → `bg-(--brand)`.
  func arbitrary(_ prefix: String, variable name: String) -> Self
  /// `[<property>:<value>]`, e.g. `.custom(property: "mask-type", value: "luminance")`.
  ///
  /// Spaces in `value` are escaped to underscores.
  func custom(property: String, value: String) -> Self
}

extension ArbitraryStyling where Self: TailwindStyle {
  private func escapingSpaces(_ value: String) -> String {
    value.replacingOccurrences(of: " ", with: "_")
  }

  /// `<prefix>-[<value>]`, e.g. `.arbitrary("top", value: "117px")` → `top-[117px]`.
  ///
  /// Spaces in `value` are escaped to underscores.
  public func arbitrary(_ prefix: String, value: String) -> Self {
    appending(DefaultTailwindClass("\(prefix)-[\(escapingSpaces(value))]"))
  }
  /// `<prefix>-(<name>)`, e.g. `.arbitrary("bg", variable: "--brand")` → `bg-(--brand)`.
  public func arbitrary(_ prefix: String, variable name: String) -> Self {
    appending(DefaultTailwindClass("\(prefix)-(\(name))"))
  }
  /// `[<property>:<value>]`, e.g. `.custom(property: "mask-type", value: "luminance")`.
  ///
  /// Spaces in `value` are escaped to underscores.
  public func custom(property: String, value: String) -> Self {
    appending(DefaultTailwindClass("[\(property):\(escapingSpaces(value))]"))
  }
}

extension TailwindStyleBuilder: ArbitraryStyling {}

// Static mirrors so an arbitrary utility can start a chain with a leading dot.
extension TailwindStyleBuilder {
  /// `<prefix>-[<value>]`.
  public static func arbitrary(_ prefix: String, value: String) -> TailwindStyleBuilder {
    TailwindStyleBuilder().arbitrary(prefix, value: value)
  }
  /// `<prefix>-(<name>)`.
  public static func arbitrary(_ prefix: String, variable name: String) -> TailwindStyleBuilder {
    TailwindStyleBuilder().arbitrary(prefix, variable: name)
  }
  /// `[<property>:<value>]`.
  public static func custom(property: String, value: String) -> TailwindStyleBuilder {
    TailwindStyleBuilder().custom(property: property, value: value)
  }
}
