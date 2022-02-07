//
//  GGSimpleBarChart.swift
//  GGDevelopmentKit
//
//  Created by George Vilnei Arboite Gomes on 19/01/22.
//  Copyright © 2022 George Gomes. All rights reserved.
//

import UIKit

public class GGSimpleBarChart: UIView, ViewCoded {
    
    private let font = UIFont(name: "GillSans-Semibold", size: 16)
    
    private(set) var nameLabel = UILabel(frame: .zero)
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
    public func setup(nameStatus: String? = nil, value: Int, from: Int, baseColor: UIColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), chartColor: UIColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)) {
        
        baseBar.backgroundColor = baseColor
        chartBar.backgroundColor = chartColor
        nameLabel.text = nameStatus
        
        let baseValue: CGFloat = from == 0 ? 1 : CGFloat(value)
        let maxValue: CGFloat = from == 0 ? 1 : CGFloat(from)
        let percentage = (baseValue * 100) / maxValue / 100

        NSLayoutConstraint(item: self.chartBar,
                       attribute: NSLayoutConstraint.Attribute.trailing,
                       relatedBy: NSLayoutConstraint.Relation.equal,
                       toItem: self.baseBar,
                       attribute: NSLayoutConstraint.Attribute.trailing,
                       multiplier: percentage,
                       constant: -1).isActive = true
    }
        
    // MARK: - Setup layout
    public func setupViews() {
        addSubview(baseBar)
        addSubview(nameLabel)
        baseBar.addSubview(chartBar)
    }
    
    public func setupViewConfigs() {
        baseBar.layer.cornerRadius = 5
        baseBar.layer.masksToBounds = true
        
        chartBar.layer.cornerRadius = 5
        chartBar.layer.masksToBounds = true
        
        nameLabel.textAlignment = .right
        nameLabel.font = font
        nameLabel.numberOfLines = 2
        nameLabel.textColor = .white
    }
    
    public func setupConstraints() {
        
        nameLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        nameLabel.widthAnchor.constraint(equalTo: baseBar.widthAnchor, multiplier: 0.3).isActive = true
        nameLabel.translatesAutoresizingMaskIntoConstraints = false

        baseBar.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        baseBar.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        baseBar.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 12).isActive = true
        baseBar.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        baseBar.translatesAutoresizingMaskIntoConstraints = false
       
        chartBar.topAnchor.constraint(equalTo: baseBar.topAnchor).isActive = true
        chartBar.bottomAnchor.constraint(equalTo: baseBar.bottomAnchor).isActive = true
        chartBar.leadingAnchor.constraint(equalTo: baseBar.leadingAnchor).isActive = true
        chartBar.translatesAutoresizingMaskIntoConstraints = false
    }
}
