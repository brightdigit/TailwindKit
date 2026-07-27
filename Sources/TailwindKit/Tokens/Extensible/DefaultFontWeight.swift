//
//  DefaultFontWeight.swift
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

/// The built-in Tailwind v4 font weights.
public struct DefaultFontWeight: FontWeight {
  /// `font-thin`.
  public static let thin = DefaultFontWeight("thin")
  /// `font-extralight`.
  public static let extralight = DefaultFontWeight("extralight")
  /// `font-light`.
  public static let light = DefaultFontWeight("light")
  /// `font-normal`.
  public static let normal = DefaultFontWeight("normal")
  /// `font-medium`.
  public static let medium = DefaultFontWeight("medium")
  /// `font-semibold`.
  public static let semibold = DefaultFontWeight("semibold")
  /// `font-bold`.
  public static let bold = DefaultFontWeight("bold")
  /// `font-extrabold`.
  public static let extrabold = DefaultFontWeight("extrabold")
  /// `font-black`.
  public static let black = DefaultFontWeight("black")

  /// The rendered fragment, e.g. `"medium"`.
  public let token: String

  internal init(_ token: String) {
    self.token = token
  }
}

extension FontWeight where Self == DefaultFontWeight {
  /// `font-thin`.
  public static var thin: DefaultFontWeight { .thin }
  /// `font-extralight`.
  public static var extralight: DefaultFontWeight { .extralight }
  /// `font-light`.
  public static var light: DefaultFontWeight { .light }
  /// `font-normal`.
  public static var normal: DefaultFontWeight { .normal }
  /// `font-medium`.
  public static var medium: DefaultFontWeight { .medium }
  /// `font-semibold`.
  public static var semibold: DefaultFontWeight { .semibold }
  /// `font-bold`.
  public static var bold: DefaultFontWeight { .bold }
  /// `font-extrabold`.
  public static var extrabold: DefaultFontWeight { .extrabold }
  /// `font-black`.
  public static var black: DefaultFontWeight { .black }
}
