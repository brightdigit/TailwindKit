//
//  DefaultRadius.swift
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

/// The built-in Tailwind v4 border-radius values.
public struct DefaultRadius: Radius {
  // swiftlint:disable identifier_name
  /// `rounded-none`.
  public static let none = DefaultRadius("none")
  /// `rounded-xs`.
  public static let xs = DefaultRadius("xs")
  /// `rounded-sm`.
  public static let sm = DefaultRadius("sm")
  /// Bare `rounded` (empty token).
  public static let base = DefaultRadius("")
  /// `rounded-md`.
  public static let md = DefaultRadius("md")
  /// `rounded-lg`.
  public static let lg = DefaultRadius("lg")
  /// `rounded-xl`.
  public static let xl = DefaultRadius("xl")
  // swiftlint:enable identifier_name
  /// `rounded-2xl`.
  public static let xl2 = DefaultRadius("2xl")
  /// `rounded-3xl`.
  public static let xl3 = DefaultRadius("3xl")
  /// `rounded-full`.
  public static let full = DefaultRadius("full")

  /// The rendered fragment, e.g. `"lg"`; `""` for the bare `rounded`.
  public let token: String

  internal init(_ token: String) {
    self.token = token
  }
}

extension Radius where Self == DefaultRadius {
  // swiftlint:disable identifier_name
  /// `rounded-none`.
  public static var none: DefaultRadius { .none }
  /// `rounded-xs`.
  public static var xs: DefaultRadius { .xs }
  /// `rounded-sm`.
  public static var sm: DefaultRadius { .sm }
  /// Bare `rounded` (empty token).
  public static var base: DefaultRadius { .base }
  /// `rounded-md`.
  public static var md: DefaultRadius { .md }
  /// `rounded-lg`.
  public static var lg: DefaultRadius { .lg }
  /// `rounded-xl`.
  public static var xl: DefaultRadius { .xl }
  // swiftlint:enable identifier_name
  /// `rounded-2xl`.
  public static var xl2: DefaultRadius { .xl2 }
  /// `rounded-3xl`.
  public static var xl3: DefaultRadius { .xl3 }
  /// `rounded-full`.
  public static var full: DefaultRadius { .full }
}
