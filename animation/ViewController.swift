//
//  ViewController.swift
//  animation
//
//  Created by Сергей Иванов on 30/03/2019.
//  Copyright © 2019 topMob. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let h = self.view.frame.height
        let w = self.view.frame.width
        
        let smallFrame = CGRect(x: 0, y: 0, width: 100, height: 100)
        let circle = UIView(frame: smallFrame)
        circle.backgroundColor = .purple
        circle.layer.cornerRadius = 50
        self.view.addSubview(circle)
        
        UIView.animate(withDuration: 3) {
            circle.center = CGPoint(x: w/2, y: h/2)
            circle.backgroundColor = .orange
        }
        
    }


}

