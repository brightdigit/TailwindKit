//
//  DefaultTracking.swift
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

/// The built-in Tailwind v4 letter-spacing values.
public struct DefaultTracking: Tracking {
  /// `tracking-tighter`.
  public static let tighter = DefaultTracking("tighter")
  /// `tracking-tight`.
  public static let tight = DefaultTracking("tight")
  /// `tracking-normal`.
  public static let normal = DefaultTracking("normal")
  /// `tracking-wide`.
  public static let wide = DefaultTracking("wide")
  /// `tracking-wider`.
  public static let wider = DefaultTracking("wider")
  /// `tracking-widest`.
  public static let widest = DefaultTracking("widest")

  /// The rendered fragment, e.g. `"tight"`.
  public let token: String

  internal init(_ token: String) {
    self.token = token
  }
}

extension Tracking where Self == DefaultTracking {
  /// `tracking-tighter`.
  public static var tighter: DefaultTracking { .tighter }
  /// `tracking-tight`.
  public static var tight: DefaultTracking { .tight }
  /// `tracking-normal`.
  public static var normal: DefaultTracking { .normal }
  /// `tracking-wide`.
  public static var wide: DefaultTracking { .wide }
  /// `tracking-wider`.
  public static var wider: DefaultTracking { .wider }
  /// `tracking-widest`.
  public static var widest: DefaultTracking { .widest }
}
