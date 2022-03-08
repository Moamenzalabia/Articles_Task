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
    
    func roundedFromSide(corners: UIRectCorner, cornerRadius: Double) {
        let size = CGSize(width: cornerRadius, height: cornerRadius)
        let bezierPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: size)
        let shapeLayer = CAShapeLayer()
        shapeLayer.frame = self.bounds
        shapeLayer.path = bezierPath.cgPath
        self.layer.mask = shapeLayer
    }
}

extension UIView {
    /**
    Load the view from a nib file

    - Parameter bundle: The bundle where the class is located
    - Parameter nibName: The name of the nib file, this is the class name by default

    - Note: When using the default nibName value, the nib file name **must** be the same as the class name.
    */
    public class func loadXib<T: UIView>(bundle: Bundle = Bundle.main, nibName: String = String("\(T.self)")) -> T? {
        return bundle.loadNibNamed(nibName, owner: self, options: nil)?.first as? T
    }
}
