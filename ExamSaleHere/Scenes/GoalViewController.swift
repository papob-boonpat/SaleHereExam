//
//  GoalViewController.swift
//  ExamSaleHere
//
//  Created by papob boonpat on 2/2/2566 BE.
//

import Foundation
import UIKit

class GoalViewController: UIViewController {
  @IBOutlet private weak var headerViewConstraint: NSLayoutConstraint!
  @IBOutlet private weak var collectionView: UICollectionView!
  @IBOutlet private weak var collectionViewConstraint: NSLayoutConstraint!
  @IBOutlet private weak var amountView: CustomTextField!
  @IBOutlet private weak var rateView: CustomTextField!
  @IBOutlet private weak var datePicker: CustomPickerView!
  @IBOutlet private weak var accountPicker: CustomPickerView!
  
  private var contentSizeObservation: NSKeyValueObservation?
  
  let categories = [
    Category(image: UIImage(named: "luggage"), name: "Travel"),
    Category(image: UIImage(named: "cert"), name: "Education"),
    Category(image: UIImage(named: "stock"), name: "Invest"),
    Category(image: UIImage(named: "jacket"), name: "Clothing"),
    Category(image: UIImage(named: "cert"), name: "Education")
  ]
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.isNavigationBarHidden = true
    headerViewConstraint.constant = getSafeAreaTop() + 120
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    collectionView.delegate = self
    collectionView.dataSource = self
    
    contentSizeObservation = collectionView.observe(\.contentSize) { [weak self] _, _ in
      self?.contentSizeObservation = nil
      self?.collectionViewConstraint.constant = self?.collectionView.contentSize.height ?? 0
    }
    
    amountView.placholder = "Amount"
    amountView.suffix = "THB"
    rateView.suffix = "THB / Month"
    datePicker.placholder = "Select Date"
    accountPicker.placholder = "Select Account"
  }
}

extension GoalViewController: UICollectionViewDelegate, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return categories.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Category", for: indexPath) as? CategoryCell else {
      return UICollectionViewCell()
    }
    cell.contentView.layer.borderWidth = 2
    cell.contentView.layer.cornerRadius = 10
    cell.contentView.layer.borderColor = #colorLiteral(red: 0.884755075, green: 0.3822283149, blue: 0.2431488931, alpha: 1).cgColor
    cell.setupCell(data: categories[indexPath.row])
    return cell
  }
}


