![TailwindKit Logo](Sources/TailwindKit/TailwindKit.docc/Resources/TailwindKitLogo.png)

# TailwindKit


[![Swift Versions](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fbrightdigit%2FTailwindKit%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/brightdigit/TailwindKit)
[![Platforms](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fbrightdigit%2FTailwindKit%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/brightdigit/TailwindKit)
[![Documentation](https://img.shields.io/badge/docc-read_documentation-blue)](https://swiftpackageindex.com/brightdigit/TailwindKit/documentation)
[![License](https://img.shields.io/github/license/brightdigit/TailwindKit)](LICENSE)
[![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/brightdigit/TailwindKit/TailwindKit.yml?label=actions&logo=github&branch=main)](https://github.com/brightdigit/TailwindKit/actions)
[![Maintainability](https://qlty.sh/gh/brightdigit/projects/TailwindKit/maintainability.svg)](https://qlty.sh/gh/brightdigit/projects/TailwindKit)
[![Codecov](https://img.shields.io/codecov/c/github/brightdigit/TailwindKit)](https://codecov.io/gh/brightdigit/TailwindKit)
[![CodeFactor Grade](https://img.shields.io/codefactor/grade/github/brightdigit/TailwindKit)](https://www.codefactor.io/repository/github/brightdigit/TailwindKit)

Type-safe Tailwind CSS v4 utility classes for Swift.

---

## What is TailwindKit?

Server-side Swift HTML markup is full of stringly-typed CSS: `class="flex items-center gap-4"` is
just text, so a typo is a silently broken layout that no compiler and no test will catch.

**TailwindKit is a small, immutable value builder that emits [Tailwind CSS v4](https://tailwindcss.com)
utility class strings from checked Swift expressions.** Every utility is a property or a method,
every value is a typed token, and the class string only appears at the end, via `.rendered`.

```swift
import TailwindKit

TW.flex.items(.center).gap(4).bg(.blue, .s500).rendered
// "flex items-center gap-4 bg-blue-500"
```

`brightdigit.com` uses TailwindKit to author its component markup.

> **Scope:** TailwindKit is **Tailwind v4 only**, and its modeled utility surface is deliberately
> **closed** — a set of Swift enums and methods that grows as consuming components need new
> classes, not a mirror of every class Tailwind can emit. The public API accepts no free-form class
> name; the only caller-supplied strings go through the explicit arbitrary-value API below. For a
> class that isn't modeled at all, the escape hatch is Plot's existing `.class("…")`.

## Installation

Add TailwindKit to your `Package.swift`:

```swift
dependencies: [
  .package(url: "https://github.com/brightdigit/TailwindKit.git", from: "1.0.0")
]
```

Then add it to a target:

```swift
.target(
  name: "MySite",
  dependencies: [.product(name: "TailwindKit", package: "TailwindKit")]
)
```

## Usage

### The builder

The core type is `TailwindStyleBuilder` — an immutable value builder where every member returns a
new builder. Bare utilities are computed properties; parameterized utilities are methods. `TW` is a
type alias for the builder, so a chain can start with the type name or with a leading dot.

```swift
TW.flex.flexDirection(.col).justify(.between).items(.stretch).rendered
// "flex flex-col justify-between items-stretch"
```

The fluent surface is organized into one public capability protocol per CSS concern —
`ColorStyling`, `SpacingStyling`, `SizingStyling`, `PositioningStyling`, `DisplayStyling`,
`FlexGridStyling`, `TypographyStyling`, `BorderStyling`, `EffectsStyling`, `TransitionStyling`,
`ListStyling`, `VariantStyling` and `ArbitraryStyling` — all composed through the seam protocol
`TailwindStyle`.

### With Plot

The Plot bridge is `.tailwind(_:)`, which expands to Plot's `.class(style.rendered)`:

```swift
import Plot
import TailwindKit

Node.div(.tailwind(.flex.items(.center).gap(4)), .text("Hi"))
// <div class="flex items-center gap-4">Hi</div>

Image("logo.png").tailwind(.rounded(.lg))
// <img src="logo.png" class="rounded-lg"/>
```

Only `Node+Tailwind.swift` imports Plot, so `TailwindStyleBuilder` stays usable without an HTML
library — and the test suite asserts on `.rendered` strings alone.

### Responsive and state variants

A variant takes a nested style and prefixes every token it produced. Prefixes stack by nesting.

```swift
TW.block.lg(.hidden).rendered              // "block lg:hidden"
TW.md(.hover(.bg(.blue, .s700))).rendered  // "md:hover:bg-blue-700"
```

### Custom token values

The token families Tailwind v4 backs with an extensible `@theme` namespace — `Color`, `Spacing`,
`Size`, `MaxWidth`, `TextSize`, `FontWeight`, `Radius`, `Shadow`, `DropShadow`, `Tracking` and
`Ease` — are protocols. Conform your own type to register a value the built-ins don't cover:

```swift
struct BrandColor: Color { let token = "brand" }

TW.bg(BrandColor(), .s500).rendered   // "bg-brand-500"
```

The families that map to fixed CSS keywords (`Shade`, `Position`, `Flex`, `FlexDirection`,
`ListStyle`, `Align`, `Justify`, `TextAlign`, `VerticalAlign`, `ObjectFit`, `BorderSide`) stay
closed enums, because a custom value there would be meaningless.

### Arbitrary values

For the occasional [arbitrary value](https://tailwindcss.com/docs/adding-custom-styles) Tailwind v4
supports, the utility prefix is supplied by you — only the value is arbitrary:

```swift
TW.arbitrary("top", value: "117px").rendered         // "top-[117px]"
TW.arbitrary("bg", variable: "--brand").rendered     // "bg-(--brand)"
TW.arbitrary("grid-cols", value: "1fr 500px").rendered
// "grid-cols-[1fr_500px]"  (spaces become underscores)
TW.custom(property: "mask-type", value: "luminance").rendered
// "[mask-type:luminance]"
```

Each extensible token family also carries an `.arbitrary(_:)` static, e.g.
`TW.maxW(.arbitrary("48rem"))` → `max-w-[48rem]`.

## Testing

```bash
swift test
```

`Tests/TailwindKitTests` uses swift-testing (`@Suite`/`@Test`/`#expect`). The tests are offline and
Plot-independent: they assert `.rendered` string equality only, e.g.
`TW.flex.gap(4).rendered == "flex gap-4"`.

## Requirements

- Swift 6.4+
- macOS 13+, or Ubuntu 24.04 (Noble)

## License

[MIT](LICENSE) © BrightDigit
