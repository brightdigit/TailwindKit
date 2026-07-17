//
//  DefaultMaxWidth.swift
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

/// The built-in `max-width` scale values plus `full`/`none`.
public struct DefaultMaxWidth: MaxWidth {
  // swiftlint:disable identifier_name
  /// `max-w-sm`.
  public static let sm = DefaultMaxWidth("sm")
  /// `max-w-lg`.
  public static let lg = DefaultMaxWidth("lg")
  // swiftlint:enable identifier_name
  /// `max-w-2xl`.
  public static let xl2 = DefaultMaxWidth("2xl")
  /// `max-w-4xl`.
  public static let xl4 = DefaultMaxWidth("4xl")
  /// `max-w-full`.
  public static let full = DefaultMaxWidth("full")
  /// `max-w-none`.
  public static let none = DefaultMaxWidth("none")

  /// The rendered fragment, e.g. `"4xl"`, `"full"`.
  public let token: String

  internal init(_ token: String) {
    self.token = token
  }
}

extension MaxWidth where Self == DefaultMaxWidth {
  // swiftlint:disable identifier_name
  /// `max-w-sm`.
  public static var sm: DefaultMaxWidth { .sm }
  /// `max-w-lg`.
  public static var lg: DefaultMaxWidth { .lg }
  // swiftlint:enable identifier_name
  /// `max-w-2xl`.
  public static var xl2: DefaultMaxWidth { .xl2 }
  /// `max-w-4xl`.
  public static var xl4: DefaultMaxWidth { .xl4 }
  /// `max-w-full`.
  public static var full: DefaultMaxWidth { .full }
  /// `max-w-none`.
  public static var none: DefaultMaxWidth { .none }

  /// A documented arbitrary max-width, e.g. `.arbitrary("48rem")` →
  /// `max-w-[48rem]`. Spaces become underscores.
  public static func arbitrary(_ value: String) -> DefaultMaxWidth {
    .init("[\(value.replacingOccurrences(of: " ", with: "_"))]")
  }
}
