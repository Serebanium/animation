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
        startBack()
        startUI()
        
    }
    
    
    
    func startBack() {
        let diameter = Int(self.view.frame.width)/2
        let radius = diameter/2
        
        for _ in 1...7 {
            
            let smallFrame = CGRect(x: 0, y: 0, width: diameter, height: diameter)
            let circle = UIView(frame: smallFrame)
            let basePoint = randomCGPoint()
            circle.center = basePoint
            circle.backgroundColor = randomColor()
            circle.layer.cornerRadius = CGFloat(radius)
            circle.alpha = 0.1
            self.view.addSubview(circle)
            
            UIView.animate(withDuration: TimeInterval(Int.random(in: 7...14)), delay: 0, options: [.autoreverse, .repeat], animations: {
                circle.center = self.randomCGPoint()
                circle.backgroundColor = self.randomColor()
           })
        }
    }
    
    
    
    func startUI() {
        let playButton = UIButton(frame: CGRect(x: 0, y: 0, width: Int(self.view.frame.width/4), height: Int(self.view.frame.width/4)))
        playButton.backgroundColor = .red
        playButton.setTitleColor(.white, for: [])
        playButton.setTitle(">", for: [])
        playButton.center = CGPoint(x: Int(self.view.frame.width/2), y: 0)
        playButton.layer.cornerRadius = CGFloat(self.view.frame.width/16)
        playButton.alpha = 0.9
        
        
        let forwardButton = UIButton(frame: CGRect(x: 0, y: 0, width: Int(self.view.frame.width/3.5), height: Int(self.view.frame.width/5)))
        forwardButton.backgroundColor = .red
        forwardButton.setTitleColor(.white, for: [])
        forwardButton.setTitle(">>", for: [])
        forwardButton.center = CGPoint(x: 0, y: Int(self.view.frame.height))
        forwardButton.layer.cornerRadius = CGFloat(self.view.frame.width/16)
        forwardButton.alpha = 0.9
        
        
        let backButton = UIButton(frame: CGRect(x: 0, y: 0, width: Int(self.view.frame.width/3.5), height: Int(self.view.frame.width/5)))
        backButton.backgroundColor = .red
        backButton.setTitleColor(.white, for: [])
        backButton.setTitle("<<", for: [])
        backButton.center = CGPoint(x: Int(self.view.frame.width), y: Int(self.view.frame.height))
        backButton.layer.cornerRadius = CGFloat(self.view.frame.width/16)
        backButton.alpha = 0.9
        
        
        
        
        
        self.view.addSubview(backButton)
        UIView.animate(withDuration: 1, delay: 0, animations: {
            backButton.center = self.leftView()
        })
        
        self.view.addSubview(forwardButton)
        UIView.animate(withDuration: 1, delay: 0, animations: {
            forwardButton.center = self.rightView()
        })
        
        self.view.addSubview(playButton)
        UIView.animate(withDuration: 1, delay: 0, animations: {
            playButton.center = self.centerView()
        })
        
    }
    
    
    
   
    
    
    
    func randomCGPoint() -> CGPoint {
        let diameter = Int(self.view.frame.width)/2
        let radius = diameter/2
        let h = Int(self.view.frame.height)
        let w = Int(self.view.frame.width)
        return CGPoint(x: Int.random(in: radius...w-radius), y: Int.random(in: radius...h-radius))
    }
    
    
    
    func centerView() -> CGPoint {
        return CGPoint(x: Int(self.view.frame.width/2), y: Int(self.view.frame.height/2))
    }
    
    func rightView() -> CGPoint {
        return CGPoint(x: Int(self.view.frame.width*0.80), y: Int(self.view.frame.height/2))
    }
    
    func leftView() -> CGPoint {
        return CGPoint(x: Int(self.view.frame.width*0.20), y: Int(self.view.frame.height/2))
    }
    
    
    
    func randomColor() -> UIColor {
        let random = Int.random(in: 1...7)
        switch random {
        case 1:
            return .red
        case 2:
            return .orange
        case 3:
            return .yellow
        case 4:
            return .gray
        case 5:
            return .blue
        case 6:
            return .purple
        case 7:
            return .black
        default:
            return .white
        }
    }


}

