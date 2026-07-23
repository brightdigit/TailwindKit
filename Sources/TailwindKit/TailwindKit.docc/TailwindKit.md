# ``TailwindKit``

Build Tailwind CSS v4 utility class strings in Swift, with the compiler checking them.

## Overview

TailwindKit replaces stringly-typed `class="flex items-center gap-4"` markup with a fluent,
immutable value builder. Every fluent member returns a new ``TailwindStyleBuilder``; calling
`rendered` produces the class string:

```swift
import TailwindKit

TW.flex.items(.center).gap(4).bg(.blue, .s500).rendered
// "flex items-center gap-4 bg-blue-500"
```

``TW`` is a type alias for ``TailwindStyleBuilder``, so a chain can start with the type name
or with a leading dot.

The library is **Tailwind v4 only**, and its modeled utility surface is deliberately closed:
utilities are added as consumers need them rather than mirroring every class Tailwind can
emit. There is no raw-string entry point into the public API.

### Capability protocols

The fluent surface is split into one public protocol per CSS concern —
``ColorStyling``, ``SpacingStyling``, ``SizingStyling``, ``PositioningStyling``,
``DisplayStyling``, ``FlexGridStyling``, ``TypographyStyling``, ``BorderStyling``,
``EffectsStyling``, ``TransitionStyling``, ``ListStyling``, ``VariantStyling`` and
``ArbitraryStyling``. Each provides its members in an extension constrained on the seam
protocol ``TailwindStyle``, which exposes only two composition primitives:
`appending(_:)` for a whole class fragment and `prefixing(_:_:)` for a variant. Because the
seam takes ``TailwindClass`` and ``Variant`` values rather than `String`, the seam can be
public without opening a raw-string hole.

### Tokens

Value tokens are split by whether Tailwind v4 lets you customize them.

Families backed by an extensible `@theme` namespace are modeled as a protocol plus a
`Default…` type whose initializer is internal — ``Color``, ``Spacing``, ``Size``,
``MaxWidth``, ``TextSize``, ``FontWeight``, ``Radius``, ``Shadow``, ``DropShadow``,
``Tracking`` and ``Ease``. Downstream code registers a custom value by conforming its own
type:

```swift
struct BrandColor: Color { let token = "brand" }
TW.bg(BrandColor(), .s500).rendered   // "bg-brand-500"
```

Families that map to fixed CSS keywords stay closed enums, because a custom value would be
meaningless: ``Shade``, ``Position``, ``Flex``, ``FlexDirection``, ``ListStyle``, ``Align``,
``Justify``, ``TextAlign``, ``VerticalAlign``, ``ObjectFit`` and ``BorderSide``.

### Variants

Variants take a nested style and prefix every token it produced; prefixes stack by nesting.

```swift
TW.block.lg(.hidden).rendered              // "block lg:hidden"
TW.md(.hover(.bg(.blue, .s700))).rendered  // "md:hover:bg-blue-700"
```

### Arbitrary values

Each extensible family carries an `arbitrary(_:)` static, and ``ArbitraryStyling`` covers
utilities TailwindKit does not model, using Tailwind v4's square-bracket and CSS-variable
notation. The utility prefix is always supplied by the caller; only the value is arbitrary.

```swift
TW.arbitrary("top", value: "117px").rendered        // "top-[117px]"
TW.arbitrary("bg", variable: "--brand").rendered    // "bg-(--brand)"
TW.custom(property: "mask-type", value: "luminance").rendered
// "[mask-type:luminance]"
```

### Plot integration

Plot support lives in exactly one file, so the builder itself never imports an HTML library.
It adds a single piece of sugar that expands to Plot's `.class(_:)`:

```swift
import Plot
import TailwindKit

Node.div(.tailwind(.flex.items(.center).gap(4)), .text("Hi"))
// <div class="flex items-center gap-4">Hi</div>
```

## Topics

### Building a style

- ``TailwindStyleBuilder``
- ``TW``
- ``TailwindStyle``

### Capabilities

- ``ColorStyling``
- ``SpacingStyling``
- ``SizingStyling``
- ``PositioningStyling``
- ``DisplayStyling``
- ``FlexGridStyling``
- ``TypographyStyling``
- ``BorderStyling``
- ``EffectsStyling``
- ``TransitionStyling``
- ``ListStyling``
- ``VariantStyling``
- ``ArbitraryStyling``

### Extensible tokens

- ``TailwindToken``
- ``Color``
- ``Spacing``
- ``Size``
- ``MaxWidth``
- ``TextSize``
- ``FontWeight``
- ``Radius``
- ``Shadow``
- ``DropShadow``
- ``Tracking``
- ``Ease``

### Built-in token values

- ``DefaultColor``
- ``DefaultSpacing``
- ``DefaultSize``
- ``DefaultMaxWidth``
- ``DefaultTextSize``
- ``DefaultFontWeight``
- ``DefaultRadius``
- ``DefaultShadow``
- ``DefaultDropShadow``
- ``DefaultTracking``
- ``DefaultEase``

### Fixed keyword tokens

- ``Shade``
- ``Position``
- ``Flex``
- ``FlexDirection``
- ``ListStyle``
- ``Align``
- ``Justify``
- ``TextAlign``
- ``VerticalAlign``
- ``ObjectFit``
- ``BorderSide``

### Variants and class fragments

- ``Variant``
- ``DefaultVariant``
- ``TailwindClass``
- ``DefaultTailwindClass``
