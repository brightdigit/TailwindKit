//
//  TailwindClassAttribute.swift
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

/// An attribute-producing type that can be built from a `class` string.
///
/// This is the **HTML-library-independent seam**. TailwindKit models Tailwind
/// utilities but depends on no HTML library; conforming a library's attribute or
/// node type to this protocol is all that is needed to gain the ``tailwind(_:)``
/// sugar below.
///
/// The single requirement is spelled ``class(_:)`` — the name HTML libraries
/// already give this factory — so a conformance is a **declaration with no
/// implementation**. For [Plot](https://github.com/JohnSundell/Plot), whose
/// `Node` and `Attribute` both declare
/// `public static func class(_ className: String) -> Self` under
/// `Context: HTMLContext`, the existing member satisfies the requirement
/// directly:
///
/// ```swift
/// extension Node: TailwindClassAttribute where Context: HTMLContext {}
/// extension Attribute: TailwindClassAttribute where Context: HTMLContext {}
/// ```
///
/// One conditional conformance covers every context, and leading-dot inference
/// keeps working through the protocol extension, so `.tailwind(…)` reads exactly
/// as a native factory would:
///
/// ```swift
/// Node.div(.tailwind(.flex.items(.center).gap(4)))
/// // <div class="flex items-center gap-4"></div>
/// ```
///
/// Types whose class assignment is an *instance* modifier rather than a static
/// factory — Plot's `Component`, say — cannot use this protocol, because a
/// protocol cannot be retroactively conformed to another protocol. Write the
/// one-line sugar directly on those instead.
public protocol TailwindClassAttribute {
  /// Creates a value representing a `class` attribute set to `className`.
  ///
  /// - Parameter className: The space-separated class string to assign.
  /// - Returns: The created value.
  static func `class`(_ className: String) -> Self
}

extension TailwindClassAttribute {
  /// Renders a ``TailwindStyleBuilder`` into this element's `class` attribute.
  ///
  /// Sugar for ``class(_:)`` applied to
  /// ``TailwindStyleBuilder/rendered``:
  ///
  /// ```swift
  /// Node.div(.tailwind(.flex.items(.center).gap(4)))
  /// // <div class="flex items-center gap-4"></div>
  /// ```
  ///
  /// For any class TailwindKit does not model, use the HTML library's own
  /// `class` API directly.
  ///
  /// - Parameter style: The Tailwind style to render.
  /// - Returns: The created value.
  public static func tailwind(_ style: TailwindStyleBuilder) -> Self {
    .class(style.rendered)
  }
}
