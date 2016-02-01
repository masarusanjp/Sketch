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
            CGContextSetFillColorWithColor(context, color?.CGColor)
        }
        
        public func stroke(color: UIColor?) {
            CGContextSetStrokeColorWithColor(context, color?.CGColor)
        }

        public func lineWidth(width: Double) {
            CGContextSetLineWidth(context, CGFloat(width))
        }

        public func lineDash(dashWidth: Double) {
            let lengths = [CGFloat(dashWidth)]
            CGContextSetLineCap(context, CGLineCap.Round)
            CGContextSetLineDash(context, CGFloat(0.0), lengths, lengths.count)
        }

        public func circle(r: Float) {
            circle(r, origin: CGPointZero)
        }

        public func circle(r: Float, origin: CGPoint) {
            let radius = CGFloat(r)
            CGContextAddArc(context, radius + origin.x, radius + origin.y, radius, 0, CGFloat(2 * M_PI), 0)
            CGContextFillPath(context)
            CGContextStrokePath(context)
        }

        public func rectangle(size: CGSize) {
            rectangle(size, origin: CGPointZero)
        }

        public func rectangle(size: CGSize, origin: CGPoint) {
            CGContextAddRect(context, CGRect(origin: origin, size: size))
            CGContextFillPath(context)
            CGContextStrokePath(context)
        }

        public func roundedRectangle(size: CGSize, radius: Double) {
            let r = CGFloat(radius)
            let midx = size.width / 2.0
            let midy = size.height / 2.0
            CGContextMoveToPoint(context, 0, midy)
            CGContextAddArcToPoint(context, 0, 0, midx, 0, r)
            CGContextAddArcToPoint(context, size.width, 0, size.width, midy, r)
            CGContextAddArcToPoint(context, size.width, size.height, midx, size.width, r)
            CGContextAddArcToPoint(context, 0, size.height, 0, midy, r)
            CGContextClosePath(context)
            CGContextDrawPath(context, CGPathDrawingMode.FillStroke)
        }
        
        public func line(x1: Double, y1: Double, x2: Double, y2: Double) {
            let points = [CGPoint(x: x1, y: y1), CGPoint(x: x2, y: y2)]
            CGContextAddLines(context, points, points.count)
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
