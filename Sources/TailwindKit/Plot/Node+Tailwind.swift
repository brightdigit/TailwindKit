//
//  Node+Tailwind.swift
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

import Plot

extension Node where Context: HTMLContext {
  /// Render a ``TailwindStyleBuilder`` into this element's `class` attribute.
  ///
  /// Sugar for `.class(style.rendered)`:
  ///
  /// ```swift
  /// Node.div(.tailwind(.flex.items(.center).gap(4)))
  /// // <div class="flex items-center gap-4"></div>
  /// ```
  ///
  /// For any class not modeled by ``TailwindStyleBuilder``, use Plot's existing
  /// `.class("…")` directly.
  public static func tailwind(_ style: TailwindStyleBuilder) -> Node {
    .class(style.rendered)
  }
}

extension Attribute where Context: HTMLContext {
  /// Render a ``TailwindStyleBuilder`` into this element's `class` attribute.
  ///
  /// Sugar for `.class(style.rendered)`.
  public static func tailwind(_ style: TailwindStyleBuilder) -> Attribute {
    .class(style.rendered)
  }
}

extension Component {
  /// Render a ``TailwindStyleBuilder`` into this component's `class` attribute.
  ///
  /// Sugar for `.class(style.rendered)` on Plot components (e.g. `Image`,
  /// `Link`), which — unlike `Node`/`Attribute` — expose class assignment as an
  /// instance modifier rather than a static factory:
  ///
  /// ```swift
  /// Image("logo.png").tailwind(.rounded(.lg))
  /// // <img src="logo.png" class="rounded-lg"/>
  /// ```
  ///
  /// - Parameters:
  ///   - style: The Tailwind style builder to render.
  ///   - replaceExisting: Whether the rendered classes should replace any
  ///     existing `class` value. Defaults to `false`, appending instead.
  /// - Returns: The resulting component.
  public func tailwind(
    _ style: TailwindStyleBuilder,
    replaceExisting: Bool = false
  ) -> Component {
    self.class(style.rendered, replaceExisting: replaceExisting)
  }
}
