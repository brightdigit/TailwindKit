//
//  TailwindStyleCoverageTests.swift
//  TailwindKit
//
//  Created by Leo Dion.
//  Copyright © 2026 BrightDigit.
//

import Testing

@testable import TailwindKit

/// #67 coverage — documented Tailwind v4 utilities derived from the 391
/// `@apply` directives in `Styling/styles/styles.css`. Every assertion maps to
/// a token actually used on the site, confirmed present in the official v4 docs.
/// Plot-independent: asserts `.rendered` string equality only.
@Suite internal struct TailwindStyleCoverageTests {
  @Test internal func positionAndZIndex() {
    #expect(TW.position(.relative).rendered == "relative")
    #expect(TW.position(.absolute).rendered == "absolute")
    #expect(TW.position(.fixed).position(.sticky).rendered == "fixed sticky")
    #expect(TW.top(0).right(2).bottom(2).left(6).rendered == "top-0 right-2 bottom-2 left-6")
    #expect(TW.z(0).rendered == "z-0")
    #expect(TW.z(50).rendered == "z-50")
  }

  @Test internal func containerAndContents() {
    #expect(TW.container.rendered == "container")
    #expect(TW.contents.rendered == "contents")
    // xl:container / xl:mx-auto from the corpus.
    #expect(TW.xl(.container).xl(.mx(.auto)).rendered == "xl:container xl:mx-auto")
  }

  @Test internal func flexAndGridExtras() {
    #expect(TW.flex(.one).rendered == "flex-1")
    #expect(TW.flex(.none).rendered == "flex-none")
    #expect(TW.flex(.auto).flex(.initial).rendered == "flex-auto flex-initial")
    #expect(TW.flexDirection(.row).flexDirection(.col).rendered == "flex-row flex-col")
    #expect(TW.flexDirection(.rowReverse).rendered == "flex-row-reverse")
    #expect(TW.flexDirection(.colReverse).rendered == "flex-col-reverse")
    #expect(TW.grow0.rendered == "grow-0")
    #expect(TW.shrink0.rendered == "shrink-0")
    #expect(TW.gridCols(4).rendered == "grid-cols-4")
  }

  @Test internal func selfPlaceAndContentAlignment() {
    #expect(TW.selfAlign(.center).selfAlign(.start).rendered == "self-center self-start")
    #expect(TW.justifyItems(.end).rendered == "justify-items-end")
    #expect(TW.justifyItems(.stretch).rendered == "justify-items-stretch")
    #expect(TW.justifySelf(.center).rendered == "justify-self-center")
    #expect(TW.content(.between).rendered == "content-between")
    #expect(TW.placeItems(.stretch).rendered == "place-items-stretch")
    #expect(TW.placeSelf(.center).rendered == "place-self-center")
    #expect(TW.placeSelf(.stretch).rendered == "place-self-stretch")
    #expect(TW.items(.stretch).rendered == "items-stretch")
  }

  @Test internal func sizingFractionsAndMax() {
    #expect(TW.w(.fraction(1, 2)).rendered == "w-1/2")
    #expect(TW.w(.fraction(3, 4)).rendered == "w-3/4")
    #expect(TW.w(.full).rendered == "w-full")
    #expect(TW.maxW(.xl4).rendered == "max-w-4xl")
    #expect(TW.maxW(.sm).rendered == "max-w-sm")
    #expect(TW.maxW(.full).maxW(.none).rendered == "max-w-full max-w-none")
    #expect(TW.maxW(.arbitrary("48rem")).rendered == "max-w-[48rem]")
    #expect(TW.maxH(60).maxH(.full).rendered == "max-h-60 max-h-full")
    #expect(TW.h(.auto).w(.auto).rendered == "h-auto w-auto")
  }

  @Test internal func negativeMargins() {
    // The corpus uses -mx-2, -ml-2, -mt-2 via the negative-margin variant helper.
    #expect(TW.mx(.neg(2)).rendered == "-mx-2")
    #expect(TW.ml(.neg(2)).mt(.neg(2)).rendered == "-ml-2 -mt-2")
  }

  @Test internal func bordersSidesStyleAndRadius() {
    #expect(TW.border(.top, 2).rendered == "border-t-2")
    #expect(TW.border(.bottom, 2).rendered == "border-b-2")
    #expect(TW.border(.top, 0).border(.bottom, 0).rendered == "border-t-0 border-b-0")
    #expect(TW.border(0).rendered == "border-0")
    #expect(TW.borderNone.rendered == "border-none")
    // v4 radius scale, incl. the renamed small end.
    #expect(TW.rounded(.xs).rendered == "rounded-xs")
    #expect(
      TW.rounded(.sm).rounded(.md).rounded(.xl).rendered == "rounded-sm rounded-md rounded-xl"
    )
  }

  @Test internal func colorOpacityModifiers() {
    #expect(TW.bgWhite(opacity: 90).rendered == "bg-white/90")
    #expect(TW.bgBlack(opacity: 30).rendered == "bg-black/30")
    #expect(TW.borderColor(.gray, .s400, opacity: 10).rendered == "border-gray-400/10")
  }

  @Test internal func typographyExtras() {
    #expect(TW.leadingNone.rendered == "leading-none")
    #expect(TW.leading(6).rendered == "leading-6")
    #expect(
      TW.tracking(.tight).tracking(.tighter).tracking(.wide).rendered
        == "tracking-tight tracking-tighter tracking-wide"
    )
    #expect(
      TW.tracking(.wider).tracking(.widest).tracking(.normal).rendered
        == "tracking-wider tracking-widest tracking-normal"
    )
    #expect(TW.noUnderline.rendered == "no-underline")
    #expect(TW.align(.middle).rendered == "align-middle")
    #expect(TW.list(.disc).list(.inside).rendered == "list-disc list-inside")
    #expect(
      TW.list(.decimal).list(.none).list(.outside).rendered
        == "list-decimal list-none list-outside"
    )
    #expect(TW.whitespacePreWrap.rendered == "whitespace-pre-wrap")
    #expect(TW.font(.black).rendered == "font-black")
    #expect(TW.text(.xl8).rendered == "text-8xl")
  }

  @Test internal func effectsShadowRingOpacity() {
    #expect(TW.shadow(.lg).rendered == "shadow-lg")
    #expect(TW.shadow(.xl).shadow(.none).rendered == "shadow-xl shadow-none")
    #expect(TW.dropShadow(.xl).rendered == "drop-shadow-xl")
    #expect(TW.ring(4).rendered == "ring-4")
    #expect(
      TW.opacity(50).opacity(90).opacity(95).opacity(100).rendered
        == "opacity-50 opacity-90 opacity-95 opacity-100"
    )
    #expect(TW.object(.cover).object(.contain).rendered == "object-cover object-contain")
  }

  @Test internal func transitionsAndFilters() {
    #expect(TW.transitionAll.transitionOpacity.rendered == "transition-all transition-opacity")
    #expect(TW.duration(300).duration(1_000).rendered == "duration-300 duration-1000")
    #expect(TW.ease(.inOut).rendered == "ease-in-out")
    #expect(TW.backdropBlur(.lg).backdropBlur(.sm).rendered == "backdrop-blur-lg backdrop-blur-sm")
    #expect(TW.backdropBrightness(50).rendered == "backdrop-brightness-50")
    #expect(TW.backdropGrayscale.rendered == "backdrop-grayscale")
    #expect(TW.hueRotate(180).rendered == "hue-rotate-180")
    #expect(TW.invert.grayscale.rendered == "invert grayscale")
  }

  @Test internal func composedChainFromCorpus() {
    // A realistic multi-utility chain resembling the site's @apply groups.
    #expect(
      TW.flex.flexDirection(.col).position(.relative).z(50).shadow(.lg).rounded(.lg).rendered
        == "flex flex-col relative z-50 shadow-lg rounded-lg"
    )
    // Responsive composition: sm:flex-none lg:w-1/2 md:text-lg.
    #expect(
      TW.sm(.flex(.none)).lg(.w(.fraction(1, 2))).md(.text(.lg)).rendered
        == "sm:flex-none lg:w-1/2 md:text-lg"
    )
  }
}
