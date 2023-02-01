//
//  ViewNib.swift
//  ExamSaleHere
//
//  Created by papob boonpat on 1/2/2566 BE.
//
import UIKit

public extension UIView {

  func loadXib() {
    let view = loadViewFromNib()
    view.frame = bounds
    view.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth, UIView.AutoresizingMask.flexibleHeight]
    addSubview(view)
  }

  fileprivate func loadViewFromNib() -> UIView {
    let bundle = Bundle(for: type(of: self))
    let nib = UINib(nibName: getNibName(), bundle: bundle)
    if let view = nib.instantiate(withOwner: self, options: nil).first as? UIView {
      return view
    }
    return UIView()
  }

  fileprivate func getNibName() -> String {
    return type(of: self).description().components(separatedBy: ".").last ?? ""
  }
}
