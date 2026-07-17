//
//  Color.swift
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

/// A Tailwind v4 color family (the `blue` in `bg-blue-500`), backed by the
/// `--color-*` theme namespace and reused across `bg`/`text`/`border`/`ring`/…
///
/// The documented palette is exposed as static members (`.blue`, `.slate`, …).
/// Because `--color-*` is `@theme`-extensible, `Color` is a protocol: add a
/// custom family by conforming your own type — e.g.
/// `struct BrandColor: Color { let token = "brand" }` plus an
/// `extension … where Self == BrandColor { static var brand: … }` for the
/// leading-dot spelling — then `.bg(.brand, .s500)`.
public protocol Color: TailwindToken {}
