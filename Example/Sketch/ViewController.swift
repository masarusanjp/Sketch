//
//  ViewController.swift
//  Sketch
//
//  Created by masaichi on 01/26/2016.
//  Copyright (c) 2016 masaichi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var tableView: UITableView! = nil
    let samples: [(name: String, klass: UIViewController.Type)] = [
        ("Circle", CircleViewController.self)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return samples.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        cell.textLabel?.text = samples[indexPath.row].name
        
        return cell
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let viewController = samples[indexPath.row].klass.init(nibName: nil, bundle: nil)
        
        navigationController!.pushViewController(viewController, animated: true)
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
}

