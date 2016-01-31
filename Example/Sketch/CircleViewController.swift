//
//  CircleViewController.swift
//  Sketch
//
//  Created by Masaru Ichikawa on 2016/01/31.
//  Copyright © 2016年 CocoaPods. All rights reserved.
//

import UIKit
import Sketch

class CircleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image = Sketch.draw(CGSize(width: 100, height: 100)) { canvas in
            canvas.stroke(nil)
            canvas.fill(UIColor.grayColor())
            canvas.circle(50)
        }
        
        let imageView = UIImageView(image: image)
        imageView.frame.origin = CGPoint(x: 0, y: 66)
        view.addSubview(imageView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
