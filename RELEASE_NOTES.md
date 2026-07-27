# Release Notes

## 1.0.0-alpha.1

### Library
* Drop the Plot dependency so TailwindKit has zero dependencies — not even Foundation by @leogdion in https://github.com/brightdigit/TailwindKit/pull/1
* Add the `TailwindClassAttribute` seam: one static protocol requirement named `` `class`(_:) `` plus a protocol extension, so the consumer supplies the HTML binding rather than TailwindKit importing Plot by @leogdion in https://github.com/brightdigit/TailwindKit/pull/1
* Add a `String.escapingSpaces` helper in `Core/String+ArbitraryValue.swift` for the arbitrary-value files that had relied on Foundation leaking in through Plot by @leogdion in https://github.com/brightdigit/TailwindKit/pull/1
* Reshape the token enums into SwiftUI-style protocols, splitting them into closed tokens (`Align`, `Flex`, `FlexDirection`, `Justify`, `ListStyle`, `ObjectFit`, `Position`, `Shade`, `TextAlign`, `VerticalAlign`, `BorderSide`) and extensible tokens with `Default…` implementations (`Color`, `Spacing`, `Size`, `MaxWidth`, `Radius`, `Shadow`, `DropShadow`, `TextSize`, `FontWeight`, `Tracking`, `Ease`) by @leogdion in https://github.com/brightdigit/TailwindKit/pull/1
* Add a fluent surface of `…Styling` protocols over a public typed seam — `ArbitraryStyling`, `BorderStyling`, `ColorStyling`, `DisplayStyling`, `EffectsStyling`, `FlexGridStyling`, `ListStyling`, `PositioningStyling`, `SizingStyling`, `SpacingStyling`, `TransitionStyling`, `TypographyStyling`, and `VariantStyling` by @leogdion in https://github.com/brightdigit/TailwindKit/pull/1
* Introduce the `Core` layer backing the seam: `TailwindClass`, `DefaultTailwindClass`, `Variant`, `DefaultVariant`, `TailwindToken`, `TailwindStyle`, `TailwindStyleBuilder`, and the `TW` entry point by @leogdion in https://github.com/brightdigit/TailwindKit/pull/1
* Replace the previous ad-hoc `Flexbox`, `Layout/AspectRatio`, `Layout/Display`, and `Shared/Breakpoints` sources with the new token and styling structure by @leogdion in https://github.com/brightdigit/TailwindKit/pull/1

### Documentation
* Add a `TailwindKit.docc` catalog with logo resources and expand the README to cover the new token protocols and styling surface by @leogdion in https://github.com/brightdigit/TailwindKit/pull/1
* Add a `LICENSE` file and retire the old `CHANGELOG.md` and `CONTRIBUTING/` guidelines in favor of `RELEASE_NOTES.md` by @leogdion in https://github.com/brightdigit/TailwindKit/pull/1

### Tooling & CI
* Move linting and formatting to mise, adding `.mise.toml`, `.swift-format`, `.swiftlint.yml`, `.periphery.yml`, `Scripts/lint.sh`, and `Scripts/header.sh` by @leogdion in https://github.com/brightdigit/TailwindKit/pull/1
* Replace the Danger-based PR check and the old `TailwindKitTest` workflow with the shared multi-platform CI template (macOS/Linux/Windows/Android), plus `check-unsafe-flags`, `swift-source-compat`, `cleanup-caches`, and Claude review workflows by @leogdion in https://github.com/brightdigit/TailwindKit/pull/1
* Add a devcontainer, Dependabot config, a `.swift-version` pin for the Swift 6.4 toolchain, and `AGENTS.md` agent instructions by @leogdion in https://github.com/brightdigit/TailwindKit/pull/1
