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
            self.present(alertController, animated: true, completion: nil)
        })
    }
}

