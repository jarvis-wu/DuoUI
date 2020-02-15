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
  weak var rightStackView: UIStackView!
  weak var titleLabel: DuolingoTitleLabel!
  weak var label: DuolingoLabel!
  weak var priceStack: UIStackView!
  weak var priceIcon: SVGKFastImageView!
  weak var priceLabel: DuolingoTitleLabel!
  
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
    
    let rightStack = UIStackView()
    rightStack.axis = .vertical
    rightStack.distribution = .equalCentering
    self.card.addSubview(rightStack)
    rightStack.leadingToTrailing(of: iconView, offset: 20)
    rightStack.top(to: iconView)
    rightStack.trailingToSuperview(offset: 20)
    self.rightStackView = rightStack
    
    let titleLabel = DuolingoTitleLabel()
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    rightStack.addArrangedSubview(titleLabel)
    self.titleLabel = titleLabel
    
    let label = DuolingoLabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.numberOfLines = 0
    rightStack.addArrangedSubview(label)
    label.topToBottom(of: titleLabel, offset: 10)
    self.label = label
    
    let priceStack = UIStackView()
    priceStack.axis = .horizontal
    priceStack.spacing = 8
    self.rightStackView.addArrangedSubview(priceStack)
    self.priceStack = priceStack
    
    let urlPath = Bundle.main.url(forResource: "diamond", withExtension: "svg")
    let priceIcon = SVGKFastImageView(svgkImage: SVGKImage(contentsOf: urlPath))!
    priceStack.addArrangedSubview(priceIcon)
    priceIcon.translatesAutoresizingMaskIntoConstraints = false
    priceIcon.height(20)
    priceIcon.aspectRatio(1)
    self.priceIcon = priceIcon
    
    let priceLabel = DuolingoTitleLabel()
    priceStack.addArrangedSubview(priceLabel)
    priceLabel.translatesAutoresizingMaskIntoConstraints = false
    priceLabel.font = priceLabel.font.withSize(15)
    priceLabel.textColor = UIColor(red: 27/255, green: 177/255, blue: 247/255, alpha: 1)
    self.priceLabel = priceLabel
    
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
