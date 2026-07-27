//
//  DisplayStyling.swift
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

/// The **display** utilities.
///
/// A capability protocol whose members are witnessed against the
/// ``TailwindStyle`` seam; ``TailwindStyleBuilder`` conforms to it. See
/// ``TailwindStyle`` for why the surface is organized this way.
public protocol DisplayStyling {
  /// `flex`.
  var flex: Self { get }
  /// `inline-flex`.
  var inlineFlex: Self { get }
  /// `grid`.
  var grid: Self { get }
  /// `block`.
  var block: Self { get }
  /// `inline-block`.
  var inlineBlock: Self { get }
  /// `inline`.
  var inline: Self { get }
  /// `hidden`.
  var hidden: Self { get }
  /// `container`.
  var container: Self { get }
  /// `contents`.
  var contents: Self { get }
}

extension DisplayStyling where Self: TailwindStyle {
  // MARK: Bare

  /// `flex`.
  public var flex: Self { appending(DefaultTailwindClass("flex")) }
  /// `inline-flex`.
  public var inlineFlex: Self {
    appending(DefaultTailwindClass("inline-flex"))
  }
  /// `grid`.
  public var grid: Self { appending(DefaultTailwindClass("grid")) }
  /// `block`.
  public var block: Self { appending(DefaultTailwindClass("block")) }
  /// `inline-block`.
  public var inlineBlock: Self {
    appending(DefaultTailwindClass("inline-block"))
  }
  /// `inline`.
  public var inline: Self { appending(DefaultTailwindClass("inline")) }
  /// `hidden`.
  public var hidden: Self { appending(DefaultTailwindClass("hidden")) }
  /// `container`.
  public var container: Self { appending(DefaultTailwindClass("container")) }
  /// `contents`.
  public var contents: Self { appending(DefaultTailwindClass("contents")) }
}

extension TailwindStyleBuilder: DisplayStyling {}

// Static mirrors so a display utility can start a chain with a leading dot.
extension TailwindStyleBuilder {
  /// `flex`.
  public static var flex: TailwindStyleBuilder { TailwindStyleBuilder().flex }
  /// `inline-flex`.
  public static var inlineFlex: TailwindStyleBuilder { TailwindStyleBuilder().inlineFlex }
  /// `grid`.
  public static var grid: TailwindStyleBuilder { TailwindStyleBuilder().grid }
  /// `block`.
  public static var block: TailwindStyleBuilder { TailwindStyleBuilder().block }
  /// `inline-block`.
  public static var inlineBlock: TailwindStyleBuilder { TailwindStyleBuilder().inlineBlock }
  /// `inline`.
  public static var inline: TailwindStyleBuilder { TailwindStyleBuilder().inline }
  /// `hidden`.
  public static var hidden: TailwindStyleBuilder { TailwindStyleBuilder().hidden }
  /// `container`.
  public static var container: TailwindStyleBuilder { TailwindStyleBuilder().container }
  /// `contents`.
  public static var contents: TailwindStyleBuilder { TailwindStyleBuilder().contents }
}
