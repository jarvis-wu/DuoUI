//
//  ViewController.swift
//  DuoUI
//
//  Created by Jarvis Wu on 2/14/20.
//  Copyright © 2020 Jarvis Wu. All rights reserved.
//

import UIKit
import SVGKit

class ViewController: UIViewController {
  
  // Dummy data
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
    bottomView.topToBottom(of: duolingoButton, offset: -80)
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
    let headerTitle = DuolingoTitleLabel()
    headerTitle.text = "DuoUI"
    headerTitle.textColor = UIColor.lightGray
    headerView.addSubview(headerTitle)
    headerTitle.centerXToSuperview()
    headerTitle.bottomToSuperview(offset: -20)
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
      shopItemCell.label.text = "This is a tiny title label representing a purchasable item in the shop."
      shopItemCell.priceLabel.text = "999"
      cell = shopItemCell
    } else if indexPath.section == 1 {
      let achivementCell = collectionView.dequeueReusableCell(withReuseIdentifier: AchievementCell.identifier, for: indexPath) as! AchievementCell
      achivementCell.card.mainColor = colors[indexPath.item]
      let urlPath = Bundle.main.url(forResource: icons2[indexPath.item], withExtension: "svg")
      achivementCell.cardIcon.image = SVGKImage(contentsOf: urlPath)
      achivementCell.cardTitleLabel.text = "icon".uppercased()
      achivementCell.cardTitleLabel.textAlignment = .center
      achivementCell.cardTitleLabel.textColor = .white
      achivementCell.cardTitleLabel.font = achivementCell.cardTitleLabel.font.withSize(15)
      achivementCell.label.font = achivementCell.label.font.withSize(17)
      cell = achivementCell
    }
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    var size = CGSize.zero
    if indexPath.section == 0 {
      size = CGSize(width: collectionView.frame.width - 30, height: 170)
    } else if indexPath.section == 1 {
      size = CGSize(width: collectionView.frame.width - 30, height: 100)
    }
    return size
  }
  
  
}

