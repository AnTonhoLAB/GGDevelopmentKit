//
//  Rx+UICollectionView.swift
//  GGDevelopmentKit
//
//  Created by George Vilnei Arboite Gomes on 12/01/22.
//  Copyright © 2022 George Gomes. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

extension Reactive where Base: UICollectionView {
    
    public var willDisplayCellIndex: ControlEvent<IndexPath> {
        let source: Observable<IndexPath> = self.delegate.methodInvoked(#selector(UICollectionViewDelegate.collectionView(_:willDisplay:forItemAt:)))
            .map { index in
                return  try castOrThrow(IndexPath.self, index[2])
            }

        return ControlEvent(events: source)
    }
    
    public var willDisplayLastCell: ControlEvent<Bool> {
        let source: Observable<Bool> = self.delegate.methodInvoked(#selector(UICollectionViewDelegate.collectionView(_:willDisplay:forItemAt:)))
            .map { index in
                
                let collection = try castOrThrow(UICollectionView.self, index[0])
                let sections = collection.numberOfSections
                let ammoutInLastSection = collection.numberOfItems(inSection: sections - 1)
                let lastIndexPath = IndexPath(row: ammoutInLastSection - 1, section: sections - 1)
                let currentIndexPath =  try castOrThrow(IndexPath.self, index[2])
                return  lastIndexPath == currentIndexPath
            }

        return ControlEvent(events: source)
    }
    
    func castOrThrow<T>(_ resultType: T.Type, _ object: Any) throws -> T {
        guard let returnValue = object as? T else {
            throw RxCocoaError.castingError(object: object, targetType: resultType)
        }

        return returnValue
    }
}
