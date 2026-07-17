//
//  ListStyling.swift
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

/// The list-style utilities.
///
/// A capability protocol whose members are witnessed against the
/// ``TailwindStyle`` seam; ``TailwindStyleBuilder`` conforms to it. See
/// ``TailwindStyle`` for why the surface is organized this way.
public protocol ListStyling {
  /// `list-<style>`, e.g. `.list(.disc)`.
  func list(_ value: ListStyle) -> Self
}

extension ListStyling where Self: TailwindStyle {
  /// `list-<style>`, e.g. `.list(.disc)`.
  public func list(_ value: ListStyle) -> Self {
    appending(DefaultTailwindClass("list-\(value.token)"))
  }
}

extension TailwindStyleBuilder: ListStyling {}

// Static mirror so a list utility can start a chain with a leading dot.
extension TailwindStyleBuilder {
  /// `list-<style>`.
  public static func list(_ value: ListStyle) -> TailwindStyleBuilder {
    TailwindStyleBuilder().list(value)
  }
}
