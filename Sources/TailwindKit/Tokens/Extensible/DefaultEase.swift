//
//  DefaultEase.swift
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

/// The built-in Tailwind v4 easing values.
public struct DefaultEase: Ease {
  /// `ease-linear`.
  public static let linear = DefaultEase("linear")
  /// `ease-in`.
  public static let easeIn = DefaultEase("in")
  /// `ease-out`.
  public static let easeOut = DefaultEase("out")
  /// `ease-in-out`.
  public static let inOut = DefaultEase("in-out")

  /// The rendered fragment, e.g. `"in-out"`.
  public let token: String

  internal init(_ token: String) {
    self.token = token
  }
}

extension Ease where Self == DefaultEase {
  /// `ease-linear`.
  public static var linear: DefaultEase { .linear }
  /// `ease-in`.
  public static var easeIn: DefaultEase { .easeIn }
  /// `ease-out`.
  public static var easeOut: DefaultEase { .easeOut }
  /// `ease-in-out`.
  public static var inOut: DefaultEase { .inOut }
}
