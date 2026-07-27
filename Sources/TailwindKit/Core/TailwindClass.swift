//
//  TailwindClass.swift
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

/// A fully-formed Tailwind utility class fragment — the whole `"bg-blue-500"`,
/// `"flex"`, or `"md:hover:gap-4"` that ``TailwindStyleBuilder`` appends to its token
/// list.
///
/// `TailwindClass` is the **seam value** the public builder primitive
/// ``TailwindStyleBuilder/appending(_:)`` accepts. It exists so the seam can be
/// `public` (required for the capability-protocol architecture — see
/// ``TailwindStyle``) *without* the public API ever accepting a raw
/// `String`: the built-in utilities construct a ``DefaultTailwindClass``,
/// whose initializer is `internal`, so a caller cannot mint one from an
/// arbitrary string. This preserves TailwindKit's invariant that the modeled
/// surface is closed and type-safe.
///
/// Unlike ``TailwindToken`` (a *value fragment* like `blue`/`500`), a
/// `TailwindClass` is an *entire* utility class. A downstream module can still
/// conform its own type as a deliberate escape hatch, but the ordinary path is
/// the leading-dot fluent members.
public protocol TailwindClass {
  /// The rendered utility class, e.g. `"bg-blue-500"`.
  var className: String { get }
}
