//
//  VariantStyling.swift
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

/// The responsive/state **variant** prefixes.
///
/// A capability protocol whose members are witnessed against the
/// ``TailwindStyle`` seam; ``TailwindStyleBuilder`` conforms to it. See
/// ``TailwindStyle`` for why the surface is organized this way.
///
/// Each member wraps a nested ``TailwindStyleBuilder`` and stacks a built-in
/// ``Variant`` prefix onto it via ``TailwindStyle/prefixing(_:_:)``.
/// Because the argument is itself a `TailwindStyleBuilder`, prefixes **stack by
/// nesting** — `.md(.hover(.bg(.blue, .s700)))` renders `"md:hover:bg-blue-700"`.
///
/// Responsive breakpoints:
/// - `sm` — ≥ 40rem
/// - `md` — ≥ 48rem
/// - `lg` — ≥ 64rem
/// - `xl` — ≥ 80rem
/// - `xl2` (`2xl`) — ≥ 96rem
public protocol VariantStyling {
  /// `sm:…` — ≥ 40rem breakpoint.
  func sm(_ style: TailwindStyleBuilder) -> Self
  /// `md:…` — ≥ 48rem breakpoint.
  func md(_ style: TailwindStyleBuilder) -> Self
  /// `lg:…` — ≥ 64rem breakpoint.
  func lg(_ style: TailwindStyleBuilder) -> Self
  /// `xl:…` — ≥ 80rem breakpoint.
  func xl(_ style: TailwindStyleBuilder) -> Self
  /// `2xl:…` — ≥ 96rem breakpoint.
  func xl2(_ style: TailwindStyleBuilder) -> Self
  /// `hover:…` state variant.
  func hover(_ style: TailwindStyleBuilder) -> Self
  /// `focus:…` state variant.
  func focus(_ style: TailwindStyleBuilder) -> Self
  /// `active:…` state variant.
  func active(_ style: TailwindStyleBuilder) -> Self
  /// `disabled:…` state variant.
  func disabled(_ style: TailwindStyleBuilder) -> Self
  /// `group-hover:…` state variant.
  func groupHover(_ style: TailwindStyleBuilder) -> Self
  /// `dark:…` color-scheme variant.
  func dark(_ style: TailwindStyleBuilder) -> Self
}

extension VariantStyling where Self: TailwindStyle {
  /// `sm:…` — ≥ 40rem breakpoint.
  public func sm(_ style: TailwindStyleBuilder) -> Self { prefixing(.sm, style) }
  /// `md:…` — ≥ 48rem breakpoint.
  public func md(_ style: TailwindStyleBuilder) -> Self { prefixing(.md, style) }
  /// `lg:…` — ≥ 64rem breakpoint.
  public func lg(_ style: TailwindStyleBuilder) -> Self { prefixing(.lg, style) }
  /// `xl:…` — ≥ 80rem breakpoint.
  public func xl(_ style: TailwindStyleBuilder) -> Self { prefixing(.xl, style) }
  /// `2xl:…` — ≥ 96rem breakpoint.
  public func xl2(_ style: TailwindStyleBuilder) -> Self { prefixing(.xl2, style) }
  /// `hover:…` state variant.
  public func hover(_ style: TailwindStyleBuilder) -> Self { prefixing(.hover, style) }
  /// `focus:…` state variant.
  public func focus(_ style: TailwindStyleBuilder) -> Self { prefixing(.focus, style) }
  /// `active:…` state variant.
  public func active(_ style: TailwindStyleBuilder) -> Self { prefixing(.active, style) }
  /// `disabled:…` state variant.
  public func disabled(_ style: TailwindStyleBuilder) -> Self { prefixing(.disabled, style) }
  /// `group-hover:…` state variant.
  public func groupHover(_ style: TailwindStyleBuilder) -> Self { prefixing(.groupHover, style) }
  /// `dark:…` color-scheme variant.
  public func dark(_ style: TailwindStyleBuilder) -> Self { prefixing(.dark, style) }
}

extension TailwindStyleBuilder: VariantStyling {}

// Static mirrors so a variant can start a chain with a leading dot.
extension TailwindStyleBuilder {
  /// `sm:…` — ≥ 40rem breakpoint.
  public static func sm(_ style: TailwindStyleBuilder) -> TailwindStyleBuilder {
    TailwindStyleBuilder().sm(style)
  }
  /// `md:…` — ≥ 48rem breakpoint.
  public static func md(_ style: TailwindStyleBuilder) -> TailwindStyleBuilder {
    TailwindStyleBuilder().md(style)
  }
  /// `lg:…` — ≥ 64rem breakpoint.
  public static func lg(_ style: TailwindStyleBuilder) -> TailwindStyleBuilder {
    TailwindStyleBuilder().lg(style)
  }
  /// `xl:…` — ≥ 80rem breakpoint.
  public static func xl(_ style: TailwindStyleBuilder) -> TailwindStyleBuilder {
    TailwindStyleBuilder().xl(style)
  }
  /// `2xl:…` — ≥ 96rem breakpoint.
  public static func xl2(_ style: TailwindStyleBuilder) -> TailwindStyleBuilder {
    TailwindStyleBuilder().xl2(style)
  }
  /// `hover:…` state variant.
  public static func hover(_ style: TailwindStyleBuilder) -> TailwindStyleBuilder {
    TailwindStyleBuilder().hover(style)
  }
  /// `focus:…` state variant.
  public static func focus(_ style: TailwindStyleBuilder) -> TailwindStyleBuilder {
    TailwindStyleBuilder().focus(style)
  }
  /// `active:…` state variant.
  public static func active(_ style: TailwindStyleBuilder) -> TailwindStyleBuilder {
    TailwindStyleBuilder().active(style)
  }
  /// `disabled:…` state variant.
  public static func disabled(_ style: TailwindStyleBuilder) -> TailwindStyleBuilder {
    TailwindStyleBuilder().disabled(style)
  }
  /// `group-hover:…` state variant.
  public static func groupHover(_ style: TailwindStyleBuilder) -> TailwindStyleBuilder {
    TailwindStyleBuilder().groupHover(style)
  }
  /// `dark:…` color-scheme variant.
  public static func dark(_ style: TailwindStyleBuilder) -> TailwindStyleBuilder {
    TailwindStyleBuilder().dark(style)
  }
}
