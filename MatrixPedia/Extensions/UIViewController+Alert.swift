//
//  UIViewControllerExtension.swift
//  MatrixPedia
//
//  Created by Alexandre on 22/11/18.
//  Copyright © 2018 Alexandre. All rights reserved.
//

import UIKit

protocol Alertable { }
extension Alertable where Self: UIViewController {
    
    func showAlert(title: String, message: String) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .cancel) { _ in }
        alertController.addAction(okAction)
        
        DispatchQueue.main.async {
            self.view?.window?.rootViewController?.present(alertController, animated: true, completion: nil)
        }
    }
    
    func showAlertWithSettings(title: String, message: String) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .cancel) { _ in }
        alertController.addAction(okAction)
        
        let settingsAction = UIAlertAction(title: "Settings", style: .default) { _ in
            guard let url = NSURL(string: UIApplication.openSettingsURLString) else { return }
            UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
            //deprecated: UIApplication.shared.openURL(url as URL)
        }
        alertController.addAction(settingsAction)
        
        DispatchQueue.main.async {
            self.view?.window?.rootViewController?.present(alertController, animated: true, completion: nil)
        }
    }
}
