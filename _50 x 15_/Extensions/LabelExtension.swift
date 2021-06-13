//
//  LabelExtension.swift
//  _50 x 15_
//
//  Created by Miguel Alarcon on 12/6/21.
//

import UIKit

extension UILabel {
    func flashLabel(numberOfFlashes: Float) {
               let flash = CABasicAnimation(keyPath: "opacity")
               flash.duration = 0.4
               flash.fromValue = 1
        flash.toValue = 0.4
               flash.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
               flash.autoreverses = true
               flash.repeatCount = numberOfFlashes
               layer.add(flash, forKey: nil)
           }
}
