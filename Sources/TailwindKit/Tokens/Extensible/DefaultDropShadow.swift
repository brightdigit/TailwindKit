//
//  DefaultDropShadow.swift
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

/// The built-in Tailwind v4 drop-shadow values.
public struct DefaultDropShadow: DropShadow {
  // swiftlint:disable identifier_name
  /// `drop-shadow-xs`.
  public static let xs = DefaultDropShadow("xs")
  /// `drop-shadow-sm`.
  public static let sm = DefaultDropShadow("sm")
  /// `drop-shadow-md`.
  public static let md = DefaultDropShadow("md")
  /// `drop-shadow-lg`.
  public static let lg = DefaultDropShadow("lg")
  /// `drop-shadow-xl`.
  public static let xl = DefaultDropShadow("xl")
  // swiftlint:enable identifier_name
  /// `drop-shadow-2xl`.
  public static let xl2 = DefaultDropShadow("2xl")
  /// `drop-shadow-none`.
  public static let none = DefaultDropShadow("none")

  /// The rendered fragment, e.g. `"xl"`.
  public let token: String

  internal init(_ token: String) {
    self.token = token
  }
}

extension DropShadow where Self == DefaultDropShadow {
  // swiftlint:disable identifier_name
  /// `drop-shadow-xs`.
  public static var xs: DefaultDropShadow { .xs }
  /// `drop-shadow-sm`.
  public static var sm: DefaultDropShadow { .sm }
  /// `drop-shadow-md`.
  public static var md: DefaultDropShadow { .md }
  /// `drop-shadow-lg`.
  public static var lg: DefaultDropShadow { .lg }
  /// `drop-shadow-xl`.
  public static var xl: DefaultDropShadow { .xl }
  // swiftlint:enable identifier_name
  /// `drop-shadow-2xl`.
  public static var xl2: DefaultDropShadow { .xl2 }
  /// `drop-shadow-none`.
  public static var none: DefaultDropShadow { .none }
}
