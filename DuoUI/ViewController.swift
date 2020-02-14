//
//  ViewController.swift
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

class ViewController: UIViewController {
  
  let icons1 = ["parrot"]
  let icons2 = ["walrus", "dolphin", "chameleon", "koala", "penguin", "hedgehog", "hyena", "flamingos"]
  let colors: [UIColor] = [.systemRed, .systemOrange, .systemYellow, .systemGreen, .systemTeal, .systemBlue, .systemIndigo, .systemPurple]
  
  let cardCollectionView = UICollectionView(frame: .zero, collectionViewLayout: .init())
  let duolingoButton = DuolingoButton()
  let headerView = UIView()
  let bottomView = UIView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    addSubviews()
    addConstraints()
    duolingoButton.centerXToSuperview()
    cardCollectionView.translatesAutoresizingMaskIntoConstraints = false
    cardCollectionView.dataSource = self
    cardCollectionView.delegate = self
    cardCollectionView.backgroundColor = .white
    cardCollectionView.register(AchievementCell.self, forCellWithReuseIdentifier: AchievementCell.identifier)
    cardCollectionView.register(ShopItemCell.self, forCellWithReuseIdentifier: ShopItemCell.identifier)
    cardCollectionView.reloadData()
    layoutCells()
    bottomView.backgroundColor = .white
  }
  
  private func addSubviews() {
    view.addSubview(cardCollectionView)
    addHeaderView()
    addBottomView()
  }
  
  private func addConstraints() {
    duolingoButton.centerXToSuperview()
    duolingoButton.leadingToSuperview(offset: 30)
    duolingoButton.bottomToSuperview(offset: -40)
    headerView.topToSuperview()
    headerView.widthToSuperview()
    headerView.height(100)
    bottomView.top(to: duolingoButton, offset: -30)
    bottomView.widthToSuperview()
    bottomView.bottomToSuperview()
    cardCollectionView.leadingToSuperview()
    cardCollectionView.trailingToSuperview()
    cardCollectionView.topToBottom(of: headerView)
    cardCollectionView.bottomToTop(of: bottomView)
  }
  
  func addBottomView() {
    view.addSubview(bottomView)
    bottomView.addSubview(duolingoButton)
    let separator = DuolingoSeparator()
    bottomView.addSubview(separator)
    separator.topToSuperview()
  }
  
  func addHeaderView() {
    view.addSubview(headerView)
    let separator = DuolingoSeparator()
    headerView.addSubview(separator)
    separator.bottomToSuperview()
  }
  
  func layoutCells() {
    let layout = UICollectionViewFlowLayout()
    layout.sectionInset = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
    layout.minimumInteritemSpacing = 5
    layout.minimumLineSpacing = 40
    cardCollectionView.collectionViewLayout = layout
  }


}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 2
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    if section == 0 {
      return icons1.count
    }
    return colors.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    var cell = UICollectionViewCell()
    if indexPath.section == 0 {
      let shopItemCell = collectionView.dequeueReusableCell(withReuseIdentifier: ShopItemCell.identifier, for: indexPath) as! ShopItemCell
      let urlPath = Bundle.main.url(forResource: icons1[indexPath.item], withExtension: "svg")
      shopItemCell.iconView.image = SVGKImage(contentsOf: urlPath)
      cell = shopItemCell
    } else if indexPath.section == 1 {
      let achivementCell = collectionView.dequeueReusableCell(withReuseIdentifier: AchievementCell.identifier, for: indexPath) as! AchievementCell
      achivementCell.card.mainColor = colors[indexPath.item]
      let urlPath = Bundle.main.url(forResource: icons2[indexPath.item], withExtension: "svg")
      achivementCell.cardIcon.image = SVGKImage(contentsOf: urlPath)
      achivementCell.cardTitleLabel.text = "ICON"
      achivementCell.cardTitleLabel.textAlignment = .center
      achivementCell.cardTitleLabel.textColor = .white
      achivementCell.cardTitleLabel.font = achivementCell.cardTitleLabel.font.withSize(15)
      cell = achivementCell
    }
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    var size = CGSize.zero
    if indexPath.section == 0 {
      size = CGSize(width: collectionView.frame.width - 30, height: 180)
    } else if indexPath.section == 1 {
      size = CGSize(width: collectionView.frame.width - 30, height: 100)
    }
    return size
  }
  
  
}

