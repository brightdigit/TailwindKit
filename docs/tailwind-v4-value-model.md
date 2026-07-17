# Tailwind v4 value model — which token families are extensible

Research notes for TailwindKit's token-type design (#157). Question: which value
families are backed by an **`@theme` namespace variable** a developer can extend/override
(→ model as an extensible Swift token type), and which are **fixed CSS keyword sets**
(→ a closed enum is the honest model). All claims cited to the official **v4** docs.

## Classification table

| Family | Theme namespace variable (or "fixed keywords") | Extensible via `@theme`? | Reused across which utilities | Notes |
|---|---|---|---|---|
| Color | `--color-*` (e.g. `--color-blue-500`) | **Yes** | text/bg/border/ring/fill/stroke/divide/accent/caret/gradient stops | A custom color adds new utilities across all color families |
| Shade (the `500`) | part of the `--color-*` variable **name**, not its own scale | **No** | n/a | `blue-500` is ONE var `--color-blue-500`; 11 fixed steps 50–950; a "custom shade" 550/1000 is just another whole color var |
| Spacing | `--spacing` (single 0.25rem multiplier) | **Yes** (one value) | padding, margin, gap, inset, width, height, min/max-w/h, size, space, scroll-*, translate, text-indent | `calc(var(--spacing) * N)` reused everywhere |
| Size (w/h) | mixed: `--spacing` + keywords + fractions | Spacing part: yes | shares `--spacing` | Fractions (1/2…5/6) are a fixed enumerated set, not arbitrary; keywords full/screen/auto/min/max/fit fixed |
| MaxWidth | `--container-*` (+ `--spacing` for numeric) | **Yes** (`--container-*`) | SAME `--container-*` scale powers `@sm:`/`@md:` container-query variants | Also keywords full/none/min/max/fit/screen |
| TextSize | `--text-*` | **Yes** | font-size (+ paired `--text-*--line-height` / `--letter-spacing` / `--font-weight`) | `text-(length:--v)` |
| FontWeight | `--font-weight-*` | **Yes** | font-weight | Named steps 100–900 but an extensible scale |
| Radius | `--radius-*` | **Yes** | border-radius | v4 rename: new `rounded-xs`; `rounded-sm` = old `rounded`; bare `rounded` dropped |
| Shadow | `--shadow-*` (+ `--inset-shadow-*`) | **Yes** | box-shadow / inset | Scale 2xs…2xl + none |
| DropShadow | `--drop-shadow-*` | **Yes** | drop-shadow filter | Separate scale from `--shadow-*` |
| Tracking | `--tracking-*` | **Yes** | letter-spacing | Named scale tighter…widest |
| Ease | `--ease-*` | **Yes** | transition-timing-function | Extensible, BUT `ease-linear`/`ease-initial` are hardcoded keywords |
| Align (items/self) | fixed keywords | No | n/a | start/end/center/baseline/stretch (+ safe); no arbitrary form |
| Justify | fixed keywords | No | n/a | start/end/center/between/around/evenly/stretch/normal/baseline |
| TextAlign | fixed keywords | No | n/a | left/center/right/justify/start/end; no arbitrary |
| VerticalAlign | fixed keywords | No | n/a | baseline/top/middle/…, BUT `align-[4px]` / `align-(--v)` supported (CSS prop takes lengths) |
| Position | fixed keywords | No | n/a | static/fixed/absolute/relative/sticky; no arbitrary |
| Flex | keywords + numeric/fraction | No (no namespace) | n/a | auto/initial/none + flex-1/fraction; `flex-[3_1_auto]` / `flex-(--v)` supported |
| FlexDirection | fixed keywords | No | n/a | row/row-reverse/col/col-reverse |
| ListStyle (type) | fixed keywords (no `--list-*` namespace) | No | n/a | disc/decimal/none; `list-[upper-roman]` / `list-(--v)` supported |
| ObjectFit | fixed keywords | No | n/a | contain/cover/fill/none/scale-down; no arbitrary |
| BorderSide | fixed enumeration of sides | No | n/a | border / t/r/b/l / x/y / s/e/bs/be; width value is separate (numeric + `border-(length:--v)`) |

## Conclusion

- **Genuine extensible value-scales → extensible Swift token type (protocol + `DefaultX`):**
  Color, Spacing, TextSize, FontWeight, Radius, Shadow, DropShadow, Tracking, Ease,
  MaxWidth (= the `--container-*` scale). Each is backed by a `--namespace-*` variable a
  developer can extend/override via `@theme`.
- **Fixed keyword sets → closed enum (custom values meaningless):** Position, ObjectFit,
  Align (align-items), Justify (justify-content), TextAlign, FlexDirection, BorderSide,
  ListStyle-type, and **Shade**. No theme namespace; a custom value is not a coherent concept.
- **Shade:** a custom shade is NOT coherent in v4. `blue-500` is a single variable
  `--color-blue-500`; there is no independent shade axis — just 11 canonical steps (50–950)
  that name palette colors. Adding 550/1000 means defining another whole `--color-*`
  variable, i.e. a new **Color**, not a new Shade. → Shade is a closed enum; extensibility
  lives at Color.
- **MaxWidth vs container:** MaxWidth's named sizes ARE the `--container-*` scale (the same
  scale powering `@container` query variants). It's an extensible scale, not its own axis.
- **Arbitrary values are NOT universal.** Per-utility `utility-[…]` / `utility-(--var)`
  exists on scale-backed utilities AND on keyword utilities whose CSS property accepts open
  values (vertical-align, list-style-type, flex), but NOT on pure-keyword utilities
  (position, object-fit, align-items, justify-content, flex-direction, text-align). The one
  truly universal escape is the arbitrary-**property** `[property:value]` syntax. → the Swift
  "arbitrary value via custom conformance" belongs on scale-backed families (and the handful
  of open-value keyword families), not on every token type.

## Sources (all tailwindcss.com/docs, v4)

- Theme & namespaces: /docs/theme (theme-variable-namespaces table)
- Colors: /docs/colors  ·  Adding custom styles (arbitrary `[…]` / `(--var)` / `[prop:val]`): /docs/adding-custom-styles
- /docs/background-color, /docs/font-size, /docs/font-weight, /docs/border-radius, /docs/box-shadow,
  /docs/letter-spacing, /docs/transition-timing-function, /docs/width, /docs/max-width, /docs/padding,
  /docs/gap, /docs/align-items, /docs/justify-content, /docs/text-align, /docs/vertical-align,
  /docs/position, /docs/flex, /docs/flex-direction, /docs/list-style-type, /docs/object-fit, /docs/border-width
