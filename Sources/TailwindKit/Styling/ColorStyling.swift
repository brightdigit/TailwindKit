//
//  ColorStyling.swift
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

/// The background/text/border **color** utilities.
///
/// A capability protocol whose members are witnessed against the
/// ``TailwindStyle`` seam; ``TailwindStyleBuilder`` conforms to it. See
/// ``TailwindStyle`` for why the surface is organized this way.
public protocol ColorStyling {
  /// `bg-white`.
  var bgWhite: Self { get }
  /// `bg-black`.
  var bgBlack: Self { get }
  /// `bg-transparent`.
  var bgTransparent: Self { get }

  /// `bg-<color>-<shade>`, e.g. `.bg(.blue, .s500)`.
  func bg(_ color: some Color, _ shade: Shade) -> Self
  /// `border-<color>-<shade>`, e.g. `.borderColor(.gray, .s200)`.
  func borderColor(_ color: some Color, _ shade: Shade) -> Self
  /// `text-<color>-<shade>`, e.g. `.text(.blue, .s500)`.
  func text(_ color: some Color, _ shade: Shade) -> Self

  /// `bg-white/<opacity>`, e.g. `.bgWhite(opacity: 90)` → `bg-white/90`.
  func bgWhite(opacity: Int) -> Self
  /// `bg-black/<opacity>`, e.g. `.bgBlack(opacity: 30)` → `bg-black/30`.
  func bgBlack(opacity: Int) -> Self
  /// `bg-<color>-<shade>/<opacity>`, e.g. `.bg(.gray, .s500, opacity: 50)`.
  func bg(_ color: some Color, _ shade: Shade, opacity: Int)
    -> Self
  /// `text-<color>-<shade>/<opacity>`.
  func text(_ color: some Color, _ shade: Shade, opacity: Int)
    -> Self
  /// `border-<color>-<shade>/<opacity>`, e.g. `.borderColor(.gray, .s400, opacity: 10)`.
  func borderColor(_ color: some Color, _ shade: Shade, opacity: Int)
    -> Self
}

extension ColorStyling where Self: TailwindStyle {
  // MARK: Bare

  /// `bg-white`.
  public var bgWhite: Self { appending(DefaultTailwindClass("bg-white")) }
  /// `bg-black`.
  public var bgBlack: Self { appending(DefaultTailwindClass("bg-black")) }
  /// `bg-transparent`.
  public var bgTransparent: Self {
    appending(DefaultTailwindClass("bg-transparent"))
  }

  // MARK: Color + shade

  /// `bg-<color>-<shade>`, e.g. `.bg(.blue, .s500)`.
  public func bg(_ color: some Color, _ shade: Shade) -> Self {
    appending(DefaultTailwindClass("bg-\(color.token)-\(shade.token)"))
  }
  /// `border-<color>-<shade>`, e.g. `.borderColor(.gray, .s200)`.
  public func borderColor(_ color: some Color, _ shade: Shade)
    -> Self
  {
    appending(DefaultTailwindClass("border-\(color.token)-\(shade.token)"))
  }
  /// `text-<color>-<shade>`, e.g. `.text(.blue, .s500)`.
  public func text(_ color: some Color, _ shade: Shade) -> Self {
    appending(DefaultTailwindClass("text-\(color.token)-\(shade.token)"))
  }

  // MARK: Color + shade + opacity

  /// `bg-white/<opacity>`, e.g. `.bgWhite(opacity: 90)` → `bg-white/90`.
  public func bgWhite(opacity: Int) -> Self {
    appending(DefaultTailwindClass("bg-white/\(opacity)"))
  }
  /// `bg-black/<opacity>`, e.g. `.bgBlack(opacity: 30)` → `bg-black/30`.
  public func bgBlack(opacity: Int) -> Self {
    appending(DefaultTailwindClass("bg-black/\(opacity)"))
  }
  /// `bg-<color>-<shade>/<opacity>`, e.g. `.bg(.gray, .s500, opacity: 50)`.
  public func bg(_ color: some Color, _ shade: Shade, opacity: Int)
    -> Self
  {
    appending(
      DefaultTailwindClass("bg-\(color.token)-\(shade.token)/\(opacity)")
    )
  }
  /// `text-<color>-<shade>/<opacity>`.
  public func text(_ color: some Color, _ shade: Shade, opacity: Int)
    -> Self
  {
    appending(
      DefaultTailwindClass("text-\(color.token)-\(shade.token)/\(opacity)")
    )
  }
  /// `border-<color>-<shade>/<opacity>`, e.g. `.borderColor(.gray, .s400, opacity: 10)`.
  public func borderColor(
    _ color: some Color, _ shade: Shade, opacity: Int
  ) -> Self {
    appending(
      DefaultTailwindClass("border-\(color.token)-\(shade.token)/\(opacity)")
    )
  }
}

extension TailwindStyleBuilder: ColorStyling {}

// Static mirrors so a color utility can start a chain with a leading dot.
extension TailwindStyleBuilder {
  /// `bg-white`.
  public static var bgWhite: TailwindStyleBuilder { TailwindStyleBuilder().bgWhite }
  /// `bg-black`.
  public static var bgBlack: TailwindStyleBuilder { TailwindStyleBuilder().bgBlack }
  /// `bg-transparent`.
  public static var bgTransparent: TailwindStyleBuilder { TailwindStyleBuilder().bgTransparent }
}

extension TailwindStyleBuilder {
  /// `bg-<color>-<shade>`.
  public static func bg(_ color: some Color, _ shade: Shade) -> TailwindStyleBuilder {
    TailwindStyleBuilder().bg(color, shade)
  }
  /// `border-<color>-<shade>`.
  public static func borderColor(_ color: some Color, _ shade: Shade) -> TailwindStyleBuilder {
    TailwindStyleBuilder().borderColor(color, shade)
  }
  /// `text-<color>-<shade>`.
  public static func text(_ color: some Color, _ shade: Shade) -> TailwindStyleBuilder {
    TailwindStyleBuilder().text(color, shade)
  }
  /// `bg-white/<opacity>`.
  public static func bgWhite(opacity: Int) -> TailwindStyleBuilder {
    TailwindStyleBuilder().bgWhite(opacity: opacity)
  }
  /// `bg-black/<opacity>`.
  public static func bgBlack(opacity: Int) -> TailwindStyleBuilder {
    TailwindStyleBuilder().bgBlack(opacity: opacity)
  }
  /// `bg-<color>-<shade>/<opacity>`.
  public static func bg(_ color: some Color, _ shade: Shade, opacity: Int) -> TailwindStyleBuilder {
    TailwindStyleBuilder().bg(color, shade, opacity: opacity)
  }
  /// `text-<color>-<shade>/<opacity>`.
  public static func text(_ color: some Color, _ shade: Shade, opacity: Int) -> TailwindStyleBuilder
  {
    TailwindStyleBuilder().text(color, shade, opacity: opacity)
  }
  /// `border-<color>-<shade>/<opacity>`.
  public static func borderColor(_ color: some Color, _ shade: Shade, opacity: Int)
    -> TailwindStyleBuilder
  {
    TailwindStyleBuilder().borderColor(color, shade, opacity: opacity)
  }
}
