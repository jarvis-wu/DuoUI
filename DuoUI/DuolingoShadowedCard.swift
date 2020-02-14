//
//  DuolingoShadowedCard.swift
//  DuoUI
//
//  Created by Jarvis Wu on 2/14/20.
//  Copyright © 2020 Jarvis Wu. All rights reserved.
//

import UIKit

class DuolingoShadowedCard: UIView, DropShadowView {
  
  let ui = DuoUI.shared
  var background = UIView()
  var backgroundBottomToSuperview: NSLayoutConstraint!
  var mainColor = UIColor(red: 123/255, green: 199/255, blue: 11/255, alpha: 1) {
    didSet {
      shadowColor = mainColor.dimmed(by: 1 - ui.DUO_SHADOWED_CARD_DIM_RATIO)!
      addShadow()
    }
  }
  var shadowColor: UIColor {
    get { return mainColor.dimmed(by: 1 - ui.DUO_SHADOWED_CARD_DIM_RATIO)! } set {}
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
    layer.cornerRadius = ui.DUO_SHADOWED_CARD_CORNER_RADIUS
    heightConstraint = height(ui.DUO_SHADOWED_CARD_HEIGHT, isActive: true)
    addShadow()
  }
  
  func addShadow() {
    backgroundColor = shadowColor
    self.insertSubview(background, at: 0)
    background.layer.cornerRadius = self.layer.cornerRadius
    background.backgroundColor = mainColor
    background.edgesToSuperview(excluding: [.bottom])
    backgroundBottomToSuperview = background.bottomToSuperview(offset: -ui.DUO_SHADOWED_CARD_DROP_SHADOW_HEIGHT)
  }
  

}
