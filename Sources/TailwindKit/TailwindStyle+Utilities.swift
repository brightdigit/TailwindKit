//
//  TailwindStyle+Utilities.swift
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

extension TailwindStyle {
  // MARK: Flexbox & grid

  /// `items-<align>` — cross-axis alignment, e.g. `.items(.center)`.
  public func items(_ align: Align) -> TailwindStyle {
    appending("items-\(align.token)")
  }

  /// `justify-<value>` — main-axis distribution, e.g. `.justify(.between)`.
  public func justify(_ value: Justify) -> TailwindStyle {
    appending("justify-\(value.token)")
  }

  /// `grid-cols-<n>`, e.g. `.gridCols(3)`.
  public func gridCols(_ count: Int) -> TailwindStyle {
    appending("grid-cols-\(count)")
  }

  /// `gap-<n>`, e.g. `.gap(4)`.
  public func gap(_ amount: Spacing) -> TailwindStyle {
    appending("gap-\(amount.token)")
  }

  /// `gap-x-<n>`.
  public func gapX(_ amount: Spacing) -> TailwindStyle {
    appending("gap-x-\(amount.token)")
  }

  /// `gap-y-<n>`.
  public func gapY(_ amount: Spacing) -> TailwindStyle {
    appending("gap-y-\(amount.token)")
  }

  // MARK: Spacing (padding & margin)

  /// `p-<n>`.
  public func p(_ amount: Spacing) -> TailwindStyle { appending("p-\(amount.token)") }
  /// `px-<n>`.
  public func px(_ amount: Spacing) -> TailwindStyle { appending("px-\(amount.token)") }
  /// `py-<n>`.
  public func py(_ amount: Spacing) -> TailwindStyle { appending("py-\(amount.token)") }
  /// `pt-<n>`.
  public func pt(_ amount: Spacing) -> TailwindStyle { appending("pt-\(amount.token)") }
  /// `pr-<n>`.
  public func pr(_ amount: Spacing) -> TailwindStyle { appending("pr-\(amount.token)") }
  /// `pb-<n>`.
  public func pb(_ amount: Spacing) -> TailwindStyle { appending("pb-\(amount.token)") }
  /// `pl-<n>`.
  public func pl(_ amount: Spacing) -> TailwindStyle { appending("pl-\(amount.token)") }
  /// `m-<n>`.
  public func m(_ amount: Spacing) -> TailwindStyle { appending("m-\(amount.token)") }
  /// `mx-<n>`.
  public func mx(_ amount: Spacing) -> TailwindStyle { appending("mx-\(amount.token)") }
  /// `my-<n>`.
  public func my(_ amount: Spacing) -> TailwindStyle { appending("my-\(amount.token)") }
  /// `mt-<n>`.
  public func mt(_ amount: Spacing) -> TailwindStyle { appending("mt-\(amount.token)") }
  /// `mr-<n>`.
  public func mr(_ amount: Spacing) -> TailwindStyle { appending("mr-\(amount.token)") }
  /// `mb-<n>`.
  public func mb(_ amount: Spacing) -> TailwindStyle { appending("mb-\(amount.token)") }
  /// `ml-<n>`.
  public func ml(_ amount: Spacing) -> TailwindStyle { appending("ml-\(amount.token)") }

  // MARK: Sizing

  /// `w-<size>`, e.g. `.w(.full)` or `.w(4)`.
  public func w(_ size: Size) -> TailwindStyle { appending("w-\(size.token)") }
  /// `h-<size>`, e.g. `.h(.screen)` or `.h(4)`.
  public func h(_ size: Size) -> TailwindStyle { appending("h-\(size.token)") }

  // MARK: Colors

  /// `bg-<color>-<shade>`, e.g. `.bg(.blue, .s500)`.
  public func bg(_ color: Color, _ shade: Shade) -> TailwindStyle {
    appending("bg-\(color.token)-\(shade.token)")
  }

  /// `border-<color>-<shade>`, e.g. `.borderColor(.gray, .s200)`.
  public func borderColor(_ color: Color, _ shade: Shade) -> TailwindStyle {
    appending("border-\(color.token)-\(shade.token)")
  }

  // MARK: Typography

  /// `text-<size>`, e.g. `.text(.lg)`.
  public func text(_ size: TextSize) -> TailwindStyle {
    appending("text-\(size.token)")
  }

  /// `text-<color>-<shade>`, e.g. `.text(.blue, .s500)`.
  public func text(_ color: Color, _ shade: Shade) -> TailwindStyle {
    appending("text-\(color.token)-\(shade.token)")
  }

  /// `text-<align>`, e.g. `.text(.center)`.
  public func text(_ align: TextAlign) -> TailwindStyle {
    appending("text-\(align.token)")
  }

  /// `font-<weight>`, e.g. `.font(.medium)`.
  public func font(_ weight: FontWeight) -> TailwindStyle {
    appending("font-\(weight.token)")
  }

  // MARK: Borders & radius

  /// `border-<n>`, e.g. `.border(2)`.
  public func border(_ width: Int) -> TailwindStyle { appending("border-\(width)") }

  /// `rounded-<radius>`, e.g. `.rounded(.lg)`.
  public func rounded(_ radius: Radius) -> TailwindStyle {
    radius.token.isEmpty
      ? appending("rounded")
      : appending("rounded-\(radius.token)")
  }

  // MARK: Responsive & state variants
  //
  // Each takes a nested style and prefixes every one of its tokens. Prefixes
  // stack, so `.md(.hover(.bg(.blue, .s700)))` renders `md:hover:bg-blue-700`.

  /// `sm:` — ≥ 40rem breakpoint.
  public func sm(_ style: TailwindStyle) -> TailwindStyle { prefixing("sm", style) }
  /// `md:` — ≥ 48rem breakpoint.
  public func md(_ style: TailwindStyle) -> TailwindStyle { prefixing("md", style) }
  /// `lg:` — ≥ 64rem breakpoint.
  public func lg(_ style: TailwindStyle) -> TailwindStyle { prefixing("lg", style) }
  /// `xl:` — ≥ 80rem breakpoint.
  public func xl(_ style: TailwindStyle) -> TailwindStyle { prefixing("xl", style) }
  /// `2xl:` — ≥ 96rem breakpoint.
  public func xl2(_ style: TailwindStyle) -> TailwindStyle { prefixing("2xl", style) }

  /// `hover:` state variant.
  public func hover(_ style: TailwindStyle) -> TailwindStyle {
    prefixing("hover", style)
  }

  /// `focus:` state variant.
  public func focus(_ style: TailwindStyle) -> TailwindStyle {
    prefixing("focus", style)
  }

  /// `active:` state variant.
  public func active(_ style: TailwindStyle) -> TailwindStyle {
    prefixing("active", style)
  }

  /// `disabled:` state variant.
  public func disabled(_ style: TailwindStyle) -> TailwindStyle {
    prefixing("disabled", style)
  }

  /// `group-hover:` state variant.
  public func groupHover(_ style: TailwindStyle) -> TailwindStyle {
    prefixing("group-hover", style)
  }

  /// `dark:` color-scheme variant.
  public func dark(_ style: TailwindStyle) -> TailwindStyle { prefixing("dark", style) }
}
