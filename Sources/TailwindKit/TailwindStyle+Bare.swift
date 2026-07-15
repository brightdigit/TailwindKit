//
//  TailwindStyle+Bare.swift
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
  public var flex: TailwindStyle { appending("flex") }
  /// `inline-flex`.
  public var inlineFlex: TailwindStyle { appending("inline-flex") }
  /// `grid`.
  public var grid: TailwindStyle { appending("grid") }
  /// `block`.
  public var block: TailwindStyle { appending("block") }
  /// `inline-block`.
  public var inlineBlock: TailwindStyle { appending("inline-block") }
  /// `inline`.
  public var inline: TailwindStyle { appending("inline") }
  /// `hidden`.
  public var hidden: TailwindStyle { appending("hidden") }

  // MARK: Flexbox & grid

  /// `flex-row`.
  public var flexRow: TailwindStyle { appending("flex-row") }
  /// `flex-col`.
  public var flexCol: TailwindStyle { appending("flex-col") }
  /// `flex-wrap`.
  public var flexWrap: TailwindStyle { appending("flex-wrap") }
  /// `grow`.
  public var grow: TailwindStyle { appending("grow") }
  /// `shrink`.
  public var shrink: TailwindStyle { appending("shrink") }
  /// `gap` (bare).
  public var gap: TailwindStyle { appending("gap") }

  // MARK: Colors

  /// `bg-white`.
  public var bgWhite: TailwindStyle { appending("bg-white") }
  /// `bg-black`.
  public var bgBlack: TailwindStyle { appending("bg-black") }
  /// `bg-transparent`.
  public var bgTransparent: TailwindStyle { appending("bg-transparent") }

  // MARK: Typography

  /// `text-white`.
  public var textWhite: TailwindStyle { appending("text-white") }
  /// `text-black`.
  public var textBlack: TailwindStyle { appending("text-black") }
  /// `italic`.
  public var italic: TailwindStyle { appending("italic") }
  /// `underline`.
  public var underline: TailwindStyle { appending("underline") }
  /// `uppercase`.
  public var uppercase: TailwindStyle { appending("uppercase") }
  /// `lowercase`.
  public var lowercase: TailwindStyle { appending("lowercase") }
  /// `capitalize`.
  public var capitalize: TailwindStyle { appending("capitalize") }

  // MARK: Borders & radius

  /// `border` (1px, bare).
  public var border: TailwindStyle { appending("border") }
  /// `rounded` (bare).
  public var rounded: TailwindStyle { appending("rounded") }
}
