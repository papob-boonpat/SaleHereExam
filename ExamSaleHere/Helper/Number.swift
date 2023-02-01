//
//  Number.swift
//  ExamSaleHere
//
//  Created by papob boonpat on 2/2/2566 BE.
//

import Foundation
extension Int {
    private static var numberFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal

        return numberFormatter
    }()

    var delimiter: String {
        return Int.numberFormatter.string(from: NSNumber(value: self)) ?? ""
    }
}
