//
//  CustomPickerView.swift
//  ExamSaleHere
//
//  Created by papob boonpat on 2/2/2566 BE.
//

import Foundation
import UIKit

class CustomPickerView: UIView {
  
  @IBOutlet private weak var placeholderLabel: UILabel!
  
  var placholder = "" {
    didSet {
      placeholderLabel.text = placholder
    }
  }

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
    layer.borderWidth = 1
    layer.borderColor = #colorLiteral(red: 0.884755075, green: 0.3822283149, blue: 0.2431488931, alpha: 1).cgColor
  }
  
  @IBAction func pickerPressed(_ sender: Any) {
    print("Show Picker")
  }
}
