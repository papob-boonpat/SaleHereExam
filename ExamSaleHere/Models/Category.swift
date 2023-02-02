//
//  Category.swift
//  ExamSaleHere
//
//  Created by papob boonpat on 2/2/2566 BE.
//

import Foundation
import UIKit

struct Category {
  let image: UIImage?
  let name: String
  
  init(image: UIImage?, name: String) {
    self.image = image
    self.name = name
  }
}
