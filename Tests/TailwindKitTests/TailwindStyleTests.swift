//
//  TailwindStyleTests.swift
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

// Plot-independent: these assert `.rendered` string equality only; nothing here
// imports Plot.
@Suite internal struct TailwindStyleTests {
  @Test internal func emptyRendersEmptyString() {
    #expect(TailwindStyleBuilder().rendered.isEmpty)
    #expect(TW().rendered.isEmpty)
  }

  @Test internal func confirmedCanonicalExample() {
    #expect(
      TW.flex.items(.center).gap(4).bg(.blue, .s500).rendered
        == "flex items-center gap-4 bg-blue-500"
    )
  }

  @Test internal func planExample() {
    #expect(
      TW.flex.items(.center).gap(4).rendered == "flex items-center gap-4"
    )
  }

  @Test internal func colorShadeToken() {
    #expect(TW.bg(.blue, .s500).rendered == "bg-blue-500")
    #expect(TW.text(.gray, .s700).rendered == "text-gray-700")
    #expect(TW.borderColor(.slate, .s200).rendered == "border-slate-200")
  }

  @Test internal func bareUtilitiesAreProperties() {
    #expect(TW.flex.rendered == "flex")
    #expect(TW.grid.rendered == "grid")
    #expect(TW.hidden.rendered == "hidden")
    #expect(TW.italic.underline.rendered == "italic underline")
  }

  @Test internal func spacingScale() {
    #expect(TW.p(4).rendered == "p-4")
    #expect(TW.px(2.5).rendered == "px-2.5")
    #expect(TW.my(0).mt(8).rendered == "my-0 mt-8")
    #expect(TW.p(.px).rendered == "p-px")
    // A whole-number float drops its trailing ".0".
    #expect(TW.gap(2.0).rendered == "gap-2")
  }

  @Test internal func sizing() {
    #expect(TW.w(.full).h(.screen).rendered == "w-full h-screen")
    #expect(TW.w(4).rendered == "w-4")
    #expect(TW.h(.auto).rendered == "h-auto")
  }

  @Test internal func typography() {
    #expect(TW.text(.lg).font(.medium).rendered == "text-lg font-medium")
    #expect(TW.text(.xl2).rendered == "text-2xl")
    #expect(TW.text(.center).rendered == "text-center")
    #expect(TW.text(.blue, .s500).rendered == "text-blue-500")
  }

  @Test internal func flexAndGrid() {
    #expect(
      TW.flex.flexDirection(.col).justify(.between).items(.stretch).rendered
        == "flex flex-col justify-between items-stretch"
    )
    #expect(TW.grid.gridCols(3).gap(6).rendered == "grid grid-cols-3 gap-6")
  }

  @Test internal func bordersAndRadius() {
    #expect(TW.border.rounded.rendered == "border rounded")
    #expect(TW.border(2).rounded(.lg).rendered == "border-2 rounded-lg")
    // `rounded(.base)` collapses to bare `rounded`.
    #expect(TW.rounded(.base).rendered == "rounded")
    #expect(TW.rounded(.full).rendered == "rounded-full")
  }

  @Test internal func responsivePrefix() {
    #expect(
      TW.flex.md(.gap(4).items(.center)).rendered
        == "flex md:gap-4 md:items-center"
    )
    #expect(TW.block.lg(.hidden).rendered == "block lg:hidden")
  }

  @Test internal func statePrefix() {
    #expect(
      TW.bg(.blue, .s500).hover(.bg(.blue, .s700)).rendered
        == "bg-blue-500 hover:bg-blue-700"
    )
  }

  @Test internal func stackedPrefixes() {
    #expect(TW.md(.hover(.bg(.blue, .s700))).rendered == "md:hover:bg-blue-700")
    #expect(TW.dark(.text(.gray, .s100)).rendered == "dark:text-gray-100")
  }

  @Test internal func staticAndInstanceEntryPointsAgree() {
    // Leading-dot static entry vs. explicit-empty instance chain.
    let flexGapViaInstance = TailwindStyleBuilder().flex.gap(4)
    #expect(TailwindStyleBuilder.flex.gap(4) == flexGapViaInstance)
    let bgViaInstance = TailwindStyleBuilder().bg(.blue, .s500)
    #expect(TW.bg(.blue, .s500) == bgViaInstance)
  }

  @Test internal func equatable() {
    let lhs = TW.flex.gap(4)
    let rhs = TW.flex.gap(4)
    #expect(lhs == rhs)
    #expect(lhs != TW.flex.gap(2))
  }
}
