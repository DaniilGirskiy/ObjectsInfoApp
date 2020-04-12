//
//  TopView.swift
//  AVSOFT
//
//  Created by Danya on 07.04.2020.
//  Copyright © 2020 Daniil Girskiy. All rights reserved.
//

import UIKit

class TopView: UIView {
    
     // MARK: - Subviews
    
    let shapeLayer = CAShapeLayer()
    let trackLayer = CAShapeLayer()
    
    // MARK: - Override

    override func layoutSubviews() {
        super.layoutSubviews()
        
        configureLayer()
    }
    
    func animate(start: CGFloat) {
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.fromValue = start
        basicAnimation.byValue = 0.5
        basicAnimation.duration = 2

        basicAnimation.fillMode = .forwards
        basicAnimation.isRemovedOnCompletion = false

        shapeLayer.add(basicAnimation, forKey: "urSoBasic")
    }
    
    func reset() {
        shapeLayer.removeAllAnimations()
//        shapeLayer.fillColor = UIColor.red.cgColor
    }
    
    // MARK: - Setup
    
    private func configureLayer() {
       
        let center = CGPoint(x: self.center.x, y: self.center.y)
        
        let circularPath = UIBezierPath(arcCenter: .zero,
                                        radius: bounds.height / 3,
                                        startAngle: 0,
                                        endAngle: 2 * CGFloat.pi,
                                        clockwise: true)
        trackLayer.path = circularPath.cgPath
        trackLayer.position = center
        trackLayer.strokeColor = UIColor.darkGray.cgColor
        trackLayer.lineWidth = 10
        trackLayer.fillColor = UIColor.clear.cgColor
        
        layer.addSublayer(trackLayer)
        
        
        shapeLayer.path = circularPath.cgPath
        shapeLayer.position = center
        shapeLayer.strokeColor = UIColor.orange.cgColor
        shapeLayer.lineWidth = 10
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineCap = .round

        shapeLayer.transform = CATransform3DMakeRotation(-CGFloat.pi / 2, 0, 0, 1)
        shapeLayer.strokeEnd = 0

        layer.addSublayer(shapeLayer)
    }
}

