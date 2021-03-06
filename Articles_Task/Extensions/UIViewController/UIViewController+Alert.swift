//
//  UIViewController+Alert.swift
//  Articles_Task
//
//  Created by Moamen Abd Elgawad on 07/03/2022.
//

import UIKit

extension UIViewController {
    /**
     Show UIAlertController
     - Parameter title: Alert string title text.
     - Parameter message: Alert string message text.
     - Parameter actionTitle: Alert string action title text.
     - Parameter actionBlock: Alert callBack actionBlock.
     */
    func showDefaultAlert(title: String?, message: String?, actionTitle: String?, actionBlock: (() -> Void)? = nil) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            
            let action = UIAlertAction(title: actionTitle, style: .default) { _ in
                alertController.dismiss(animated: true)
                actionBlock?()
            }
            
            alertController.addAction(action)
            self.present(alertController, animated: true)
        }
    }
}
