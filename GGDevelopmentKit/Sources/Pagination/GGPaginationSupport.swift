//
//  GGPaginationSupport.swift
//  GGDevelopmentKit
//
//  Created by George Vilnei Arboite Gomes on 10/01/22.
//  Copyright © 2022 George Gomes. All rights reserved.
//

import Foundation
import RxSwift

public final class GGPaginationSupport {
    
    // MARK: - Public variables
    public var size: Int = 0
    public var isLast = false
    public let limit: Int
    public var offSet = 0
    public var isLoading = false
    private var countData: Int = 0

    // MARK: - Initializers
    public init(limit: Int = 20, offSet: Int = 0) {
        self.limit = limit
        self.offSet = offSet
    }

    // MARK: - Public methods
    public func needCall(reload: Bool = false) -> Bool {
        if reload {
            self.reload()
        }
        return !isLoading && !isLast
    }

    //* Use only one time per requets */
    public func validateIsLast(count: Int) {
        isLast = count >= size
        offSet += limit
        isLoading = false
        countData += count
    }

    public func reload() {
        countData = 0
        offSet = 0
        isLast = false
    }

    public func startLoading() {
        isLoading = true
        isLast = false
    }

    public func isLoadingCell(row: Int) -> Bool {
        let anotherCells =  1 // Loading
        return isLoading ? row == (countCells() - anotherCells): false
    }

    public func countCells() -> Int {
        let hasLoadingCell = isLoading ? 1 : 0
        return  countData + hasLoadingCell
    }
}
