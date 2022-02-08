//
//  ViewCoded.swift
//  GGDevelopmentKit
//
//  Created by George Vilnei Arboite Gomes on 19/01/22.
//  Copyright © 2022 George Gomes. All rights reserved.
//

public protocol ViewCoded {
    func setupViews()
    func setupViewConfigs()
    func setupConstraints()
}

public extension ViewCoded {
    func setupLayout() {
        setupViews()
        setupViewConfigs()
        setupConstraints()
    }
}
