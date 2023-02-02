//
//  CustomTextField.swift
//  ExamSaleHere
//
//  Created by papob boonpat on 2/2/2566 BE.
//

import Foundation
import UIKit
class CustomTextField: UIView {
  
  @IBOutlet private weak var textFieldView: UITextField!
  @IBOutlet private weak var suffixLabel: UILabel!
  
  var placholder = "" {
    didSet {
      textFieldView.attributedPlaceholder = NSAttributedString(
        string: placholder,
        attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.431372549, green: 0.431372549, blue: 0.431372549, alpha: 1)]
      )
    }
  }
  
  var suffix = "" {
    didSet {
      suffixLabel.text = suffix
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
}
