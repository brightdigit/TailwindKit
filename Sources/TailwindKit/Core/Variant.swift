//
//  Variant.swift
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

/// A Tailwind **variant** prefix — the `md` in `md:flex`, the `hover` in
/// `hover:bg-blue-700`.
///
/// `Variant` is the value passed to ``TailwindStyleBuilder/prefixing(_:_:)`` and
/// exposed through the responsive/state fluent members (`.md`, `.hover`, …).
/// Variants compose by nesting — `.md(.hover(.bg(.blue, .s700)))` stacks the
/// prefixes into `"md:hover:bg-blue-700"`.
///
/// Like ``Color``, `Variant` is **extensible** (Tailwind lets
/// you register custom variants, e.g. via `@custom-variant`): conform your own
/// type to add one —
///
/// ```swift
/// struct SupportsGrid: Variant { let token = "supports-[display:grid]" }
/// TW().prefixing(SupportsGrid(), .flex) // "supports-[display:grid]:flex"
/// ```
///
/// The documented built-ins are exposed as static members on
/// ``DefaultVariant`` via the leading-dot syntax (`.md`, …).
public protocol Variant: TailwindToken {}
