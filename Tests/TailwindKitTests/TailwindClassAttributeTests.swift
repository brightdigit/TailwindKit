//
//  TailwindClassAttributeTests.swift
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

import Testing

@testable import TailwindKit

/// Exercises the HTML-library-independent seam.
///
/// Conforms a local stand-in rather than a real HTML element, which is the point
/// of the seam: TailwindKit gains the `.tailwind(…)` sugar without depending on
/// any HTML library.
@Suite internal struct TailwindClassAttributeTests {
  /// Stands in for an HTML library's attribute type.
  ///
  /// Declares only `class(_:)` — the same factory Plot's `Node` and `Attribute`
  /// already have — and no member written for the protocol's sake. That is the
  /// property the seam exists for: adopting it costs a declaration, not an
  /// implementation.
  private struct StubAttribute: TailwindClassAttribute {
    let className: String

    // No `tailwindClass`-style shim: this *is* the library's own factory, and it
    // satisfies the protocol as-is.
    static func `class`(_ className: String) -> StubAttribute {
      StubAttribute(className: className)
    }
  }

  /// The conformance is satisfied entirely by the type's own `class(_:)`.
  ///
  /// The real assertion is that this file compiles at all: `StubAttribute`
  /// declares no member named for the protocol, so if the requirement ever stops
  /// matching the factory HTML libraries already provide, the conformance breaks
  /// here rather than in a consumer.
  @Test internal func conformanceNeedsNoImplementation() {
    #expect(StubAttribute.class("manual").className == "manual")
  }

  /// The protocol extension forwards the rendered class string through the
  /// conformance.
  @Test internal func tailwindForwardsRenderedString() {
    #expect(
      StubAttribute.tailwind(.flex.items(.center).gap(4)).className
        == "flex items-center gap-4"
    )
  }

  /// An empty style renders an empty class string rather than failing.
  @Test internal func emptyStyleRendersEmptyString() {
    #expect(StubAttribute.tailwind(TW()).className.isEmpty)
  }

  /// Leading-dot inference resolves through the protocol extension.
  ///
  /// This is what makes `Node.div(.tailwind(.flex))` read like a native factory
  /// at the call site. If it ever stops inferring, the ergonomics the seam
  /// exists to preserve are gone — so pin it explicitly.
  @Test internal func leadingDotInfersThroughProtocolExtension() {
    let attribute: StubAttribute = .tailwind(.rounded(.lg))
    #expect(attribute.className == "rounded-lg")
  }
}
