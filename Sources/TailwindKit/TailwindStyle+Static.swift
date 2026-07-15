//
//  TailwindStyle+Static.swift
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

  /// `items-<align>`.
  public static func items(_ align: Align) -> TailwindStyle {
    TailwindStyle().items(align)
  }
  /// `justify-<value>`.
  public static func justify(_ value: Justify) -> TailwindStyle {
    TailwindStyle().justify(value)
  }
  /// `grid-cols-<n>`.
  public static func gridCols(_ count: Int) -> TailwindStyle {
    TailwindStyle().gridCols(count)
  }
  /// `gap-<n>`.
  public static func gap(_ amount: Spacing) -> TailwindStyle {
    TailwindStyle().gap(amount)
  }
  /// `gap-x-<n>`.
  public static func gapX(_ amount: Spacing) -> TailwindStyle {
    TailwindStyle().gapX(amount)
  }
  /// `gap-y-<n>`.
  public static func gapY(_ amount: Spacing) -> TailwindStyle {
    TailwindStyle().gapY(amount)
  }

  // MARK: Spacing

  /// `p-<n>`.
  public static func p(_ amount: Spacing) -> TailwindStyle { TailwindStyle().p(amount) }
  /// `px-<n>`.
  public static func px(_ amount: Spacing) -> TailwindStyle { TailwindStyle().px(amount) }
  /// `py-<n>`.
  public static func py(_ amount: Spacing) -> TailwindStyle { TailwindStyle().py(amount) }
  /// `pt-<n>`.
  public static func pt(_ amount: Spacing) -> TailwindStyle { TailwindStyle().pt(amount) }
  /// `pr-<n>`.
  public static func pr(_ amount: Spacing) -> TailwindStyle { TailwindStyle().pr(amount) }
  /// `pb-<n>`.
  public static func pb(_ amount: Spacing) -> TailwindStyle { TailwindStyle().pb(amount) }
  /// `pl-<n>`.
  public static func pl(_ amount: Spacing) -> TailwindStyle { TailwindStyle().pl(amount) }
  /// `m-<n>`.
  public static func m(_ amount: Spacing) -> TailwindStyle { TailwindStyle().m(amount) }
  /// `mx-<n>`.
  public static func mx(_ amount: Spacing) -> TailwindStyle { TailwindStyle().mx(amount) }
  /// `my-<n>`.
  public static func my(_ amount: Spacing) -> TailwindStyle { TailwindStyle().my(amount) }
  /// `mt-<n>`.
  public static func mt(_ amount: Spacing) -> TailwindStyle { TailwindStyle().mt(amount) }
  /// `mr-<n>`.
  public static func mr(_ amount: Spacing) -> TailwindStyle { TailwindStyle().mr(amount) }
  /// `mb-<n>`.
  public static func mb(_ amount: Spacing) -> TailwindStyle { TailwindStyle().mb(amount) }
  /// `ml-<n>`.
  public static func ml(_ amount: Spacing) -> TailwindStyle { TailwindStyle().ml(amount) }

  // MARK: Sizing

  /// `w-<size>`.
  public static func w(_ size: Size) -> TailwindStyle { TailwindStyle().w(size) }
  /// `h-<size>`.
  public static func h(_ size: Size) -> TailwindStyle { TailwindStyle().h(size) }

  // MARK: Colors

  /// `bg-<color>-<shade>`.
  public static func bg(_ color: Color, _ shade: Shade) -> TailwindStyle {
    TailwindStyle().bg(color, shade)
  }
  /// `border-<color>-<shade>`.
  public static func borderColor(_ color: Color, _ shade: Shade) -> TailwindStyle {
    TailwindStyle().borderColor(color, shade)
  }

  // MARK: Typography

  /// `text-<size>`.
  public static func text(_ size: TextSize) -> TailwindStyle {
    TailwindStyle().text(size)
  }
  /// `text-<color>-<shade>`.
  public static func text(_ color: Color, _ shade: Shade) -> TailwindStyle {
    TailwindStyle().text(color, shade)
  }
  /// `text-<align>`.
  public static func text(_ align: TextAlign) -> TailwindStyle {
    TailwindStyle().text(align)
  }
  /// `font-<weight>`.
  public static func font(_ weight: FontWeight) -> TailwindStyle {
    TailwindStyle().font(weight)
  }

  // MARK: Borders & radius

  /// `border-<n>`.
  public static func border(_ width: Int) -> TailwindStyle {
    TailwindStyle().border(width)
  }
  /// `rounded-<radius>`.
  public static func rounded(_ radius: Radius) -> TailwindStyle {
    TailwindStyle().rounded(radius)
  }

  // MARK: Responsive & state variants

  /// `sm:` variant.
  public static func sm(_ style: TailwindStyle) -> TailwindStyle {
    TailwindStyle().sm(style)
  }
  /// `md:` variant.
  public static func md(_ style: TailwindStyle) -> TailwindStyle {
    TailwindStyle().md(style)
  }
  /// `lg:` variant.
  public static func lg(_ style: TailwindStyle) -> TailwindStyle {
    TailwindStyle().lg(style)
  }
  /// `xl:` variant.
  public static func xl(_ style: TailwindStyle) -> TailwindStyle {
    TailwindStyle().xl(style)
  }
  /// `2xl:` variant.
  public static func xl2(_ style: TailwindStyle) -> TailwindStyle {
    TailwindStyle().xl2(style)
  }
  /// `hover:` variant.
  public static func hover(_ style: TailwindStyle) -> TailwindStyle {
    TailwindStyle().hover(style)
  }
  /// `focus:` variant.
  public static func focus(_ style: TailwindStyle) -> TailwindStyle {
    TailwindStyle().focus(style)
  }
  /// `active:` variant.
  public static func active(_ style: TailwindStyle) -> TailwindStyle {
    TailwindStyle().active(style)
  }
  /// `disabled:` variant.
  public static func disabled(_ style: TailwindStyle) -> TailwindStyle {
    TailwindStyle().disabled(style)
  }
  /// `group-hover:` variant.
  public static func groupHover(_ style: TailwindStyle) -> TailwindStyle {
    TailwindStyle().groupHover(style)
  }
  /// `dark:` variant.
  public static func dark(_ style: TailwindStyle) -> TailwindStyle {
    TailwindStyle().dark(style)
  }
}

/// Convenient alias for ``TailwindStyle`` so chains can read `TW.flex.gap(4)`.
///
/// The name is intentionally two characters — `TW` is the mandated public
/// spelling — so `type_name`'s minimum-length rule is disabled on this line.
public typealias TW = TailwindStyle  // swiftlint:disable:this type_name
