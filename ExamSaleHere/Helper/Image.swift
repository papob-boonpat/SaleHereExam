//
//  Image.swift
//  ExamSaleHere
//
//  Created by papob boonpat on 2/2/2566 BE.
//

import Foundation
import UIKit
extension UIImageView {
    func load(url: URL?) {
      guard let _url = url else {return}
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: _url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
