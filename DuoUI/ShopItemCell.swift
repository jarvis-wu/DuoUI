//
//  ShopItemCell.swift
//  DuoUI
//
//  Created by Jarvis Wu on 2/14/20.
//  Copyright © 2020 Jarvis Wu. All rights reserved.
//

import UIKit
import SVGKit

class ShopItemCell: UICollectionViewCell {
  
  static var identifier: String = "ShopItemCell"
  weak var card: DuolingoBorderedCard!
  weak var iconView: SVGKFastImageView!
  weak var titleLabel: DuolingoTitleLabel!
  weak var label: DuolingoLabel!
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    let card = DuolingoBorderedCard()
    card.translatesAutoresizingMaskIntoConstraints = false
    self.contentView.addSubview(card)
    card.edgesToSuperview()
    self.card = card
    
    let iconView = SVGKFastImageView(svgkImage: nil)!
    card.addSubview(iconView)
    iconView.translatesAutoresizingMaskIntoConstraints = false
    iconView.height(80)
    iconView.aspectRatio(1)
    iconView.leadingToSuperview(offset: 20)
    iconView.topToSuperview(offset: 20)
    self.iconView = iconView
    
    self.reset()
  }

  required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }

  override func prepareForReuse() {
      super.prepareForReuse()
      self.reset()
  }

  func reset() {
      //
  }
  
}
