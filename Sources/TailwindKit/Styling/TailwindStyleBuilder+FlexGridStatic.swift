//
//  TailwindStyleBuilder+FlexGridStatic.swift
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

extension TailwindStyleBuilder {
  /// `flex-wrap`.
  public static var flexWrap: TailwindStyleBuilder { TailwindStyleBuilder().flexWrap }
  /// `grow`.
  public static var grow: TailwindStyleBuilder { TailwindStyleBuilder().grow }
  /// `shrink`.
  public static var shrink: TailwindStyleBuilder { TailwindStyleBuilder().shrink }
  /// `grow-0`.
  public static var grow0: TailwindStyleBuilder { TailwindStyleBuilder().grow0 }
  /// `shrink-0`.
  public static var shrink0: TailwindStyleBuilder { TailwindStyleBuilder().shrink0 }
  /// `gap` (bare).
  public static var gap: TailwindStyleBuilder { TailwindStyleBuilder().gap }
}

extension TailwindStyleBuilder {
  /// `items-<align>`.
  public static func items(_ align: Align) -> TailwindStyleBuilder {
    TailwindStyleBuilder().items(align)
  }
  /// `justify-<value>`.
  public static func justify(_ value: Justify) -> TailwindStyleBuilder {
    TailwindStyleBuilder().justify(value)
  }
  /// `grid-cols-<n>`.
  public static func gridCols(_ count: Int) -> TailwindStyleBuilder {
    TailwindStyleBuilder().gridCols(count)
  }
  /// `gap-<n>`.
  public static func gap(_ amount: DefaultSpacing) -> TailwindStyleBuilder {
    TailwindStyleBuilder().gap(amount)
  }
  /// `gap-x-<n>`.
  public static func gapX(_ amount: DefaultSpacing) -> TailwindStyleBuilder {
    TailwindStyleBuilder().gapX(amount)
  }
  /// `gap-y-<n>`.
  public static func gapY(_ amount: DefaultSpacing) -> TailwindStyleBuilder {
    TailwindStyleBuilder().gapY(amount)
  }
  /// `flex-<value>`.
  public static func flex(_ value: Flex) -> TailwindStyleBuilder {
    TailwindStyleBuilder().flex(value)
  }
  /// `flex-<direction>`.
  public static func flexDirection(_ value: FlexDirection) -> TailwindStyleBuilder {
    TailwindStyleBuilder().flexDirection(value)
  }
  /// `self-<align>`.
  public static func selfAlign(_ align: Align) -> TailwindStyleBuilder {
    TailwindStyleBuilder().selfAlign(align)
  }
  /// `justify-items-<value>`.
  public static func justifyItems(_ align: Align) -> TailwindStyleBuilder {
    TailwindStyleBuilder().justifyItems(align)
  }
  /// `justify-self-<value>`.
  public static func justifySelf(_ align: Align) -> TailwindStyleBuilder {
    TailwindStyleBuilder().justifySelf(align)
  }
  /// `content-<value>`.
  public static func content(_ value: Justify) -> TailwindStyleBuilder {
    TailwindStyleBuilder().content(value)
  }
  /// `place-items-<align>`.
  public static func placeItems(_ align: Align) -> TailwindStyleBuilder {
    TailwindStyleBuilder().placeItems(align)
  }
  /// `place-self-<align>`.
  public static func placeSelf(_ align: Align) -> TailwindStyleBuilder {
    TailwindStyleBuilder().placeSelf(align)
  }
  /// `space-x-<n>`.
  public static func spaceX(_ amount: DefaultSpacing) -> TailwindStyleBuilder {
    TailwindStyleBuilder().spaceX(amount)
  }
  /// `space-y-<n>`.
  public static func spaceY(_ amount: DefaultSpacing) -> TailwindStyleBuilder {
    TailwindStyleBuilder().spaceY(amount)
  }
}
