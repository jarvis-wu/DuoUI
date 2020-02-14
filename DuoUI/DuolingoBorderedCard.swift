//
//  DuolingoBorderedCard.swift
//  DuoUI
//
//  Created by Jarvis Wu on 2/14/20.
//  Copyright © 2020 Jarvis Wu. All rights reserved.
//

import UIKit

class DuolingoBorderedCard: UIView {

  var CORNER_RADIUS: CGFloat = 15
  var BORDER_WIDTH: CGFloat = 2
  var HEIGHT: CGFloat = 100
  var borderColor = UIColor(white: 0.9, alpha: 1).cgColor
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
    layer.borderColor = borderColor
    layer.borderWidth = BORDER_WIDTH
    heightConstraint = height(HEIGHT, isActive: true)
  }


}
