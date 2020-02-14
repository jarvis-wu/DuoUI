//
//  DuolingoExtensions.swift
//  DuoUI
//
//  Created by Jarvis Wu on 2/14/20.
//  Copyright © 2020 Jarvis Wu. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
  
  func dimmed(by amount: CGFloat) -> UIColor? {
    return adjusted(hueBy: 0, saturationBy: 0, brightnessBy: -amount, alphaBy: 1)
  }
  
  func transparent(by amount: CGFloat) -> UIColor? {
    return adjusted(hueBy: 0, saturationBy: 0, brightnessBy: 0, alphaBy: amount)
  }
  
  func adjusted(hueBy hAmount: CGFloat,
                saturationBy sAmount: CGFloat,
                brightnessBy bAmount: CGFloat,
                alphaBy aAmount: CGFloat) -> UIColor? {
    for amount in [hAmount, sAmount, bAmount] {
      guard amount >= -1 && amount <= 1 else { return nil }
    }
    guard aAmount >= 0 && aAmount <= 1 else { return nil }
    var h: CGFloat = 0
    var s: CGFloat = 0
    var b: CGFloat = 0
    var a: CGFloat = 0
    if self.getHue(&h, saturation: &s, brightness: &b, alpha: &a) {
      let adjustedColor = UIColor(hue: h * (1 + hAmount), saturation: s * (1 + sAmount), brightness: b * (1 + bAmount), alpha: a * aAmount)
      return adjustedColor
    }
    return nil
  }
}
