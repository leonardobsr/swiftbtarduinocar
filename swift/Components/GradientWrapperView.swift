//
//  GradientWrapperView.swift
//  BarberShop
//
//  Created by Adriano Ramos on 02/11/19.
//  Copyright © 2019 Adriano Ramos. All rights reserved.
//

import UIKit

class GradientWrapperView: UIView {
    
    private let gradientLayer: CAGradientLayer = {
        let layer = CAGradientLayer()
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = CGFloat(0.5)
        return layer
    }()
    
    override func draw(_ rect: CGRect) {
        self.layer.addSublayer(gradientLayer)
        gradientLayer.frame = self.bounds
        gradientLayer.startPoint = self.startPoint
        gradientLayer.endPoint = self.endPoint
        gradientLayer.colors = self.colors
        gradientLayer.type = self.type
    }
    
    public var colors: [CGColor] = [UIColor.black.cgColor, UIColor.white.cgColor] {
        didSet{
            self.gradientLayer.colors = self.colors
        }
    }
    
    public var startPoint: CGPoint = CGPoint(x: 0, y: 0) {
        didSet {
            self.gradientLayer.startPoint = startPoint
        }
    }
    
    public var endPoint: CGPoint = CGPoint(x: 1, y: 0) {
        didSet{
            self.gradientLayer.endPoint = self.endPoint
        }
    }
    
    public var type: CAGradientLayerType = .axial {
        didSet {
            gradientLayer.type = self.type
        }
    }
    
}
