//
//  TransitionStyling.swift
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

/// Transition utilities — the `transition-*` enabling classes plus `duration`
/// and `ease`.
///
/// A capability protocol witnessed against the ``TailwindStyle`` seam;
/// ``TailwindStyleBuilder`` conforms to it. See ``TailwindStyle`` for the
/// architecture rationale.
public protocol TransitionStyling {
  /// `transition-all`.
  var transitionAll: Self { get }
  /// `transition-opacity`.
  var transitionOpacity: Self { get }
  /// `transition-colors`.
  var transitionColors: Self { get }
  /// `transition-transform`.
  var transitionTransform: Self { get }

  /// `duration-<ms>`, e.g. `.duration(300)`.
  func duration(_ milliseconds: Int) -> Self
  /// `ease-<value>`, e.g. `.ease(.inOut)` → `ease-in-out`.
  func ease(_ ease: some Ease) -> Self
}

extension TransitionStyling where Self: TailwindStyle {
  // MARK: Transitions (bare)

  /// `transition-all`.
  public var transitionAll: Self {
    appending(DefaultTailwindClass("transition-all"))
  }
  /// `transition-opacity`.
  public var transitionOpacity: Self {
    appending(DefaultTailwindClass("transition-opacity"))
  }
  /// `transition-colors`.
  public var transitionColors: Self {
    appending(DefaultTailwindClass("transition-colors"))
  }
  /// `transition-transform`.
  public var transitionTransform: Self {
    appending(DefaultTailwindClass("transition-transform"))
  }

  // MARK: Transitions (parameterized)

  /// `duration-<ms>`, e.g. `.duration(300)`.
  public func duration(_ milliseconds: Int) -> Self {
    appending(DefaultTailwindClass("duration-\(milliseconds)"))
  }
  /// `ease-<value>`, e.g. `.ease(.inOut)` → `ease-in-out`.
  public func ease(_ ease: some Ease) -> Self {
    appending(DefaultTailwindClass("ease-\(ease.token)"))
  }
}

extension TailwindStyleBuilder: TransitionStyling {}

// Static mirrors so a transition utility can start a chain with a leading dot.
extension TailwindStyleBuilder {
  /// `transition-all`.
  public static var transitionAll: TailwindStyleBuilder { TailwindStyleBuilder().transitionAll }
  /// `transition-opacity`.
  public static var transitionOpacity: TailwindStyleBuilder {
    TailwindStyleBuilder().transitionOpacity
  }
  /// `transition-colors`.
  public static var transitionColors: TailwindStyleBuilder {
    TailwindStyleBuilder().transitionColors
  }
  /// `transition-transform`.
  public static var transitionTransform: TailwindStyleBuilder {
    TailwindStyleBuilder().transitionTransform
  }
}

extension TailwindStyleBuilder {
  /// `duration-<ms>`.
  public static func duration(_ milliseconds: Int) -> TailwindStyleBuilder {
    TailwindStyleBuilder().duration(milliseconds)
  }
  /// `ease-<value>`.
  public static func ease(_ ease: some Ease) -> TailwindStyleBuilder {
    TailwindStyleBuilder().ease(ease)
  }
}
