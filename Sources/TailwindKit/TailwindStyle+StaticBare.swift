//
//  TailwindStyle+StaticBare.swift
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

extension TailwindStyle {
  // MARK: Display

  /// `flex`.
  public static var flex: TailwindStyle { TailwindStyle().flex }
  /// `inline-flex`.
  public static var inlineFlex: TailwindStyle { TailwindStyle().inlineFlex }
  /// `grid`.
  public static var grid: TailwindStyle { TailwindStyle().grid }
  /// `block`.
  public static var block: TailwindStyle { TailwindStyle().block }
  /// `inline-block`.
  public static var inlineBlock: TailwindStyle { TailwindStyle().inlineBlock }
  /// `inline`.
  public static var inline: TailwindStyle { TailwindStyle().inline }
  /// `hidden`.
  public static var hidden: TailwindStyle { TailwindStyle().hidden }

  // MARK: Flexbox & grid

  /// `flex-row`.
  public static var flexRow: TailwindStyle { TailwindStyle().flexRow }
  /// `flex-col`.
  public static var flexCol: TailwindStyle { TailwindStyle().flexCol }
  /// `flex-wrap`.
  public static var flexWrap: TailwindStyle { TailwindStyle().flexWrap }
  /// `grow`.
  public static var grow: TailwindStyle { TailwindStyle().grow }
  /// `shrink`.
  public static var shrink: TailwindStyle { TailwindStyle().shrink }
  /// `gap` (bare).
  public static var gap: TailwindStyle { TailwindStyle().gap }

  // MARK: Colors

  /// `bg-white`.
  public static var bgWhite: TailwindStyle { TailwindStyle().bgWhite }
  /// `bg-black`.
  public static var bgBlack: TailwindStyle { TailwindStyle().bgBlack }
  /// `bg-transparent`.
  public static var bgTransparent: TailwindStyle { TailwindStyle().bgTransparent }

  // MARK: Typography

  /// `text-white`.
  public static var textWhite: TailwindStyle { TailwindStyle().textWhite }
  /// `text-black`.
  public static var textBlack: TailwindStyle { TailwindStyle().textBlack }
  /// `italic`.
  public static var italic: TailwindStyle { TailwindStyle().italic }
  /// `underline`.
  public static var underline: TailwindStyle { TailwindStyle().underline }
  /// `uppercase`.
  public static var uppercase: TailwindStyle { TailwindStyle().uppercase }
  /// `lowercase`.
  public static var lowercase: TailwindStyle { TailwindStyle().lowercase }
  /// `capitalize`.
  public static var capitalize: TailwindStyle { TailwindStyle().capitalize }

  // MARK: Borders & radius

  /// `border` (bare).
  public static var border: TailwindStyle { TailwindStyle().border }
  /// `rounded` (bare).
  public static var rounded: TailwindStyle { TailwindStyle().rounded }
}
