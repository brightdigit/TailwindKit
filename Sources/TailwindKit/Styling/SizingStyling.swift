//
//  SizingStyling.swift
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

/// The width/height **sizing** utilities.
///
/// A capability protocol whose members are witnessed against the
/// ``TailwindStyle`` seam; ``TailwindStyleBuilder`` conforms to it. See
/// ``TailwindStyle`` for why the surface is organized this way.
public protocol SizingStyling {
  /// `w-<size>`, e.g. `.w(.full)`.
  func w(_ size: DefaultSize) -> Self
  /// `h-<size>`, e.g. `.h(.full)`.
  func h(_ size: DefaultSize) -> Self
  /// `max-w-<size>`, e.g. `.maxW(.lg)`.
  func maxW(_ size: some MaxWidth) -> Self
  /// `max-h-<size>`, e.g. `.maxH(.full)`.
  func maxH(_ size: DefaultSize) -> Self
}

extension SizingStyling where Self: TailwindStyle {
  /// `w-<size>`, e.g. `.w(.full)`.
  public func w(_ size: DefaultSize) -> Self {
    appending(DefaultTailwindClass("w-\(size.token)"))
  }
  /// `h-<size>`, e.g. `.h(.full)`.
  public func h(_ size: DefaultSize) -> Self {
    appending(DefaultTailwindClass("h-\(size.token)"))
  }
  /// `max-w-<size>`, e.g. `.maxW(.lg)`.
  public func maxW(_ size: some MaxWidth) -> Self {
    appending(DefaultTailwindClass("max-w-\(size.token)"))
  }
  /// `max-h-<size>`, e.g. `.maxH(.full)`.
  public func maxH(_ size: DefaultSize) -> Self {
    appending(DefaultTailwindClass("max-h-\(size.token)"))
  }
}

extension TailwindStyleBuilder: SizingStyling {}

// Static mirrors so a sizing utility can start a chain with a leading dot.
extension TailwindStyleBuilder {
  /// `w-<size>`.
  public static func w(_ size: DefaultSize) -> TailwindStyleBuilder {
    TailwindStyleBuilder().w(size)
  }
  /// `h-<size>`.
  public static func h(_ size: DefaultSize) -> TailwindStyleBuilder {
    TailwindStyleBuilder().h(size)
  }
  /// `max-w-<size>`.
  public static func maxW(_ size: some MaxWidth) -> TailwindStyleBuilder {
    TailwindStyleBuilder().maxW(size)
  }
  /// `max-h-<size>`.
  public static func maxH(_ size: DefaultSize) -> TailwindStyleBuilder {
    TailwindStyleBuilder().maxH(size)
  }
}
