//
//  Navigation.swift
//  GGDevelopmentKit
//
//  Created by George Vilnei Arboite Gomes on 28/12/21.
//  Copyright © 2021 George Gomes. All rights reserved.
//

import Foundation

public class Navigation<Destination: Hashable>: Equatable {
    public static func == (lhs: Navigation<Destination>, rhs: Navigation<Destination>) -> Bool {
        return lhs.type == rhs.type
    }
    
    public var type: Destination
    public var info: Any?

    public init(type: Destination, info: Any? = nil) {
        self.type = type
        self.info = info
    }

    public func getInfo<TypeExpected>() -> TypeExpected? {
        info as? TypeExpected
    }
}
