//
//  UIImageView+Extensions.swift
//  Articles_Task
//
//  Created by Moamen Abd Elgawad on 08/03/2022.
//

import UIKit
import SDWebImage
let NoImageName = "no image"

extension UIImageView{
    
    /**
     Set URL Downloaded Image
     - Parameter imageUrl: Image URL
     */
    public func setImage(imageUrl: String){
        self.sd_setImage(with: URL(string: imageUrl), placeholderImage: UIImage.init(named: NoImageName), options: .continueInBackground) { (imagee, _,_ , _) in
            if let img = imagee{
                self.image = img
            }else{
                self.image = UIImage.init(named: NoImageName)
            }
        }
    }
}
