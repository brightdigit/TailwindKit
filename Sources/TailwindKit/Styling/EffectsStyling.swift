//
//  EffectsStyling.swift
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

/// Shadow, ring, opacity, object-fit, and filter utilities.
///
/// A capability protocol witnessed against the ``TailwindStyle`` seam;
/// ``TailwindStyleBuilder`` conforms to it. See ``TailwindStyle`` for the
/// architecture rationale.
public protocol EffectsStyling {
  /// `invert` (`invert(100%)`).
  var invert: Self { get }
  /// `grayscale` (`grayscale(100%)`).
  var grayscale: Self { get }
  /// `backdrop-grayscale`.
  var backdropGrayscale: Self { get }

  /// `shadow-<value>`, e.g. `.shadow(.lg)`.
  func shadow(_ shadow: some Shadow) -> Self
  /// `drop-shadow-<value>`, e.g. `.dropShadow(.xl)`.
  func dropShadow(_ shadow: some DropShadow) -> Self
  /// `ring-<n>`, e.g. `.ring(4)`.
  func ring(_ width: Int) -> Self
  /// `opacity-<n>`, e.g. `.opacity(90)`.
  func opacity(_ value: Int) -> Self
  /// `object-<fit>`, e.g. `.object(.cover)`.
  func object(_ fit: ObjectFit) -> Self
  /// `backdrop-blur-<size>`, e.g. `.backdropBlur(.lg)`.
  func backdropBlur(_ radius: some Radius) -> Self
  /// `backdrop-brightness-<n>`, e.g. `.backdropBrightness(50)`.
  func backdropBrightness(_ value: Int) -> Self
  /// `hue-rotate-<deg>`, e.g. `.hueRotate(180)`.
  func hueRotate(_ degrees: Int) -> Self
}

extension EffectsStyling where Self: TailwindStyle {
  // MARK: Filters (bare)

  /// `invert` (`invert(100%)`).
  public var invert: Self { appending(DefaultTailwindClass("invert")) }
  /// `grayscale` (`grayscale(100%)`).
  public var grayscale: Self { appending(DefaultTailwindClass("grayscale")) }
  /// `backdrop-grayscale`.
  public var backdropGrayscale: Self {
    appending(DefaultTailwindClass("backdrop-grayscale"))
  }

  // MARK: Effects

  /// `shadow-<value>`, e.g. `.shadow(.lg)`.
  public func shadow(_ shadow: some Shadow) -> Self {
    appending(DefaultTailwindClass("shadow-\(shadow.token)"))
  }
  /// `drop-shadow-<value>`, e.g. `.dropShadow(.xl)`.
  public func dropShadow(_ shadow: some DropShadow) -> Self {
    appending(DefaultTailwindClass("drop-shadow-\(shadow.token)"))
  }
  /// `ring-<n>`, e.g. `.ring(4)`.
  public func ring(_ width: Int) -> Self {
    appending(DefaultTailwindClass("ring-\(width)"))
  }
  /// `opacity-<n>`, e.g. `.opacity(90)`.
  public func opacity(_ value: Int) -> Self {
    appending(DefaultTailwindClass("opacity-\(value)"))
  }
  /// `object-<fit>`, e.g. `.object(.cover)`.
  public func object(_ fit: ObjectFit) -> Self {
    appending(DefaultTailwindClass("object-\(fit.token)"))
  }

  // MARK: Filters (parameterized)

  /// `backdrop-blur-<size>`, e.g. `.backdropBlur(.lg)`.
  public func backdropBlur(_ radius: some Radius) -> Self {
    radius.token.isEmpty
      ? appending(DefaultTailwindClass("backdrop-blur"))
      : appending(DefaultTailwindClass("backdrop-blur-\(radius.token)"))
  }
  /// `backdrop-brightness-<n>`, e.g. `.backdropBrightness(50)`.
  public func backdropBrightness(_ value: Int) -> Self {
    appending(DefaultTailwindClass("backdrop-brightness-\(value)"))
  }
  /// `hue-rotate-<deg>`, e.g. `.hueRotate(180)`.
  public func hueRotate(_ degrees: Int) -> Self {
    appending(DefaultTailwindClass("hue-rotate-\(degrees)"))
  }
}

extension TailwindStyleBuilder: EffectsStyling {}

// Static mirrors so an effect/filter utility can start a chain with a leading dot.
extension TailwindStyleBuilder {
  /// `invert`.
  public static var invert: TailwindStyleBuilder { TailwindStyleBuilder().invert }
  /// `grayscale`.
  public static var grayscale: TailwindStyleBuilder { TailwindStyleBuilder().grayscale }
  /// `backdrop-grayscale`.
  public static var backdropGrayscale: TailwindStyleBuilder {
    TailwindStyleBuilder().backdropGrayscale
  }
}

extension TailwindStyleBuilder {
  /// `shadow-<value>`.
  public static func shadow(_ shadow: some Shadow) -> TailwindStyleBuilder {
    TailwindStyleBuilder().shadow(shadow)
  }
  /// `drop-shadow-<value>`.
  public static func dropShadow(_ shadow: some DropShadow) -> TailwindStyleBuilder {
    TailwindStyleBuilder().dropShadow(shadow)
  }
  /// `ring-<n>`.
  public static func ring(_ width: Int) -> TailwindStyleBuilder {
    TailwindStyleBuilder().ring(width)
  }
  /// `opacity-<n>`.
  public static func opacity(_ value: Int) -> TailwindStyleBuilder {
    TailwindStyleBuilder().opacity(value)
  }
  /// `object-<fit>`.
  public static func object(_ fit: ObjectFit) -> TailwindStyleBuilder {
    TailwindStyleBuilder().object(fit)
  }
  /// `backdrop-blur-<size>`.
  public static func backdropBlur(_ radius: some Radius) -> TailwindStyleBuilder {
    TailwindStyleBuilder().backdropBlur(radius)
  }
  /// `backdrop-brightness-<n>`.
  public static func backdropBrightness(_ value: Int) -> TailwindStyleBuilder {
    TailwindStyleBuilder().backdropBrightness(value)
  }
  /// `hue-rotate-<deg>`.
  public static func hueRotate(_ degrees: Int) -> TailwindStyleBuilder {
    TailwindStyleBuilder().hueRotate(degrees)
  }
}
