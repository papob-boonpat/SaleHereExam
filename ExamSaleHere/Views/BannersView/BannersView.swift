//
//  BannersView.swift
//  ExamSaleHere
//
//  Created by papob boonpat on 2/2/2566 BE.
//

import Foundation
import UIKit

class BannersView: UIView {
  @IBOutlet private weak var collectionView: UICollectionView!
  @IBOutlet private weak var title: UILabel!
  
  var dataSource: [String] = []
  override init(frame: CGRect) {
    super.init(frame: frame)
    commonInit()
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    commonInit()
  }
  
  func commonInit() {
    loadXib()
    collectionView.delegate = self
    collectionView.dataSource = self
    collectionView.register(BannerCell.self, forCellWithReuseIdentifier: "Banner")
  }
  
  func setupBanners(dataSource: [String], title: String) {
    self.dataSource = dataSource
    self.title.text = title
    collectionView.reloadData()
  }
}

extension BannersView: UICollectionViewDelegate, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return dataSource.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Banner", for: indexPath) as? BannerCell else {
      return UICollectionViewCell()
    }
    cell.setupImage(image: dataSource[indexPath.row])
    return cell
  }
}
