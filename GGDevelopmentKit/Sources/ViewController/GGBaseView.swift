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

public extension UIView {
    static private let loadingTag = 2456
    
    func showLoading() {
        let wallView = UIView.init(frame: bounds)
        wallView.tag = UIView.loadingTag
        wallView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        
        var indicator: UIActivityIndicatorView
        if #available(iOS 13.0, *) {
            indicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
        } else {
            indicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.whiteLarge)
        }
        indicator.startAnimating()
        indicator.center = wallView.center

        DispatchQueue.main.async {
            wallView.addSubview(indicator)
            self.addSubview(wallView)
        }
    }
    
    func removeLoading() {
        DispatchQueue.main.async {
            self.subviews.filter({$0.tag == UIView.loadingTag}).forEach({$0.removeFromSuperview()})
        }
    }
}

