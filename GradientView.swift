//
//  GradientView.swift
//  AppStore
//
//  Created by Isaac Ballas on 2019-10-17.
//  Copyright © 2019 Isaacballas. All rights reserved.
//

import UIKit

class GradientView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.clear
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        backgroundColor = UIColor.clear
    }
    
    override func draw(_ rect: CGRect) {
        // Create gradient color stops
         // First Color: BLACK: 0,0,0,0.3 Second Color: 0,0,0,0.7 sits at locale 1 (100%)
        let components: [CGFloat] = [0,0,0,0.3,0,0,0,0.7]
        let locations: [CGFloat] = [0,1]
        // Create the gradient
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let gradient = CGGradient(colorSpace: colorSpace, colorComponents: components, locations: locations, count: 2)
        // Figure out how big the drawing needs to be. midX and midY is center point of rectangle, which is given by the bounds. (iPhone size)
        let x = bounds.midX
        let y = bounds.midY
        let centerPoint = CGPoint(x: x, y: y)
        let radius = max(x,y)
        // Draw the gradient
        let context = UIGraphicsGetCurrentContext()
        context?.drawRadialGradient(gradient!, startCenter: centerPoint, startRadius: 0, endCenter: centerPoint, endRadius: radius, options: .drawsAfterEndLocation)
    }

}
