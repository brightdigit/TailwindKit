//
//  PositioningStyling.swift
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

/// The **positioning** utilities.
///
/// A capability protocol whose members are witnessed against the
/// ``TailwindStyle`` seam; ``TailwindStyleBuilder`` conforms to it. See
/// ``TailwindStyle`` for why the surface is organized this way.
public protocol PositioningStyling {
  /// `static` / `relative` / `absolute` / `fixed` / `sticky`, e.g. `.position(.absolute)`.
  func position(_ value: Position) -> Self
  /// `top-<amount>`, e.g. `.top(.s4)`.
  func top(_ amount: DefaultSpacing) -> Self
  /// `right-<amount>`, e.g. `.right(.s4)`.
  func right(_ amount: DefaultSpacing) -> Self
  /// `bottom-<amount>`, e.g. `.bottom(.s4)`.
  func bottom(_ amount: DefaultSpacing) -> Self
  /// `left-<amount>`, e.g. `.left(.s4)`.
  func left(_ amount: DefaultSpacing) -> Self
  /// `inset-<amount>`, e.g. `.inset(.s4)`.
  func inset(_ amount: DefaultSpacing) -> Self
  /// `z-<index>`, e.g. `.z(10)`.
  func z(_ index: Int) -> Self
}

extension PositioningStyling where Self: TailwindStyle {
  /// `static` / `relative` / `absolute` / `fixed` / `sticky`, e.g. `.position(.absolute)`.
  public func position(_ value: Position) -> Self {
    appending(DefaultTailwindClass(value.token))
  }
  /// `top-<amount>`, e.g. `.top(.s4)`.
  public func top(_ amount: DefaultSpacing) -> Self {
    appending(DefaultTailwindClass("top-\(amount.token)"))
  }
  /// `right-<amount>`, e.g. `.right(.s4)`.
  public func right(_ amount: DefaultSpacing) -> Self {
    appending(DefaultTailwindClass("right-\(amount.token)"))
  }
  /// `bottom-<amount>`, e.g. `.bottom(.s4)`.
  public func bottom(_ amount: DefaultSpacing) -> Self {
    appending(DefaultTailwindClass("bottom-\(amount.token)"))
  }
  /// `left-<amount>`, e.g. `.left(.s4)`.
  public func left(_ amount: DefaultSpacing) -> Self {
    appending(DefaultTailwindClass("left-\(amount.token)"))
  }
  /// `inset-<amount>`, e.g. `.inset(.s4)`.
  public func inset(_ amount: DefaultSpacing) -> Self {
    appending(DefaultTailwindClass("inset-\(amount.token)"))
  }
  /// `z-<index>`, e.g. `.z(10)`.
  public func z(_ index: Int) -> Self {
    appending(DefaultTailwindClass("z-\(index)"))
  }
}

extension TailwindStyleBuilder: PositioningStyling {}

// Static mirrors so a positioning utility can start a chain with a leading dot.
extension TailwindStyleBuilder {
  /// `static` / `relative` / `absolute` / `fixed` / `sticky`.
  public static func position(_ value: Position) -> TailwindStyleBuilder {
    TailwindStyleBuilder().position(value)
  }
  /// `top-<amount>`.
  public static func top(_ amount: DefaultSpacing) -> TailwindStyleBuilder {
    TailwindStyleBuilder().top(amount)
  }
  /// `right-<amount>`.
  public static func right(_ amount: DefaultSpacing) -> TailwindStyleBuilder {
    TailwindStyleBuilder().right(amount)
  }
  /// `bottom-<amount>`.
  public static func bottom(_ amount: DefaultSpacing) -> TailwindStyleBuilder {
    TailwindStyleBuilder().bottom(amount)
  }
  /// `left-<amount>`.
  public static func left(_ amount: DefaultSpacing) -> TailwindStyleBuilder {
    TailwindStyleBuilder().left(amount)
  }
  /// `inset-<amount>`.
  public static func inset(_ amount: DefaultSpacing) -> TailwindStyleBuilder {
    TailwindStyleBuilder().inset(amount)
  }
  /// `z-<index>`.
  public static func z(_ index: Int) -> TailwindStyleBuilder {
    TailwindStyleBuilder().z(index)
  }
}
