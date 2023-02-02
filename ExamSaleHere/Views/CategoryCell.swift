//
//  CategoriesCell.swift
//  ExamSaleHere
//
//  Created by papob boonpat on 2/2/2566 BE.
//

import Foundation
import UIKit

class CategoryCell: UICollectionViewCell {
  @IBOutlet private weak var imageView: UIImageView!
  @IBOutlet private weak var nameLabel: UILabel!
  
  func setupCell(data: Category) {
    if data.image !== nil {
      imageView.image = data.image
    }
    nameLabel.text = data.name
  }
}
