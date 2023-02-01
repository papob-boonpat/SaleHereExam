//
//  Goal.swift
//  ExamSaleHere
//
//  Created by papob boonpat on 2/2/2566 BE.
//

import Foundation
import UIKit
struct Goal {
  let expect: Int
  let current: Int
  let goodState: Bool
  let daysLeft: Int
  let title: String
  let image: UIImage?
  
  init(expect: Int, current: Int, goodState: Bool, daysLeft: Int, title: String, image: UIImage?) {
    self.expect = expect
    self.current = current
    self.goodState = goodState
    self.daysLeft = daysLeft
    self.title = title
    self.image = image
  }
}
