//
//  UITableView+Extensions.swift
//  Articles_Task
//
//  Created by Moamen Abd Elgawad on 07/03/2022.
//

import UIKit

extension UITableView {
    
    /**
     Register UITableViewCell from a nib file
     - Parameter cellClass: The UITableViewCell Class.self
     - Note: When using the default nibName value, the nib file name **must** be the same as the class name.
     */
    func registerCellNib<Cell: UITableViewCell>(cellClass: Cell.Type){
        self.register(UINib(nibName: String(describing: Cell.self), bundle: nil),
                      forCellReuseIdentifier: String(describing: Cell.self))
    }
    
    /**
     Dequeue UITableViewCell and return UITableViewCell can you cast for your UITableViewCell
     */
    func dequeue<Cell: UITableViewCell>() -> Cell{
        let identifier = String(describing: Cell.self)
        
        guard let cell = self.dequeueReusableCell(withIdentifier: identifier) as? Cell else {
            fatalError("Error in cell") // this line for me as adevloper no a user to help me to know where is a problem becuse it block my code in this line to help me to detecte where is a problem
        }
        return cell
    }
}
