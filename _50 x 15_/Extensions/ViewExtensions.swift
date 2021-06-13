//
//  ViewExtensions.swift
//  _50 x 15_
//
//  Created by Miguel Alarcon on 9/6/21.
//

import UIKit

extension UIView {
    func roundedView(value: Int) {
        self.layer.cornerRadius = CGFloat(value)
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize.zero
        self.clipsToBounds = true
    }
    
    func borderColor(value: Int, color: UIColor) {
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = CGFloat(value)
    }
    
    func flashView( numberOfFlashes: Float) {
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
