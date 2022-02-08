//
//  GGAlertView.swift
//  GGDevelopmentKit
//
//  Created by George Vilnei Arboite Gomes on 07/02/22.
//  Copyright © 2022 George Gomes. All rights reserved.
//
import UIKit

public final class GGAllertView: UIView, ViewCoded {
    
    private let titleFont = UIFont(name: "GillSans-Semibold", size: 18)
    
    private(set) var titleLabel = UILabel(frame: .zero)
    private(set) var descriptionLabel = UILabel(frame: .zero)
    private(set) var actions: [GGAlertAction] = .init() {
        didSet {
            setup(actions: actions)
        }
    }
    
    private let stackActions: UIStackView = {
        $0.axis = .horizontal
        $0.distribution = .fillEqually
        return $0
    }(UIStackView())
    
    // MARK: - Initializers
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.clipsToBounds = true
        setupLayout()
    }
    
    public convenience init(title: String?, message: String?) {
        self.init(frame: .zero)
        self.titleLabel.text = title
        self.descriptionLabel.text = message
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    // MARK: - Public funcitions
    func addAction(_ action: GGAlertAction) {
        self.actions.append(action)
    }
    
    private func setup(actions: [GGAlertAction]) {
        stackActions.subviews.forEach { (view) in
            view.removeFromSuperview()
        }
        
        if actions.count > 2 {
            stackActions.axis = .vertical
        }
    
        for action in actions {
            let button = GGButton(type: .system)
            
            button.setTitle(action.title, for: .normal)
            button.heightAnchor.constraint(equalToConstant: 45).isActive = true
            button.translatesAutoresizingMaskIntoConstraints = false

            let actionToDo: (UIAction) -> Void = { _ in
                if let ggAction = action.action {
                    ggAction(action)
                }
                self.removeAllert()
            }
            
            button.addAction(UIAction(handler: actionToDo), for: .touchUpInside)
            stackActions.addArrangedSubview(button)
        }
    }
    
    private func removeAllert() {
        self.removeFromSuperview()
    }
    
    // MARK: - Setup layout
    public func setupViews() {
        
        self.backgroundColor = .systemGray5
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(stackActions)
    }
    
    public func setupViewConfigs() {
        layer.cornerRadius = 15
        titleLabel.textAlignment = .center
        titleLabel.font = titleFont
        
        descriptionLabel.textAlignment = .center
        descriptionLabel.numberOfLines = 0
    }
    
    public func setupConstraints() {
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 14).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 14).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        descriptionLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 30).isActive = true
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        stackActions.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 14).isActive = true
        stackActions.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        stackActions.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        stackActions.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        stackActions.translatesAutoresizingMaskIntoConstraints = false
    }
}
