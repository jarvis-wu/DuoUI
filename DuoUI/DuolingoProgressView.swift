//
//  DuolingoProgressView.swift
//  DuoUI
//
//  Created by Jarvis Wu on 2/14/20.
//  Copyright © 2020 Jarvis Wu. All rights reserved.
//

import UIKit

class DuolingoProgressView: UIProgressView {
  
  override var progress: Float {
    didSet {
      guard let _ = tintedProgressWidth else { return }
      tintedProgressWidth.isActive = false
      tintedProgressWidth = tintedProgress.widthToSuperview(multiplier: CGFloat(self.progress))
    }
  }
  
  let trackBackgroundView = UIView()
  let tintedProgress = UIView()
  let highlightView = UIView()
  let DEFAULT_HEIGHT: CGFloat = 24
  let DEFAULT_TRACK_COLOR = UIColor(red: 229/255, green: 229/255, blue: 229/255, alpha: 1)
  let DEFAULT_PROGRESS_COLOR = UIColor(red: 255/255, green: 200/255, blue: 0/255, alpha: 1)
  var DEFAULT_PROGRESS_HIGHLIGHT: UIColor {
    return DEFAULT_PROGRESS_COLOR.dimmed(by: -0.05) ?? .white
  }
  var tintedProgressWidth: NSLayoutConstraint!

  override init(frame: CGRect) {
    super.init(frame: frame)
    commonInit()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    commonInit()
  }
  
  private func commonInit() {
    clipsToBounds = false
    height(DEFAULT_HEIGHT)
    trackTintColor = .clear
    tintColor = .clear
    progress = 0.5
    
    self.addSubview(trackBackgroundView)
    self.addSubview(tintedProgress)
    tintedProgress.addSubview(highlightView)
    
    trackBackgroundView.edgesToSuperview(excluding: [.top, .bottom])
    trackBackgroundView.height(DEFAULT_HEIGHT)
    trackBackgroundView.centerYToSuperview()
    trackBackgroundView.layer.cornerRadius = DEFAULT_HEIGHT / 2
    trackBackgroundView.backgroundColor = DEFAULT_TRACK_COLOR
    
    tintedProgress.edgesToSuperview(excluding: [.top, .bottom, .trailing])
    tintedProgress.height(DEFAULT_HEIGHT)
    tintedProgress.centerYToSuperview()
    tintedProgressWidth = tintedProgress.widthToSuperview(multiplier: CGFloat(self.progress))
    tintedProgress.layer.cornerRadius = DEFAULT_HEIGHT / 2
    tintedProgress.backgroundColor = DEFAULT_PROGRESS_COLOR
    
    highlightView.bottom(to: tintedProgress, tintedProgress.centerYAnchor, offset: 1)
    highlightView.height(DEFAULT_HEIGHT / 3)
    highlightView.layer.cornerRadius = (DEFAULT_HEIGHT / 3) / 2
    highlightView.centerXToSuperview()
    highlightView.leadingToSuperview(offset: 5)
    highlightView.backgroundColor = DEFAULT_PROGRESS_HIGHLIGHT
  }

}
