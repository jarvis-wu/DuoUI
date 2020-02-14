//
//  DuolingoSeparator.swift
//  DuoUI
//
//  Created by Jarvis Wu on 2/14/20.
//  Copyright © 2020 Jarvis Wu. All rights reserved.
//

import UIKit

class DuolingoSeparator: UIView {

  override init(frame: CGRect) {
    super.init(frame: frame)
    commonInit()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    commonInit()
  }
  
  private func commonInit() {
    backgroundColor = UIColor(white: 0.9, alpha: 1)
    height(2)
  }
  
  override func didMoveToSuperview() {
    if let _ = superview {
      widthToSuperview()
      centerXToSuperview()
    }
  }

}
