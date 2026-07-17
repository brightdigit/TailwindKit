# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

TailwindKit is a small, dependency-light Swift module that emits **type-safe
[Tailwind CSS v4](https://tailwindcss.com) utility class strings** for
brightdigit.com's component markup. Swift 6.4 tools version, Swift 6 language
mode; targets macOS 13+ and Linux. Tailwind **v4 only**.

## Commands

```bash
swift test                              # run the (offline, Plot-independent) tests
swift build --build-tests               # compile

# Single test: filter by suite/method
swift test --filter TailwindStyleTests/canonicalChain

# Lint/format/check (installs pinned tools via mise, formats in place locally, builds tests, runs periphery)
./Scripts/lint.sh
LINT_MODE=STRICT ./Scripts/lint.sh      # CI-style strict mode (no auto-fix; lint + build only when CI is set)

mise install                            # install pinned tools (swift-format, swiftlint, periphery)
```

Tooling (swift-format, SwiftLint, periphery) is pinned in `.mise.toml` and run
through `mise exec --`. `Scripts/lint.sh` auto-formats and rewrites file headers
only when `CI` is unset; in CI it lints and builds without mutating files.

## Architecture — the one design decision

`TailwindStyleBuilder` is an immutable value builder that is **Plot-independent**.
The core builder and its utility surface live in Plot-free files
(`TailwindStyleBuilder.swift`, the token files, and the
`*Styling.swift` capability files). The **only** file that imports Plot is
`Node+Tailwind.swift`, which adds the single sugar `.tailwind(_ style:)` →
`.class(style.rendered)` on `Node`/`Attribute`. (The plain name `TailwindStyle`
is the **seam protocol**, see below; `TW` is the typealias for the builder.)

- Every fluent member returns a new `TailwindStyleBuilder`. Bare utilities are computed
  properties (`.flex`, `.gap`); parameterized ones are methods (`.gap(4)`,
  `.bg(.blue, .s500)`). Static mirrors let a chain start with a leading dot.

### The capability-protocol architecture (mirrors ButtondownKit)

The fluent surface is organized into ~13 **public capability protocols** — one
per CSS concern, noun + `Styling` suffix — each in its own file
(`ColorStyling.swift`, `SpacingStyling.swift`, `FlexGridStyling.swift`, …). This
mirrors `ButtondownKit`'s capability-protocol pattern (`EmailListing`, … witnessed
in extensions constrained on the `UnderlyingClientProtocol` seam).

- **The seam is `TailwindStyle`** (`TailwindStyle.swift`), a
  **public** protocol exposing the two composition primitives
  `appending(_ class: some TailwindClass)` and
  `prefixing(_ variant: some Variant, _:)`. Each capability provides its members
  in `extension XStyling where Self: TailwindStyle { public func … }`,
  composing through the seam; `TailwindStyleBuilder` conforms to the seam + every
  capability. The seam **must** be public — Swift forbids a `public` member in an
  extension constrained on a non-public protocol.
- **Why the seam takes typed values, not `String`.** A naive port of
  ButtondownKit's `underlying` seam would expose `appending(_:String)`, breaking
  the invariant that the public API never accepts raw strings. Instead the seam
  takes `some TailwindClass` (a full class fragment; built-ins via
  `DefaultTailwindClass`, **internal init**) and `some Variant`. So the seam is
  public yet there is **no raw-string entry point**. The actual string
  composition (`appendingToken`/`prefixingToken`) is **file-private** in
  `TailwindStyleBuilder.swift`.
- **`Variant`** (`Variant.swift`) is extensible exactly like `Color` — a
  `public protocol Variant: TailwindToken` with `DefaultVariant` (internal init)
  exposing `.sm`/`.md`/`.hover`/`.dark`/… A downstream module can register a
  custom `@custom-variant` by conforming its own type. Variants **chain by
  nesting**: `.md(.hover(.bg(.blue, .s700)))` → `md:hover:bg-blue-700`.
- **Deliberate divergence from ButtondownKit:** `TailwindStyleBuilder` retains method
  bodies (the seam witnesses) rather than being pure storage, because a value
  type has no injected `underlying` collaborator to hide — the "seam" is an
  implementation detail, not a dependency.
- To satisfy SwiftLint's `type_contents_order`, within each capability file the
  witnesses and static mirrors are split into **properties-before-methods**
  extensions as needed. Every public witness carries a doc comment
  (`missing_docs` is opt-in and CI runs `--strict`).
- **Value tokens split by whether Tailwind v4 makes them customizable** (see
  `docs/tailwind-v4-value-model.md` for the per-family rationale, cited to the v4
  docs). The families backed by an extensible `@theme` namespace are modeled as a
  **protocol + `Default…` type (SwiftUI-`Style` shape)**: `Color`, `Spacing`,
  `Size`, `MaxWidth` (`--container-*`), `TextSize`, `FontWeight`, `Radius`,
  `Shadow`, `DropShadow`, `Tracking`, `Ease`. The fixed CSS-keyword families stay
  **closed enums** (custom values are meaningless): `Shade`, `Position`, `Flex`,
  `FlexDirection`, `ListStyle`, `Align`, `Justify`, `TextAlign`, `VerticalAlign`,
  `ObjectFit`, `BorderSide`. The base protocol is in `TailwindToken.swift`.
- **Token types are top-level, bare-named, one per file.** Each is its own file:
  a protocol in `Color.swift`/`Radius.swift`/…, its `Default…` struct (carrying
  the `where Self ==` static members) in `DefaultColor.swift`/…, each closed enum
  in `Shade.swift`/`Position.swift`/… (one-declaration-per-file, so no lint
  suppressions). They were previously nested as `TailwindStyleBuilder.Color`; un-nesting
  removed ~375 `TailwindStyleBuilder.` qualifications across the module. **Tradeoff:**
  bare `Color`/`Size`/`Position`/… can collide with `SwiftUI.Color` etc. in a
  downstream file importing both — such a caller must write `TailwindKit.Color`.
  TailwindKit is server-side HTML with no SwiftUI consumers, so this is latent.
  (The **seam** types `TailwindClass`/`Variant` — and their `Default…` structs — are
  also top-level, bare-named, one per file, matching the token types.)
- **The extensible-token pattern (Approach C):** each family is a marker
  `public protocol Foo: TailwindToken {}`; built-ins live on a `public struct
  DefaultFoo: Foo` whose init is **internal** (so it is *not constructible by
  name* — like SwiftUI's `DefaultButtonStyle`). Each built-in value is a
  `public static let` **on `DefaultFoo`** (e.g. `DefaultColor.slate`), and the
  leading-dot surface is a thin computed forwarder in
  `extension Foo where Self == DefaultFoo { public static var slate: DefaultColor { .slate } }`
  (the `where Self ==` constraint is required for `.slate`-in-`some Foo` leading-dot
  syntax, and forces `DefaultFoo` to be a public type; the forwarder must stay a
  computed `var` because a stored `static let` cannot live in an extension — it
  resolves to the concrete `DefaultFoo.slate` constant, so there is no recursion). Fluent methods take `some Foo` so a downstream module can
  add a custom value by conforming its own type: `struct BrandColor: Color
  { let token = "brand" }` → `TW.bg(.brand, .s500)`. Literal families
  (`Spacing`/`Size`) instead take the concrete `DefaultSpacing`/`DefaultSize`
  so `.gap(4)`/`.p(2.5)` still work.
- Related bare utilities are still grouped into cohesive enum "sets" (e.g.
  `Position`, `Flex`, `FlexDirection`, `ListStyle`) rather than a flat wall of
  computed properties.
- For Tailwind v4 [arbitrary values](https://tailwindcss.com/docs/adding-custom-styles):
  each extensible token family carries a `.arbitrary(_:)` static (e.g.
  `.maxW(.arbitrary("48rem"))` → `max-w-[48rem]`, spaces→underscores), and a
  developer can also conform a token type whose `token` is the bracketed form.
  For a value on an **unmodeled** utility prefix, `TailwindStyle+Arbitrary.swift`
  provides `.arbitrary(_ prefix:value:)` (→ `prefix-[value]`),
  `.arbitrary(_ prefix:variable:)` (→ `prefix-(--var)`), and
  `.custom(property:value:)` (→ `[property:value]`). The removed
  `TailwindStyle+Custom.swift`/`Custom` type is gone. For any class not modeled at
  all, the escape hatch remains Plot's existing `.class("…")`.
- Shades are enum cases `.s50`…`.s950` (Swift disallows the `.500` spelling and
  leading underscores), e.g. `.bg(.blue, .s500)`. Shade is deliberately **not**
  extensible: in v4 `blue-500` is a single `--color-blue-500` variable, so a
  custom shade isn't a coherent concept — add a custom `Color` instead.

## Tests

Tests are offline and **Plot-independent**: they assert `.rendered` string
equality only (e.g. `TW.flex.gap(4).rendered == "flex gap-4"`), so nothing in
the test target imports Plot. Uses swift-testing (`@Suite`/`@Test`/`#expect`),
not XCTest.

## Conventions

- The MIT license header on every hand-written Swift file is managed by
  `Scripts/header.sh` (invoked from `lint.sh` locally). Don't hand-maintain
  headers.
- Strict concurrency is complete (Swift 6 mode). `@unchecked Sendable` is banned
  by a custom SwiftLint rule — fix Sendability properly.
