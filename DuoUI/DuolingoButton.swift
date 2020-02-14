//
//  DuolingoButton.swift
//  DuoUI
//
//  Created by Jarvis Wu on 2/14/20.
//  Copyright © 2020 Jarvis Wu. All rights reserved.
//

import UIKit
import TinyConstraints

protocol DropShadowView {
  var mainColor: UIColor { get }
  var shadowColor: UIColor { get set }
  var background: UIView { get }
  var backgroundBottomToSuperview: NSLayoutConstraint! { get }
  var DROP_SHADOW_HEIGHT: CGFloat { get }
  func addShadow()
}

class DuolingoButton: UIButton, DropShadowView {
  
  var background = UIView()
  var backgroundBottomToSuperview: NSLayoutConstraint!
  var CORNER_RADIUS: CGFloat = 12
  var DROP_SHADOW_HEIGHT: CGFloat = 4
  var HEIGHT: CGFloat = 50
  let dimRatio: CGFloat = 0.83
  var mainColor = UIColor(red: 27/255, green: 177/255, blue: 247/255, alpha: 1) {
    didSet {
      // set different color for white button
      shadowColor = mainColor.dimmed(by: 1 - dimRatio)!
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
    setTitleColor(.white, for: .normal)
    let fontSize: CGFloat = 15
    let systemFont = UIFont.systemFont(ofSize: fontSize, weight: .heavy)
    let font: UIFont
    if let descriptor = systemFont.fontDescriptor.withDesign(.rounded) {
      font = UIFont(descriptor: descriptor, size: fontSize)
    } else {
      font = systemFont
    }
    titleLabel?.font = font
    titleLabel?.centerYToSuperview(offset: -DROP_SHADOW_HEIGHT / 2)
    setTitle("shadowed button".uppercased(), for: .normal)
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
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesBegan(touches, with: event)
    self.layer.removeAllAnimations()
    UIView.animate(withDuration: 0.2) {
      self.heightConstraint.isActive = false
      self.backgroundBottomToSuperview.isActive = false
      self.heightConstraint = self.height(self.HEIGHT - self.DROP_SHADOW_HEIGHT, isActive: true)
      self.backgroundBottomToSuperview = self.background.bottomToSuperview()
    }
  }
  
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesEnded(touches, with: event)
    self.layer.removeAllAnimations()
    UIView.animate(withDuration: 0.2) {
      self.heightConstraint.isActive = false
      self.backgroundBottomToSuperview.isActive = false
      self.heightConstraint = self.height(self.HEIGHT, isActive: true)
      self.backgroundBottomToSuperview = self.background.bottomToSuperview(offset: -self.DROP_SHADOW_HEIGHT)
    }
  }

}
