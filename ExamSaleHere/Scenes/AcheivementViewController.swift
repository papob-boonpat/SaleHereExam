//
//  AcheivementViewController.swift
//  ExamSaleHere
//
//  Created by papob boonpat on 2/2/2566 BE.
//

import Foundation
import UIKit

class AcheivementViewController: UIViewController {
  @IBOutlet private weak var collectionView: UICollectionView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    collectionView.dataSource = self
    collectionView.delegate = self
  }
  
}

extension AcheivementViewController: UICollectionViewDataSource, UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 13
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Acheivement", for: indexPath)
    cell.contentView.layer.borderWidth = 2
    cell.contentView.layer.borderColor = #colorLiteral(red: 0.884755075, green: 0.3822283149, blue: 0.2431488931, alpha: 1).cgColor
    return cell
  }
}
