//
//  TypographyStyling.swift
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

/// Typography utilities — font size/weight/style, text decoration & transform,
/// alignment, tracking, and line height.
///
/// A capability protocol witnessed against the ``TailwindStyle`` seam;
/// ``TailwindStyleBuilder`` conforms to it. The color-based `text(_:_:)` overloads live
/// in ``ColorStyling``; here `text(_:)` covers size and alignment. See
/// ``TailwindStyle`` for the architecture rationale.
public protocol TypographyStyling {
  /// `text-white`.
  var textWhite: Self { get }
  /// `text-black`.
  var textBlack: Self { get }
  /// `italic`.
  var italic: Self { get }
  /// `underline`.
  var underline: Self { get }
  /// `no-underline`.
  var noUnderline: Self { get }
  /// `uppercase`.
  var uppercase: Self { get }
  /// `lowercase`.
  var lowercase: Self { get }
  /// `capitalize`.
  var capitalize: Self { get }
  /// `whitespace-pre-wrap`.
  var whitespacePreWrap: Self { get }
  /// `leading-none` (`line-height: 1`).
  var leadingNone: Self { get }

  /// `text-<size>`, e.g. `.text(.lg)`.
  func text(_ size: some TextSize) -> Self
  /// `text-<align>`, e.g. `.text(.center)`.
  func text(_ align: TextAlign) -> Self
  /// `font-<weight>`, e.g. `.font(.medium)`.
  func font(_ weight: some FontWeight) -> Self
  /// `align-<value>`, e.g. `.align(.middle)` → `align-middle`.
  func align(_ value: VerticalAlign) -> Self
  /// `tracking-<value>`, e.g. `.tracking(.tight)`.
  func tracking(_ value: some Tracking) -> Self
  /// `leading-<n>` (numeric line-height), e.g. `.leading(6)`.
  func leading(_ value: Int) -> Self
}

extension TypographyStyling where Self: TailwindStyle {
  // MARK: Bare

  /// `text-white`.
  public var textWhite: Self {
    appending(DefaultTailwindClass("text-white"))
  }
  /// `text-black`.
  public var textBlack: Self {
    appending(DefaultTailwindClass("text-black"))
  }
  /// `italic`.
  public var italic: Self { appending(DefaultTailwindClass("italic")) }
  /// `underline`.
  public var underline: Self { appending(DefaultTailwindClass("underline")) }
  /// `no-underline`.
  public var noUnderline: Self {
    appending(DefaultTailwindClass("no-underline"))
  }
  /// `uppercase`.
  public var uppercase: Self { appending(DefaultTailwindClass("uppercase")) }
  /// `lowercase`.
  public var lowercase: Self { appending(DefaultTailwindClass("lowercase")) }
  /// `capitalize`.
  public var capitalize: Self {
    appending(DefaultTailwindClass("capitalize"))
  }
  /// `whitespace-pre-wrap`.
  public var whitespacePreWrap: Self {
    appending(DefaultTailwindClass("whitespace-pre-wrap"))
  }
  /// `leading-none` (`line-height: 1`).
  public var leadingNone: Self {
    appending(DefaultTailwindClass("leading-none"))
  }

  // MARK: Parameterized

  /// `text-<size>`, e.g. `.text(.lg)`.
  public func text(_ size: some TextSize) -> Self {
    appending(DefaultTailwindClass("text-\(size.token)"))
  }
  /// `text-<align>`, e.g. `.text(.center)`.
  public func text(_ align: TextAlign) -> Self {
    appending(DefaultTailwindClass("text-\(align.token)"))
  }
  /// `font-<weight>`, e.g. `.font(.medium)`.
  public func font(_ weight: some FontWeight) -> Self {
    appending(DefaultTailwindClass("font-\(weight.token)"))
  }
  /// `align-<value>`, e.g. `.align(.middle)` → `align-middle`.
  public func align(_ value: VerticalAlign) -> Self {
    appending(DefaultTailwindClass("align-\(value.token)"))
  }
  /// `tracking-<value>`, e.g. `.tracking(.tight)`.
  public func tracking(_ value: some Tracking) -> Self {
    appending(DefaultTailwindClass("tracking-\(value.token)"))
  }
  /// `leading-<n>` (numeric line-height), e.g. `.leading(6)`.
  public func leading(_ value: Int) -> Self {
    appending(DefaultTailwindClass("leading-\(value)"))
  }
}

extension TailwindStyleBuilder: TypographyStyling {}

// Static mirrors so a typography utility can start a chain with a leading dot.
extension TailwindStyleBuilder {
  /// `text-white`.
  public static var textWhite: TailwindStyleBuilder { TailwindStyleBuilder().textWhite }
  /// `text-black`.
  public static var textBlack: TailwindStyleBuilder { TailwindStyleBuilder().textBlack }
  /// `italic`.
  public static var italic: TailwindStyleBuilder { TailwindStyleBuilder().italic }
  /// `underline`.
  public static var underline: TailwindStyleBuilder { TailwindStyleBuilder().underline }
  /// `no-underline`.
  public static var noUnderline: TailwindStyleBuilder { TailwindStyleBuilder().noUnderline }
  /// `uppercase`.
  public static var uppercase: TailwindStyleBuilder { TailwindStyleBuilder().uppercase }
  /// `lowercase`.
  public static var lowercase: TailwindStyleBuilder { TailwindStyleBuilder().lowercase }
  /// `capitalize`.
  public static var capitalize: TailwindStyleBuilder { TailwindStyleBuilder().capitalize }
  /// `whitespace-pre-wrap`.
  public static var whitespacePreWrap: TailwindStyleBuilder {
    TailwindStyleBuilder().whitespacePreWrap
  }
  /// `leading-none`.
  public static var leadingNone: TailwindStyleBuilder { TailwindStyleBuilder().leadingNone }
}

extension TailwindStyleBuilder {
  /// `text-<size>`.
  public static func text(_ size: some TextSize) -> TailwindStyleBuilder {
    TailwindStyleBuilder().text(size)
  }
  /// `text-<align>`.
  public static func text(_ align: TextAlign) -> TailwindStyleBuilder {
    TailwindStyleBuilder().text(align)
  }
  /// `font-<weight>`.
  public static func font(_ weight: some FontWeight) -> TailwindStyleBuilder {
    TailwindStyleBuilder().font(weight)
  }
  /// `align-<value>`.
  public static func align(_ value: VerticalAlign) -> TailwindStyleBuilder {
    TailwindStyleBuilder().align(value)
  }
  /// `tracking-<value>`.
  public static func tracking(_ value: some Tracking) -> TailwindStyleBuilder {
    TailwindStyleBuilder().tracking(value)
  }
  /// `leading-<n>`.
  public static func leading(_ value: Int) -> TailwindStyleBuilder {
    TailwindStyleBuilder().leading(value)
  }
}
