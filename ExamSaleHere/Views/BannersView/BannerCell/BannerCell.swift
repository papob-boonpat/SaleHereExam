//
//  BannerCell.swift
//  ExamSaleHere
//
//  Created by papob boonpat on 2/2/2566 BE.
//

import Foundation
import UIKit

class BannerCell: UICollectionViewCell {
  
  private let imageView: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFill
    imageView.clipsToBounds = true
    return imageView
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    commonInit()
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    commonInit()
  }
  
  func commonInit() {
    contentView.addSubview(imageView)
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    imageView.frame = contentView.bounds
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    imageView.image = nil
  }
  
  func setupImage(image: String) {
    imageView.load(url: URL(string: image))
  }
}
