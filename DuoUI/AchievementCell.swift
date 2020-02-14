//
//  AchievementCell.swift
//  DuoUI
//
//  Created by Jarvis Wu on 2/14/20.
//  Copyright © 2020 Jarvis Wu. All rights reserved.
//

import UIKit
import SVGKit

class AchievementCell: UICollectionViewCell {

  static var identifier: String = "AchievementCell"
  weak var card: DuolingoShadowedCard!
  weak var cardIcon: SVGKFastImageView! // encapsulate into subclass
  weak var cardTitleLabel: DuolingoTitleLabel! // encapsulate into subclass
  weak var rightStackView: UIStackView!
  weak var titleLabel: DuolingoTitleLabel!
  weak var label: DuolingoLabel!
  weak var progressView: DuolingoProgressView!

  override init(frame: CGRect) {
    super.init(frame: frame)
    let card = DuolingoShadowedCard()
    card.translatesAutoresizingMaskIntoConstraints = false
    self.contentView.addSubview(card)
    card.topToSuperview()
    card.leadingToSuperview()
    card.aspectRatio(6/7)
    self.card = card
    
    let cardIcon = SVGKFastImageView(svgkImage: nil)!
    card.addSubview(cardIcon)
    cardIcon.translatesAutoresizingMaskIntoConstraints = false
    cardIcon.centerXToSuperview()
    cardIcon.aspectRatio(1)
    cardIcon.leadingToSuperview(offset: 15)
    cardIcon.topToSuperview(offset: 10)
    self.cardIcon = cardIcon
    
    let cardTitleLabel = DuolingoTitleLabel()
    card.addSubview(cardTitleLabel)
    cardTitleLabel.translatesAutoresizingMaskIntoConstraints = false
    cardTitleLabel.centerXToSuperview()
    cardTitleLabel.leadingToSuperview(offset: 5)
    cardTitleLabel.bottomToSuperview(offset: -10)
    self.cardTitleLabel = cardTitleLabel
    
    let rightStack = UIStackView()
    rightStack.axis = .vertical
    rightStack.distribution = .equalCentering
    self.contentView.addSubview(rightStack)
    rightStack.leadingToTrailing(of: card, offset: 20)
    rightStack.centerYToSuperview()
    rightStack.trailingToSuperview()
    self.rightStackView = rightStack
    
    let titleLabel = DuolingoTitleLabel()
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    rightStack.addArrangedSubview(titleLabel)
    self.titleLabel = titleLabel
    
    let label = DuolingoLabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    rightStack.addArrangedSubview(label)
    label.topToBottom(of: titleLabel, offset: 10)
    self.label = label
    
    let progressView = DuolingoProgressView()
    progressView.translatesAutoresizingMaskIntoConstraints = false
    rightStack.addArrangedSubview(progressView)
    progressView.topToBottom(of: label, offset: 15)
    self.progressView = progressView
    
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
