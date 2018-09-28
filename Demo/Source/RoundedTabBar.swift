//
//  RoundedTabBar.swift
//  Demo
//
//  Created by Noah Hilt on 9/28/18.
//  Copyright © 2018 Melted. All rights reserved.
//

import UIKit

final class RoundedTabBar: UIView {
    var topRadius: CGFloat = 10 {
        didSet {
            updatePath()
        }
    }
    
    var bottomRadius: CGFloat = 38.5 {
        didSet {
            updatePath()
        }
    }

    private var path: UIBezierPath?
    
    init() {
        super.init(frame: .zero)
        
        isOpaque = false
        layer.shadowOffset = CGSize(width: 0, height: 8)
        layer.shadowRadius = 8
        layer.shadowOpacity = 0.2
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        updatePath()
    }
    
    override func draw(_ rect: CGRect) {
        guard let path = path,
              let context = UIGraphicsGetCurrentContext() else {
            return
        }
        
        context.clear(rect)
        UIColor.white.setFill()
        path.fill()
    }
    
    private func updatePath() {
        let path = UIBezierPath.continuousRoundedRect(bounds, cornerRadius: (topLeft: topRadius, topRight: topRadius, bottomLeft: bottomRadius, bottomRight: bottomRadius))
        
        layer.shadowPath = path.cgPath
        
        self.path = path
        setNeedsDisplay()
    }
}
