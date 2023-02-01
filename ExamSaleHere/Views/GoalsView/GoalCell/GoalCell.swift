//
//  GoalCell.swift
//  ExamSaleHere
//
//  Created by papob boonpat on 1/2/2566 BE.
//

import Foundation
import UIKit

class GoalCell: UICollectionViewCell {
  @IBOutlet private weak var containerView: UIView!
  @IBOutlet private weak var progressView: UIProgressView!
  @IBOutlet private weak var imageView: UIImageView!
  @IBOutlet private weak var state: UILabel!
  @IBOutlet private weak var daysLabel: UILabel!
  @IBOutlet private weak var expectLabel: UILabel!
  @IBOutlet private weak var currentLabel: UILabel!
  @IBOutlet private weak var titleLabel: UILabel!
  
  var goodState = false {
    didSet {
      if goodState {
        state.text = "Good"
        state.textColor = UIColor.green
        contentView.backgroundColor = UIColor.green
      } else {
        state.text = "Unhappy"
        state.textColor = UIColor.red
        contentView.backgroundColor = UIColor.red
      }
    }
  }
  
  func setupCell(data: Goal) {
    contentView.layer.cornerRadius = 10
    containerView.layer.cornerRadius = 8
    progressView.layer.cornerRadius = 6
    progressView.clipsToBounds = true
    progressView.progress = Float(data.current) / Float(data.expect)
    goodState = data.goodState
    daysLabel.text = "\(data.daysLeft) days Left"
    titleLabel.text = data.title
    expectLabel.text = "\(data.expect.delimiter) THB"
    currentLabel.text = "\(data.current.delimiter) THB"
    if data.image !== nil {
      imageView.image = data.image
    }
  }
}
