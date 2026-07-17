//
//  DefaultColor.swift
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

/// The built-in Tailwind v4 color families.
///
/// A `public` type (its name is the return type of the static members below)
/// with no public initializer, so callers reference `.blue` but never
/// construct it directly — like SwiftUI's `DefaultButtonStyle`.
public struct DefaultColor: Color {
  /// `slate`.
  public static let slate = DefaultColor("slate")
  /// `gray`.
  public static let gray = DefaultColor("gray")
  /// `zinc`.
  public static let zinc = DefaultColor("zinc")
  /// `neutral`.
  public static let neutral = DefaultColor("neutral")
  /// `stone`.
  public static let stone = DefaultColor("stone")
  /// `red`.
  public static let red = DefaultColor("red")
  /// `orange`.
  public static let orange = DefaultColor("orange")
  /// `amber`.
  public static let amber = DefaultColor("amber")
  /// `yellow`.
  public static let yellow = DefaultColor("yellow")
  /// `lime`.
  public static let lime = DefaultColor("lime")
  /// `green`.
  public static let green = DefaultColor("green")
  /// `emerald`.
  public static let emerald = DefaultColor("emerald")
  /// `teal`.
  public static let teal = DefaultColor("teal")
  /// `cyan`.
  public static let cyan = DefaultColor("cyan")
  /// `sky`.
  public static let sky = DefaultColor("sky")
  /// `blue`.
  public static let blue = DefaultColor("blue")
  /// `indigo`.
  public static let indigo = DefaultColor("indigo")
  /// `violet`.
  public static let violet = DefaultColor("violet")
  /// `purple`.
  public static let purple = DefaultColor("purple")
  /// `fuchsia`.
  public static let fuchsia = DefaultColor("fuchsia")
  /// `pink`.
  public static let pink = DefaultColor("pink")
  /// `rose`.
  public static let rose = DefaultColor("rose")

  /// The rendered fragment, e.g. `"blue"`.
  public let token: String

  internal init(_ token: String) {
    self.token = token
  }
}

extension Color where Self == DefaultColor {
  /// `slate`.
  public static var slate: DefaultColor { .slate }
  /// `gray`.
  public static var gray: DefaultColor { .gray }
  /// `zinc`.
  public static var zinc: DefaultColor { .zinc }
  /// `neutral`.
  public static var neutral: DefaultColor { .neutral }
  /// `stone`.
  public static var stone: DefaultColor { .stone }
  /// `red`.
  public static var red: DefaultColor { .red }
  /// `orange`.
  public static var orange: DefaultColor { .orange }
  /// `amber`.
  public static var amber: DefaultColor { .amber }
  /// `yellow`.
  public static var yellow: DefaultColor { .yellow }
  /// `lime`.
  public static var lime: DefaultColor { .lime }
  /// `green`.
  public static var green: DefaultColor { .green }
  /// `emerald`.
  public static var emerald: DefaultColor { .emerald }
  /// `teal`.
  public static var teal: DefaultColor { .teal }
  /// `cyan`.
  public static var cyan: DefaultColor { .cyan }
  /// `sky`.
  public static var sky: DefaultColor { .sky }
  /// `blue`.
  public static var blue: DefaultColor { .blue }
  /// `indigo`.
  public static var indigo: DefaultColor { .indigo }
  /// `violet`.
  public static var violet: DefaultColor { .violet }
  /// `purple`.
  public static var purple: DefaultColor { .purple }
  /// `fuchsia`.
  public static var fuchsia: DefaultColor { .fuchsia }
  /// `pink`.
  public static var pink: DefaultColor { .pink }
  /// `rose`.
  public static var rose: DefaultColor { .rose }
}
