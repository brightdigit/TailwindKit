//
//  BorderStyling.swift
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

/// The **border** and **border-radius** utilities.
///
/// A capability protocol whose members are witnessed against the
/// ``TailwindStyle`` seam; ``TailwindStyleBuilder`` conforms to it. See
/// ``TailwindStyle`` for why the surface is organized this way.
public protocol BorderStyling {
  /// `border`.
  var border: Self { get }
  /// `rounded`.
  var rounded: Self { get }
  /// `border-none`.
  var borderNone: Self { get }

  /// `border-<width>`, e.g. `.border(2)` → `border-2`.
  func border(_ width: Int) -> Self
  /// `border-<side>-<width>`, e.g. `.border(.t, 2)` → `border-t-2`.
  func border(_ side: BorderSide, _ width: Int) -> Self
  /// `rounded-<radius>`, e.g. `.rounded(.lg)` → `rounded-lg`.
  func rounded(_ radius: some Radius) -> Self
}

extension BorderStyling where Self: TailwindStyle {
  // MARK: Bare

  /// `border`.
  public var border: Self { appending(DefaultTailwindClass("border")) }
  /// `rounded`.
  public var rounded: Self { appending(DefaultTailwindClass("rounded")) }
  /// `border-none`.
  public var borderNone: Self {
    appending(DefaultTailwindClass("border-none"))
  }

  // MARK: Parameterized

  /// `border-<width>`, e.g. `.border(2)` → `border-2`.
  public func border(_ width: Int) -> Self {
    appending(DefaultTailwindClass("border-\(width)"))
  }
  /// `border-<side>-<width>`, e.g. `.border(.t, 2)` → `border-t-2`.
  public func border(_ side: BorderSide, _ width: Int) -> Self {
    appending(DefaultTailwindClass("border-\(side.token)-\(width)"))
  }
  /// `rounded-<radius>`, e.g. `.rounded(.lg)` → `rounded-lg`.
  public func rounded(_ radius: some Radius) -> Self {
    radius.token.isEmpty
      ? appending(DefaultTailwindClass("rounded"))
      : appending(DefaultTailwindClass("rounded-\(radius.token)"))
  }
}

extension TailwindStyleBuilder: BorderStyling {}

// Static mirrors so a border utility can start a chain with a leading dot.
extension TailwindStyleBuilder {
  /// `border`.
  public static var border: TailwindStyleBuilder { TailwindStyleBuilder().border }
  /// `rounded`.
  public static var rounded: TailwindStyleBuilder { TailwindStyleBuilder().rounded }
  /// `border-none`.
  public static var borderNone: TailwindStyleBuilder { TailwindStyleBuilder().borderNone }
}

extension TailwindStyleBuilder {
  /// `border-<width>`.
  public static func border(_ width: Int) -> TailwindStyleBuilder {
    TailwindStyleBuilder().border(width)
  }
  /// `border-<side>-<width>`.
  public static func border(_ side: BorderSide, _ width: Int) -> TailwindStyleBuilder {
    TailwindStyleBuilder().border(side, width)
  }
  /// `rounded-<radius>`.
  public static func rounded(_ radius: some Radius) -> TailwindStyleBuilder {
    TailwindStyleBuilder().rounded(radius)
  }
}
