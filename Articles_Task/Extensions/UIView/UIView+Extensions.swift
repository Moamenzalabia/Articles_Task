//
//  UIView+Extensions.swift
//  Articles_Task
//
//  Created by Moamen Abd Elgawad on 08/03/2022.
//

import UIKit

extension UIView{
    
    func addShadowWith(shadowColor: UIColor = UIColor.black, shadowOffset: CGSize = CGSize(width: 0, height: 0), shadowRadius: CGFloat = 5, shadowOpacity: Float = 0.2) {
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowOffset = shadowOffset
        self.layer.shadowRadius = shadowRadius
        self.layer.shadowOpacity = shadowOpacity
    }
    
    func addCornerRadius(_ radius: CGFloat = 6) {
        if radius == 0 {
            self.layer.cornerRadius = self.frame.size.height / 2
        } else {
            self.layer.cornerRadius = radius
        }
    }
    
    func addBorderWith(width: CGFloat, color: UIColor) {
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
    }
    
}
