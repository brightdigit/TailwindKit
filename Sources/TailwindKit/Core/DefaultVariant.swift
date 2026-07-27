//
//  DefaultVariant.swift
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

/// The built-in Tailwind variant prefixes.
///
/// A `public` type (the return type of the static members below) with an
/// `internal` initializer, so callers reference `.md`/`.hover` but never
/// construct it directly — like ``DefaultColor``.
public struct DefaultVariant: Variant {
  // swiftlint:disable identifier_name
  /// `sm:` — ≥ 40rem breakpoint.
  public static let sm = DefaultVariant("sm")
  /// `md:` — ≥ 48rem breakpoint.
  public static let md = DefaultVariant("md")
  /// `lg:` — ≥ 64rem breakpoint.
  public static let lg = DefaultVariant("lg")
  /// `xl:` — ≥ 80rem breakpoint.
  public static let xl = DefaultVariant("xl")
  // swiftlint:enable identifier_name
  /// `2xl:` — ≥ 96rem breakpoint.
  public static let xl2 = DefaultVariant("2xl")
  /// `hover:` state variant.
  public static let hover = DefaultVariant("hover")
  /// `focus:` state variant.
  public static let focus = DefaultVariant("focus")
  /// `active:` state variant.
  public static let active = DefaultVariant("active")
  /// `disabled:` state variant.
  public static let disabled = DefaultVariant("disabled")
  /// `group-hover:` state variant.
  public static let groupHover = DefaultVariant("group-hover")
  /// `dark:` color-scheme variant.
  public static let dark = DefaultVariant("dark")

  /// The rendered prefix, e.g. `"md"`, `"hover"`.
  public let token: String

  internal init(_ token: String) {
    self.token = token
  }
}

extension Variant where Self == DefaultVariant {
  // swiftlint:disable identifier_name
  /// `sm:` — ≥ 40rem breakpoint.
  public static var sm: DefaultVariant { .sm }
  /// `md:` — ≥ 48rem breakpoint.
  public static var md: DefaultVariant { .md }
  /// `lg:` — ≥ 64rem breakpoint.
  public static var lg: DefaultVariant { .lg }
  /// `xl:` — ≥ 80rem breakpoint.
  public static var xl: DefaultVariant { .xl }
  // swiftlint:enable identifier_name
  /// `2xl:` — ≥ 96rem breakpoint.
  public static var xl2: DefaultVariant { .xl2 }
  /// `hover:` state variant.
  public static var hover: DefaultVariant { .hover }
  /// `focus:` state variant.
  public static var focus: DefaultVariant { .focus }
  /// `active:` state variant.
  public static var active: DefaultVariant { .active }
  /// `disabled:` state variant.
  public static var disabled: DefaultVariant { .disabled }
  /// `group-hover:` state variant.
  public static var groupHover: DefaultVariant { .groupHover }
  /// `dark:` color-scheme variant.
  public static var dark: DefaultVariant { .dark }
}
