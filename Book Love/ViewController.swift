//
//  ViewController.swift
//  Book Love
//
//  Created by MacAir23 on 1/9/19.
//  Copyright © 2019 Matthew Phraxayavong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var bookImageView: UIImageView!
    
    // 1. Create JSON file with the keys you need
    // 2. Look up how to read the content of the file
    // 3. Create the struct for you Book item
    // 4. Look up how to deserialize a JSON file into a NSDictionary -> Codable protocol, Mapper 
    // 5. Result = array of books
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gesture = UIPanGestureRecognizer(target: self, action: #selector(wasDragged(gestureRecognizer:)))
        if let bookImageView = bookImageView {
            bookImageView.addGestureRecognizer(gesture)
        }
    }
    @objc func wasDragged(gestureRecognizer: UIPanGestureRecognizer) {
//        print("I am working")
        let labelPoint = gestureRecognizer.translation(in: view)
        bookImageView.center = CGPoint(x: view.bounds.width / 2 + labelPoint.x, y: view.bounds.height / 2 + labelPoint.y)
//    print(bookImageView.center.x)
        let xFromCenter = view.bounds.width / 2 - bookImageView.center.x
        var rotation = CGAffineTransform(rotationAngle: xFromCenter / 100)
        let scale = min(100 / abs(xFromCenter), 1)
        var scaleAndRotated = rotation.scaledBy(x: scale, y: scale)
        
        bookImageView.transform = scaleAndRotated
        
        if gestureRecognizer.state == .ended {
            if bookImageView.center.x < (view.bounds.width / 2 - 100) {
            print("not interested")
        }
            if bookImageView.center.x > (view.bounds.width / 2 + 100) {
            print("interested")
    }
            rotation = CGAffineTransform(rotationAngle: 0)
            scaleAndRotated = rotation.scaledBy(x: 1, y: 1)
            bookImageView.transform = scaleAndRotated
            bookImageView.center = CGPoint(x: view.bounds.width / 2, y: view.bounds.height / 2)
    
        }
    }
}
