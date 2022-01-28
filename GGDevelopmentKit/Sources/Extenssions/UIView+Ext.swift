//
//  UIView+Ext.swift
//  GGDevelopmentKit
//
//  Created by George Vilnei Arboite Gomes on 28/01/22.
//  Copyright © 2022 George Gomes. All rights reserved.
//

import UIKit

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
