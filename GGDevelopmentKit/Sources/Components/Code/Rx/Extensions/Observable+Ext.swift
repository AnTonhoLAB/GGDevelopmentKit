//
//  Observable+Ext.swift
//  GGDevelopmentKit
//
//  Created by George Vilnei Arboite Gomes on 19/01/22.
//  Copyright © 2022 George Gomes. All rights reserved.
//

import Foundation
import RxSwift

extension Observable {

    /**
     Takes a SharedSequence of optional elements and returns a SharedSequence of non-optional elements, filtering out any nil values.

     - returns: A SharedSequence of non-optional elements
     */

    public func unwrap<Result>() -> Observable< Result> where Element == Result? {
        return self.filter { $0 != nil }.map { $0! }
    }
}
