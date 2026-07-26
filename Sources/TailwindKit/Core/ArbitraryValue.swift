//
//  ArbitraryValue.swift
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

/// Escapes the spaces in a Tailwind
/// [arbitrary value](https://tailwindcss.com/docs/adding-custom-styles).
///
/// A class name cannot contain a space, so Tailwind writes arbitrary values with
/// underscores and converts them back at build time: `[0_1px_2px_black]` is the
/// shadow `0 1px 2px black`.
///
/// Written as a `map` over the characters rather than
/// `replacingOccurrences(of:with:)` so that TailwindKit depends on no module at
/// all — not even Foundation.
///
/// - Parameter value: The raw arbitrary value.
/// - Returns: `value` with every space replaced by an underscore.
internal func escapingSpaces(_ value: String) -> String {
  String(value.map { $0 == " " ? "_" : $0 })
}
