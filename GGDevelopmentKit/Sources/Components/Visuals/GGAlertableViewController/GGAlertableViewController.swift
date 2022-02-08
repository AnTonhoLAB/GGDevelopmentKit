//
//  GGBaseView.swift
//  GGDevelopmentKit
//
//  Created by George Vilnei Arboite Gomes on 27/01/22.
//  Copyright © 2022 George Gomes. All rights reserved.
//

import Foundation
import UIKit

public protocol GGAlertableViewController where Self: UIViewController {
    
}

public extension GGAlertableViewController {
    static private var alertTag: Int {
        2457
    }
    
    func alertSimpleMessage(message: String, buttonTitle: String = "ok") {
        let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: buttonTitle, style: .default, handler: nil)
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
    }
    
    func alertSimpleMessage(title: String? = nil, message: String, buttonTitle: String = "ok", action: (@escaping (UIAlertAction) -> Void)) {
        DispatchQueue.main.async(execute: {
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let action = UIAlertAction(title: buttonTitle, style: .default, handler: action)
            alertController.addAction(action)
            alertController.addAction(action)
            self.present(alertController, animated: true, completion: nil)
        })
    }
    
    func displayWarningInView(title: String, message: String?, buttonTitle: String, action: ((GGAlertAction) -> Void)?) {
        
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            // Wall View
            let wallView = UIView(frame: .zero)
            wallView.tag = Self.alertTag
            wallView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
            

            
            // GGAlertView
            let ggAlertView = GGAllertView(title: title, message: message)
            
            let actionInAlert: (GGAlertAction) -> Void = { ggAlert in
                if let action = action {
                    action(ggAlert)
                }
                wallView.removeFromSuperview()
            }
            
            let action = GGAlertAction(title: buttonTitle, action: actionInAlert)
            ggAlertView.addAction(action)
            
            // Setup views
            self.view.addSubview(wallView)
            wallView.addSubview(ggAlertView)
            
            // Constraints
            wallView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
            wallView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
            wallView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
            wallView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
            wallView.translatesAutoresizingMaskIntoConstraints = false
            
            ggAlertView.centerYAnchor.constraint(equalTo: wallView.centerYAnchor).isActive = true
            ggAlertView.centerXAnchor.constraint(equalTo: wallView.centerXAnchor).isActive = true
            
            ggAlertView.widthAnchor.constraint(equalTo: wallView.widthAnchor, multiplier: 0.63).isActive = true
            ggAlertView.translatesAutoresizingMaskIntoConstraints = false
        }
    }
}
