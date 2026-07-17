//
//  FlexGridStyling.swift
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

/// Flexbox & grid layout utilities — direction, wrapping, growth, gaps, and
/// item/content alignment.
///
/// A capability protocol witnessed against the ``TailwindStyle`` seam;
/// ``TailwindStyleBuilder`` conforms to it. See ``TailwindStyle`` for the
/// architecture rationale.
public protocol FlexGridStyling {
  /// `flex-wrap`.
  var flexWrap: Self { get }
  /// `grow`.
  var grow: Self { get }
  /// `shrink`.
  var shrink: Self { get }
  /// `grow-0`.
  var grow0: Self { get }
  /// `shrink-0`.
  var shrink0: Self { get }
  /// `gap` (bare).
  var gap: Self { get }

  /// `items-<align>` — cross-axis alignment, e.g. `.items(.center)`.
  func items(_ align: Align) -> Self
  /// `justify-<value>` — main-axis distribution, e.g. `.justify(.between)`.
  func justify(_ value: Justify) -> Self
  /// `grid-cols-<n>`, e.g. `.gridCols(3)`.
  func gridCols(_ count: Int) -> Self
  /// `gap-<n>`, e.g. `.gap(4)`.
  func gap(_ amount: DefaultSpacing) -> Self
  /// `gap-x-<n>`.
  func gapX(_ amount: DefaultSpacing) -> Self
  /// `gap-y-<n>`.
  func gapY(_ amount: DefaultSpacing) -> Self
  /// `flex-<value>` shorthand, e.g. `.flex(.one)` → `flex-1`.
  func flex(_ value: Flex) -> Self
  /// `flex-<direction>`, e.g. `.flexDirection(.col)` → `flex-col`.
  func flexDirection(_ value: FlexDirection) -> Self
  /// `self-<align>`, e.g. `.selfAlign(.start)` → `self-start`.
  func selfAlign(_ align: Align) -> Self
  /// `justify-items-<value>`, e.g. `.justifyItems(.end)`.
  func justifyItems(_ align: Align) -> Self
  /// `justify-self-<value>`, e.g. `.justifySelf(.center)`.
  func justifySelf(_ align: Align) -> Self
  /// `content-<value>`, e.g. `.content(.between)` → `content-between`.
  func content(_ value: Justify) -> Self
  /// `place-items-<align>`, e.g. `.placeItems(.stretch)`.
  func placeItems(_ align: Align) -> Self
  /// `place-self-<align>`, e.g. `.placeSelf(.center)`.
  func placeSelf(_ align: Align) -> Self
  /// `space-x-<n>`, e.g. `.spaceX(1)`.
  func spaceX(_ amount: DefaultSpacing) -> Self
  /// `space-y-<n>`.
  func spaceY(_ amount: DefaultSpacing) -> Self
}

extension FlexGridStyling where Self: TailwindStyle {
  // MARK: Bare

  /// `flex-wrap`.
  public var flexWrap: Self { appending(DefaultTailwindClass("flex-wrap")) }
  /// `grow`.
  public var grow: Self { appending(DefaultTailwindClass("grow")) }
  /// `shrink`.
  public var shrink: Self { appending(DefaultTailwindClass("shrink")) }
  /// `grow-0`.
  public var grow0: Self { appending(DefaultTailwindClass("grow-0")) }
  /// `shrink-0`.
  public var shrink0: Self { appending(DefaultTailwindClass("shrink-0")) }
  /// `gap` (bare).
  public var gap: Self { appending(DefaultTailwindClass("gap")) }

  // MARK: Flex & grid

  /// `items-<align>` — cross-axis alignment, e.g. `.items(.center)`.
  public func items(_ align: Align) -> Self {
    appending(DefaultTailwindClass("items-\(align.token)"))
  }
  /// `justify-<value>` — main-axis distribution, e.g. `.justify(.between)`.
  public func justify(_ value: Justify) -> Self {
    appending(DefaultTailwindClass("justify-\(value.token)"))
  }
  /// `grid-cols-<n>`, e.g. `.gridCols(3)`.
  public func gridCols(_ count: Int) -> Self {
    appending(DefaultTailwindClass("grid-cols-\(count)"))
  }
  /// `gap-<n>`, e.g. `.gap(4)`.
  public func gap(_ amount: DefaultSpacing) -> Self {
    appending(DefaultTailwindClass("gap-\(amount.token)"))
  }
  /// `gap-x-<n>`.
  public func gapX(_ amount: DefaultSpacing) -> Self {
    appending(DefaultTailwindClass("gap-x-\(amount.token)"))
  }
  /// `gap-y-<n>`.
  public func gapY(_ amount: DefaultSpacing) -> Self {
    appending(DefaultTailwindClass("gap-y-\(amount.token)"))
  }
  /// `flex-<value>` shorthand, e.g. `.flex(.one)` → `flex-1`.
  public func flex(_ value: Flex) -> Self {
    appending(DefaultTailwindClass("flex-\(value.token)"))
  }
  /// `flex-<direction>`, e.g. `.flexDirection(.col)` → `flex-col`.
  public func flexDirection(_ value: FlexDirection) -> Self {
    appending(DefaultTailwindClass("flex-\(value.token)"))
  }
  /// `self-<align>`, e.g. `.selfAlign(.start)` → `self-start`.
  public func selfAlign(_ align: Align) -> Self {
    appending(DefaultTailwindClass("self-\(align.token)"))
  }
  /// `justify-items-<value>`, e.g. `.justifyItems(.end)`.
  public func justifyItems(_ align: Align) -> Self {
    appending(DefaultTailwindClass("justify-items-\(align.token)"))
  }
  /// `justify-self-<value>`, e.g. `.justifySelf(.center)`.
  public func justifySelf(_ align: Align) -> Self {
    appending(DefaultTailwindClass("justify-self-\(align.token)"))
  }
  /// `content-<value>`, e.g. `.content(.between)` → `content-between`.
  public func content(_ value: Justify) -> Self {
    appending(DefaultTailwindClass("content-\(value.token)"))
  }
  /// `place-items-<align>`, e.g. `.placeItems(.stretch)`.
  public func placeItems(_ align: Align) -> Self {
    appending(DefaultTailwindClass("place-items-\(align.token)"))
  }
  /// `place-self-<align>`, e.g. `.placeSelf(.center)`.
  public func placeSelf(_ align: Align) -> Self {
    appending(DefaultTailwindClass("place-self-\(align.token)"))
  }
  /// `space-x-<n>`, e.g. `.spaceX(1)`.
  public func spaceX(_ amount: DefaultSpacing) -> Self {
    appending(DefaultTailwindClass("space-x-\(amount.token)"))
  }
  /// `space-y-<n>`.
  public func spaceY(_ amount: DefaultSpacing) -> Self {
    appending(DefaultTailwindClass("space-y-\(amount.token)"))
  }
}

extension TailwindStyleBuilder: FlexGridStyling {}
