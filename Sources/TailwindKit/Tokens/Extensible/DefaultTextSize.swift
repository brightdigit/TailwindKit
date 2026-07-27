//
//  DefaultTextSize.swift
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

/// The built-in Tailwind v4 font sizes.
public struct DefaultTextSize: TextSize {
  // swiftlint:disable identifier_name
  /// `text-xs`.
  public static let xs = DefaultTextSize("xs")
  /// `text-sm`.
  public static let sm = DefaultTextSize("sm")
  /// `text-base`.
  public static let base = DefaultTextSize("base")
  /// `text-lg`.
  public static let lg = DefaultTextSize("lg")
  /// `text-xl`.
  public static let xl = DefaultTextSize("xl")
  // swiftlint:enable identifier_name
  /// `text-2xl`.
  public static let xl2 = DefaultTextSize("2xl")
  /// `text-3xl`.
  public static let xl3 = DefaultTextSize("3xl")
  /// `text-4xl`.
  public static let xl4 = DefaultTextSize("4xl")
  /// `text-5xl`.
  public static let xl5 = DefaultTextSize("5xl")
  /// `text-6xl`.
  public static let xl6 = DefaultTextSize("6xl")
  /// `text-7xl`.
  public static let xl7 = DefaultTextSize("7xl")
  /// `text-8xl`.
  public static let xl8 = DefaultTextSize("8xl")
  /// `text-9xl`.
  public static let xl9 = DefaultTextSize("9xl")

  /// The rendered fragment, e.g. `"lg"`, `"2xl"`.
  public let token: String

  internal init(_ token: String) {
    self.token = token
  }
}

extension TextSize where Self == DefaultTextSize {
  // swiftlint:disable identifier_name
  /// `text-xs`.
  public static var xs: DefaultTextSize { .xs }
  /// `text-sm`.
  public static var sm: DefaultTextSize { .sm }
  /// `text-base`.
  public static var base: DefaultTextSize { .base }
  /// `text-lg`.
  public static var lg: DefaultTextSize { .lg }
  /// `text-xl`.
  public static var xl: DefaultTextSize { .xl }
  // swiftlint:enable identifier_name
  /// `text-2xl`.
  public static var xl2: DefaultTextSize { .xl2 }
  /// `text-3xl`.
  public static var xl3: DefaultTextSize { .xl3 }
  /// `text-4xl`.
  public static var xl4: DefaultTextSize { .xl4 }
  /// `text-5xl`.
  public static var xl5: DefaultTextSize { .xl5 }
  /// `text-6xl`.
  public static var xl6: DefaultTextSize { .xl6 }
  /// `text-7xl`.
  public static var xl7: DefaultTextSize { .xl7 }
  /// `text-8xl`.
  public static var xl8: DefaultTextSize { .xl8 }
  /// `text-9xl`.
  public static var xl9: DefaultTextSize { .xl9 }
}
