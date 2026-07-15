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

`TailwindStyle` is an immutable value builder that is **Plot-independent**. The
core builder and its utility surface live in Plot-free files
(`TailwindStyle.swift`, `TailwindStyle+Tokens.swift`,
`TailwindStyle+Utilities.swift`, `TailwindStyle+Static.swift`). The **only** file
that imports Plot is `Node+Tailwind.swift`, which adds the single sugar
`.tailwind(_ style:)` → `.class(style.rendered)` on `Node`/`Attribute`.

- Every fluent member returns a new `TailwindStyle`. Bare utilities are computed
  properties (`.flex`, `.gap`); parameterized ones are methods (`.gap(4)`,
  `.bg(.blue, .s500)`). Static mirrors in `TailwindStyle+Static.swift` let a
  chain start with a leading dot.
- To satisfy SwiftLint's `type_contents_order`, each of the utilities/static
  files is split into a **bare-utilities (properties)** extension and a
  **parameterized-utilities (methods)** extension.
- The modeled surface is a **closed** set of enums, grown component-driven for
  consumers (issue #67). The escape hatch for unmodeled classes is Plot's
  existing `.class("…")`; TailwindKit takes no raw strings.
- Shades are enum cases `.s50`…`.s950` (Swift disallows the `.500` spelling and
  leading underscores), e.g. `.bg(.blue, .s500)`.

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
