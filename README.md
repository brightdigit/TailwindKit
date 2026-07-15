# TailwindKit

A tiny, type-safe Swift builder for [Tailwind CSS v4](https://tailwindcss.com)
utility class strings, used by brightdigit.com to author component markup with
compile-time-checked CSS classes instead of stringly-typed `class="…"`.

TailwindKit is **Tailwind v4 only**. The v2 → v4 site migration and the
component migration that consumes this package are tracked separately (issues
#145 and #67).

## Usage

The core is `TailwindStyle` — an immutable value builder where every member
returns a new `TailwindStyle`. Bare utilities are computed properties;
parameterized utilities are methods. Render the accumulated tokens with
`.rendered`:

```swift
import TailwindKit

TW.flex.items(.center).gap(4).bg(.blue, .s500).rendered
// "flex items-center gap-4 bg-blue-500"
```

`TW` is a convenience alias for `TailwindStyle`, so a chain can start with the
type name or a leading dot.

### With Plot

The single Plot bridge is `.tailwind(_:)`, which expands to Plot's
`.class(style.rendered)` on any `Node`/`Attribute` in an HTML context:

```swift
import Plot
import TailwindKit

Node.div(.tailwind(.flex.items(.center).gap(4)), .text("Hi"))
// <div class="flex items-center gap-4">Hi</div>
```

The builder itself never imports Plot — only `Node+Tailwind.swift` does — so
`TailwindStyle` stays usable without an HTML library, and its tests assert on
`.rendered` strings alone.

### Responsive & state variants

Variants take a nested style and prefix every one of its tokens; prefixes stack:

```swift
TW.block.lg(.hidden).rendered              // "block lg:hidden"
TW.md(.hover(.bg(.blue, .s700))).rendered  // "md:hover:bg-blue-700"
```

## Scope

The modeled utility surface is intentionally **closed** — a set of Swift enums
and methods — and grows component-driven as consumers (issue #67) need new
classes. For any class not yet modeled, the escape hatch is Plot's existing
`.class("…")`; TailwindKit itself never accepts raw strings.

## Testing

```bash
swift test
```

Tests (`Tests/TailwindKitTests`) are Plot-independent and assert `.rendered`
string equality, e.g. `TW.flex.gap(4).rendered == "flex gap-4"`. They use
swift-testing (`@Suite`/`@Test`/`#expect`).
