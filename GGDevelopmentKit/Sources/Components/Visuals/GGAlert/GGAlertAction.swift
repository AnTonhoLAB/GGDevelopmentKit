//
//  GGAlertAction.swift
//  GGDevelopmentKit
//
//  Created by George Vilnei Arboite Gomes on 07/02/22.
//  Copyright © 2022 George Gomes. All rights reserved.
//

import Foundation

public final class GGAlertAction {
    var title: String
    var action: ((GGAlertAction) -> Void)?
    
    init(title: String, action: ((GGAlertAction) -> Void)? = nil) {
        self.title = title
        self.action = action
    }
}
