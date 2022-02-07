//
//  GGButton.swift
//  GGDevelopmentKit
//
//  Created by George Vilnei Arboite Gomes on 07/02/22.
//  Copyright © 2022 George Gomes. All rights reserved.
//

import UIKit

class GGButton: UIButton {

    private var text: String = "" {
       didSet{
        setText()
       }
    }

    var hightlightedColor : UIColor = .systemGray4

    var background: UIColor = .systemGray5 {
        didSet{
            self.backgroundColor = background
        }
    }

    override var isHighlighted: Bool {
        didSet {
            self.backgroundColor = self.isHighlighted ? hightlightedColor : background
        }
    }

    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        sharedLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        sharedLayout()
    }

   // MARK: - Method
    private func setText() {
        self.setTitle(text, for: .normal)
    }

    private func sharedLayout() {
        self.setTitle(text, for: .normal)
        self.backgroundColor = self.isHighlighted ? .green : background
    }
}
