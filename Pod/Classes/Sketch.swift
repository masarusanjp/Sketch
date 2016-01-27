//
//  Sketch.swift
//  DripTimer
//
//  Created by Masaru Ichikawa on 2016/01/24.
//  Copyright © 2016年 masaichi. All rights reserved.
//

import Foundation
import UIKit
import QuartzCore

public class Sketch {
    public class Canvas {
        public let context: CGContextRef
        public init(context: CGContextRef) {
            self.context = context
        }
        
        public func fill(color: UIColor?) {
            if let color = color {
                CGContextSetFillColorWithColor(context, color.CGColor)
            }
        }
        
        public func stroke(color: UIColor?) {
            if let color = color {
                CGContextSetStrokeColorWithColor(context, color.CGColor)
            }
        }
        
        public func lineWidth(width: Double) {
            CGContextSetLineWidth(context, CGFloat(width))
        }

        public func circle(r: Float) {
            let radius = CGFloat(r)
            CGContextAddArc(context, radius, radius, radius, 0, CGFloat(2 * M_PI), 0)
            CGContextFillPath(context)
            CGContextStrokePath(context)
        }
    }
    
    public static func draw(size: CGSize, f:(Canvas -> Void) ) -> UIImage? {
        UIGraphicsBeginImageContext(size)
        if let context = UIGraphicsGetCurrentContext() {
            let canvas = Canvas(context: context)
            f(canvas)
        } else {
            UIGraphicsEndImageContext()
            return nil
        }
        let resultImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return resultImage
    }
}
