//
//  GoalsView.swift
//  ExamSaleHere
//
//  Created by papob boonpat on 1/2/2566 BE.
//

import Foundation
import UIKit

class GoalsView: UIView {
  @IBOutlet private weak var collectionView: UICollectionView!
  
  var dataSource: [Goal] = []
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
    collectionView.register(UINib(nibName: "GoalCell", bundle: nil), forCellWithReuseIdentifier: "Goal")
  }
  
  func setupGoals(dataSource: [Goal]) {
    self.dataSource = dataSource
    collectionView.reloadData()
  }
}

extension GoalsView: UICollectionViewDelegate, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return dataSource.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Goal", for: indexPath) as? GoalCell else {
      return UICollectionViewCell()
    }
    cell.setupCell(data: dataSource[indexPath.row])
    return cell
  }
}
