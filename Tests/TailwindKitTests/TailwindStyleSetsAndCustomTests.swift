//
//  TailwindStyleSetsAndCustomTests.swift
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

/// Covers the two PR #157 review fixes: the "sets" that replaced the flat bare
/// layout utilities, and the type-safe arbitrary-value API (`.arbitrary(_:value:)`,
/// `.arbitrary(_:variable:)`, `.custom(property:value:)`) that replaced the
/// removed `Custom` type. Plot-independent: asserts `.rendered` string equality.
@Suite internal struct TailwindStyleSetsAndCustomTests {
  // MARK: Layout sets

  @Test internal func positionSetCoversEveryCase() {
    #expect(TW.position(.relative).rendered == "relative")
    #expect(TW.position(.absolute).rendered == "absolute")
    #expect(TW.position(.fixed).rendered == "fixed")
    #expect(TW.position(.sticky).rendered == "sticky")
    // Instance entry point agrees with the leading-dot static entry.
    #expect(TailwindStyleBuilder().position(.relative) == TailwindStyleBuilder.position(.relative))
  }

  @Test internal func flexShorthandSet() {
    #expect(TW.flex(.one).rendered == "flex-1")
    #expect(TW.flex(.auto).rendered == "flex-auto")
    #expect(TW.flex(.initial).rendered == "flex-initial")
    #expect(TW.flex(.none).rendered == "flex-none")
    // The display `flex` bare property still coexists with the `flex(_:)` set.
    #expect(TW.flex.flex(.one).rendered == "flex flex-1")
  }

  @Test internal func flexDirectionSet() {
    #expect(TW.flexDirection(.row).rendered == "flex-row")
    #expect(TW.flexDirection(.col).rendered == "flex-col")
    #expect(TW.flexDirection(.rowReverse).rendered == "flex-row-reverse")
    #expect(TW.flexDirection(.colReverse).rendered == "flex-col-reverse")
  }

  @Test internal func listStyleSet() {
    #expect(TW.list(.disc).rendered == "list-disc")
    #expect(TW.list(.decimal).rendered == "list-decimal")
    #expect(TW.list(.none).rendered == "list-none")
    #expect(TW.list(.inside).rendered == "list-inside")
    #expect(TW.list(.outside).rendered == "list-outside")
  }

  // MARK: Custom / arbitrary values

  @Test internal func arbitraryLiteralValues() {
    #expect(TW.arbitrary("top", value: "117px").rendered == "top-[117px]")
    #expect(TW.arbitrary("w", value: "200px").rendered == "w-[200px]")
    #expect(TW.arbitrary("bg", value: "#bada55").rendered == "bg-[#bada55]")
    #expect(TW.arbitrary("text", value: "22px").rendered == "text-[22px]")
  }

  @Test internal func arbitraryValuesEscapeSpacesAsUnderscores() {
    // Tailwind converts underscores back to spaces at build time.
    #expect(
      TW.arbitrary("grid-cols", value: "1fr 500px 2fr").rendered
        == "grid-cols-[1fr_500px_2fr]"
    )
    // Existing underscores are preserved verbatim.
    #expect(
      TW.arbitrary("bg", value: "url('/what_a_rush.png')").rendered
        == "bg-[url('/what_a_rush.png')]"
    )
  }

  @Test internal func cssVariableParenthesesForm() {
    #expect(TW.arbitrary("bg", variable: "--brand").rendered == "bg-(--brand)")
    #expect(
      TW.arbitrary("fill", variable: "--my-brand-color").rendered
        == "fill-(--my-brand-color)"
    )
  }

  @Test internal func arbitraryProperty() {
    #expect(
      TW.custom(property: "mask-type", value: "luminance").rendered
        == "[mask-type:luminance]"
    )
    #expect(
      TW.custom(property: "--scroll-offset", value: "56px").rendered
        == "[--scroll-offset:56px]"
    )
  }

  @Test internal func customValuesComposeWithVariantsAndUtilities() {
    // Arbitrary values combine with responsive/state prefixes and normal utilities.
    #expect(
      TW.arbitrary("top", value: "117px").lg(.arbitrary("top", value: "344px")).rendered
        == "top-[117px] lg:top-[344px]"
    )
    #expect(TW.flex.arbitrary("gap", value: "13px").rendered == "flex gap-[13px]")
  }
}
