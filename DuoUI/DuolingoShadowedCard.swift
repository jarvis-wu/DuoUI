//
//  DuolingoShadowedCard.swift
//  DuoUI
//
//  Created by Jarvis Wu on 2/14/20.
//  Copyright © 2020 Jarvis Wu. All rights reserved.
//

import UIKit

class DuolingoShadowedCard: UIView, DropShadowView {
  
  var background = UIView()
  var backgroundBottomToSuperview: NSLayoutConstraint!
  var CORNER_RADIUS: CGFloat = 15
  var DROP_SHADOW_HEIGHT: CGFloat = 4
  var HEIGHT: CGFloat = 100
  let dimRatio: CGFloat = 0.83
  var mainColor = UIColor(red: 123/255, green: 199/255, blue: 11/255, alpha: 1) {
    didSet {
      shadowColor = mainColor.dimmed(by: 1 - dimRatio)!
      addShadow()
    }
  }
  var shadowColor: UIColor {
    get { return mainColor.dimmed(by: 1 - dimRatio)! } set {}
  }
  var heightConstraint: NSLayoutConstraint!
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    commonInit()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    commonInit()
  }
  
  private func commonInit() {
    layer.cornerRadius = CORNER_RADIUS
    heightConstraint = height(HEIGHT, isActive: true)
    addShadow()
  }
  
  func addShadow() {
    backgroundColor = shadowColor
    self.insertSubview(background, at: 0)
    background.layer.cornerRadius = self.layer.cornerRadius
    background.backgroundColor = mainColor
    background.edgesToSuperview(excluding: [.bottom])
    backgroundBottomToSuperview = background.bottomToSuperview(offset: -DROP_SHADOW_HEIGHT)
  }
  

}
