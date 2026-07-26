# Release Notes

## Unreleased

Wave 1 merge (brightdigit/TailwindKit #1, head `brightdigit-com-260717`) — subrepo
tracking branch synced into the default branch via `git subrepo push`. This replaces the
2022-era prototype (`Flexbox.swift`, `Layout/`, `Shared/Breakpoints.swift`) with a
Tailwind **v4-only** builder.

### Library

- New immutable value builder `TailwindStyleBuilder` (aliased `TW`) that accumulates
  Tailwind v4 utility tokens and renders them with `.rendered`. Bare utilities are
  computed properties, parameterized utilities are methods, and static mirrors let a
  chain start with a leading dot.
- The fluent surface is split into ~13 public capability protocols, one per CSS concern
  (`ColorStyling`, `SpacingStyling`, `FlexGridStyling`, `TypographyStyling`,
  `BorderStyling`, `EffectsStyling`, `PositioningStyling`, `SizingStyling`,
  `DisplayStyling`, `ListStyling`, `TransitionStyling`, `VariantStyling`,
  `ArbitraryStyling`), each witnessed through the public seam protocol `TailwindStyle`.
  The seam takes `some TailwindClass` / `some Variant` rather than `String`, so there is
  no raw-string entry point into the public API.
- Value tokens are split by whether Tailwind v4 makes them customizable. Families backed
  by an extensible `@theme` namespace (`Color`, `Spacing`, `Size`, `MaxWidth`,
  `TextSize`, `FontWeight`, `Radius`, `Shadow`, `DropShadow`, `Tracking`, `Ease`) are
  modeled as a protocol plus a `Default…` type with an internal init, so downstream
  modules can register custom values by conforming their own type. Fixed CSS-keyword
  families (`Shade`, `Position`, `Flex`, `FlexDirection`, `ListStyle`, `Align`,
  `Justify`, `TextAlign`, `VerticalAlign`, `ObjectFit`, `BorderSide`) stay closed enums.
- Responsive and state variants nest and stack: `TW.md(.hover(.bg(.blue, .s700)))`
  renders `md:hover:bg-blue-700`.
- Arbitrary-value support for Tailwind v4 square-bracket and CSS-variable notation, via
  per-family `.arbitrary(_:)` statics plus `arbitrary(_:value:)`,
  `arbitrary(_:variable:)` and `custom(property:value:)`.
- **The package has no dependencies at all** — not even Foundation. HTML-library support is
  opt-in through the `TailwindClassAttribute` seam: conform an element type to its single
  `tailwindClass(_:)` requirement and the `.tailwind(_:)` sugar comes with it, with
  leading-dot inference intact. Consumers own the conformance, so TailwindKit no longer
  depends on Plot.
- Added `LICENSE` (MIT © BrightDigit); the package previously shipped with none.
- Added a `TailwindKit.docc` catalog and `.spi.yml` so Swift Package Index builds
  documentation for the `TailwindKit` target.

### Tests

- Replaced `AspectRatioTests`, `BreakpointTests` and `FlexboxTests` with four
  swift-testing suites — `TailwindStyleTests`, `TailwindStyleCoverageTests`,
  `TailwindStyleExtensibilityTests` and `TailwindStyleSetsAndCustomTests` — that assert
  `.rendered` string equality only and never import an HTML library. `TailwindClassAttributeTests`
  covers the integration seam by conforming a local stub.

### CI

- Replaced the `macos-12` `Test Package` and Danger `Pull Request Check` workflows, which
  could no longer be scheduled on any runner, with the standard BrightDigit package
  workflow `TailwindKit.yml` (Ubuntu, macOS, Apple platforms, Windows and Android on
  Swift 6.4) plus the shared `check-unsafe-flags`, `claude`, `claude-code-review`,
  `cleanup-caches` and `swift-source-compat` workflows.
- `fail-fast: true` on every matrix leg; the Ubuntu coverage step uses
  `sersoft-gmbh/swift-coverage-action@v5`; `build-macos-platforms` drops the
  `ENABLE_WATCHOS` gate and adds a visionOS leg.
- Added `.devcontainer` on `swiftlang/swift:nightly-6.4.x-noble`, `.mise.toml`-pinned lint
  tooling, `Scripts/lint.sh` + `Scripts/header.sh`, `.swift-format`, `.swiftlint.yml`,
  `.periphery.yml`, `codecov.yml` and `.github/dependabot.yml`.
- Removed the abandoned `CHANGELOG.md`, `CONTRIBUTING/` directory and `Dangerfile.swift`.
