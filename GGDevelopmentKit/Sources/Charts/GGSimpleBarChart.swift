//
//  GGSimpleBarChart.swift
//  GGDevelopmentKit
//
//  Created by George Vilnei Arboite Gomes on 19/01/22.
//  Copyright © 2022 George Gomes. All rights reserved.
//

import UIKit

public class GGSimpleBarChart: UIView, ViewCoded {
    
    private(set) var baseBar = UIView(frame: .zero)
    private(set) var chartBar = UIView(frame: .zero)
    
    // MARK: - Initializers
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    // MARK: - Public funcitions
    public func setup(value: Int, from: Int) {
        
        let baseValue: CGFloat = CGFloat(value)
        let maxValue: CGFloat = from == 0 ? 1 : CGFloat(from)
        let percentage = (baseValue * 100) / maxValue / 100

        UIView.animate(withDuration: 1) { [self] in
            NSLayoutConstraint(item: self.chartBar,
                           attribute: NSLayoutConstraint.Attribute.trailing,
                           relatedBy: NSLayoutConstraint.Relation.equal,
                           toItem: self.baseBar,
                           attribute: NSLayoutConstraint.Attribute.trailing,
                           multiplier: percentage,
                           constant: -1).isActive = true
        }
    }
        
    // MARK: - Setup layout
    public func setupViews() {
        addSubview(baseBar)
        baseBar.addSubview(chartBar)
    }
    
    public func setupViewConfigs() {
        baseBar.layer.cornerRadius = 5
        baseBar.layer.masksToBounds = true
        baseBar.backgroundColor = .brown
        
        chartBar.layer.cornerRadius = 5
        chartBar.layer.masksToBounds = true
        chartBar.backgroundColor = .blue
    }
    
    public func setupConstraints() {
        baseBar.topAnchor.constraint(equalTo: topAnchor).isActive = true
        baseBar.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        baseBar.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        baseBar.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        baseBar.translatesAutoresizingMaskIntoConstraints = false
       
        chartBar.topAnchor.constraint(equalTo: baseBar.topAnchor).isActive = true
        chartBar.bottomAnchor.constraint(equalTo: baseBar.bottomAnchor).isActive = true
        chartBar.leadingAnchor.constraint(equalTo: baseBar.leadingAnchor).isActive = true
        chartBar.translatesAutoresizingMaskIntoConstraints = false
    }
}
