//
//  Double+Ext.swift
//  GGDevelopmentKit
//
//  Created by George Vilnei Arboite Gomes on 19/01/22.
//  Copyright © 2022 George Gomes. All rights reserved.
//

import Foundation

extension Double {
    var stringWithoutZeroFraction: String {
        return truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}
