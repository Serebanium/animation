//
//  ViewController.swift
//  animation
//
//  Created by Сергей Иванов on 30/03/2019.
//  Copyright © 2019 topMob. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var playButton = UIButton()
    var forwardButton = UIButton()
    var backButton = UIButton()
    var played = false
    
    let url = URL(string: "https://apple.com")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startURL()
        
        playButton = UIButton(frame: CGRect(x: 0, y: 0, width: Int(self.view.frame.width/4.5), height: Int(self.view.frame.width/4.5)))
        forwardButton = UIButton(frame: CGRect(x: 0, y: 0, width: Int(self.view.frame.width/4), height: Int(self.view.frame.width/5.5)))
        backButton = UIButton(frame: CGRect(x: 0, y: 0, width: Int(self.view.frame.width/4), height: Int(self.view.frame.width/5.5)))
        
        startBack()
        startUI()
    }
    
    //MARK: - ... URL
    
    func startURL() {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                if let error = error {
                    print(#function, #line, error.localizedDescription)
                }
                return
            }
            let string = String(data: data, encoding: .utf8) ?? "Data not found"
            print(Date(), #function, #line, data)
            print(string)
        }
        task.resume()
        print(Date(), #function, #line)
    }
    
    //MARK: - ... Button animation
    
    @objc func animatePlayButton() {
        UIView.animate(withDuration: 0.1, delay: 0, animations: {
            self.playButton.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            self.playButton.alpha = 1
        }) { _ in
            UIView.animate(withDuration: 0.1, delay: 0, animations: {
                self.playButton.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
                self.playButton.alpha = 0.7
            })
        }
        if played {
            self.playButton.setTitle(">", for: [])
        } else {
            self.playButton.setTitle("||", for: [])
        }
        played.toggle()
    }
    
    @objc func animateBackButton() {
        UIView.animate(withDuration: 0.1, delay: 0, animations: {
            self.backButton.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            self.backButton.alpha = 1
        }) { _ in
            UIView.animate(withDuration: 0.1, delay: 0, animations: {
                self.backButton.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
                self.backButton.alpha = 0.7
            })
        }
    }
    
    @objc func animateForwardButton() {
        UIView.animate(withDuration: 0.1, delay: 0, animations: {
            self.forwardButton.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            self.forwardButton.alpha = 1
        }) { _ in
            UIView.animate(withDuration: 0.1, delay: 0, animations: {
                self.forwardButton.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
                self.forwardButton.alpha = 0.7
            })
        }
    }
    
    // MARK: - ... Interface
    
    func startBack() {
        for _ in 1...7 {
            
            let diameter = randomSize()
            let radius = diameter/2
            
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
        
        playButton.alpha = 0
        playButton.backgroundColor = .red
        playButton.setTitleColor(.white, for: [])
        playButton.setTitle(">", for: [])
        playButton.titleLabel?.font = .systemFont(ofSize: self.view.frame.width/10)
        playButton.center = CGPoint(x: Int(self.view.frame.width/2), y: Int(self.view.frame.height))
        playButton.layer.cornerRadius = CGFloat(self.view.frame.width/15)
        playButton.addTarget(self, action: #selector(animatePlayButton), for: .touchUpInside)
        
        forwardButton.alpha = 0
        forwardButton.backgroundColor = .red
        forwardButton.setTitleColor(.white, for: [])
        forwardButton.setTitle(">>", for: [])
        forwardButton.titleLabel?.font = .systemFont(ofSize: self.view.frame.width/10)
        forwardButton.center = CGPoint(x: Int(self.view.frame.width), y: Int(self.view.frame.height*0.75))
        forwardButton.layer.cornerRadius = CGFloat(self.view.frame.width/15)
        forwardButton.addTarget(self, action: #selector(animateForwardButton), for: .touchUpInside)
        
        backButton.alpha = 0
        backButton.backgroundColor = .red
        backButton.setTitleColor(.white, for: [])
        backButton.setTitle("<<", for: [])
        backButton.titleLabel?.font = .systemFont(ofSize: self.view.frame.width/10)
        backButton.center = CGPoint(x: 0, y: Int(self.view.frame.height*0.75))
        backButton.layer.cornerRadius = CGFloat(self.view.frame.width/15)
        backButton.addTarget(self, action: #selector(animateBackButton), for: .touchUpInside)
        
        self.view.addSubview(backButton)
        self.view.addSubview(forwardButton)
        self.view.addSubview(playButton)
        
        UIView.animate(withDuration: 0.5, delay: 1, animations: {
            self.backButton.center = self.leftView()
            self.backButton.alpha = 0.5
        }) { _ in
            UIView.animate(withDuration: 0.5, delay: 0, animations: {
                self.backButton.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
                self.backButton.alpha = 0.7
            })
        }
        
        UIView.animate(withDuration: 0.5, delay: 0.5, animations: {
            self.playButton.center = self.centerView()
            self.playButton.alpha = 0.5
        }) { _ in
            UIView.animate(withDuration: 0.5, delay: 0.7, animations: {
                self.playButton.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
                self.playButton.alpha = 0.7
            })
        }
        
        UIView.animate(withDuration: 0.5, delay: 1, animations: {
            self.forwardButton.center = self.rightView()
            self.forwardButton.alpha = 0.5
        }) { _ in
            UIView.animate(withDuration: 0.5, delay: 0.4, animations: {
                self.forwardButton.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
                self.forwardButton.alpha = 0.7
            })
        }
    }
    
    // MARK: - ... Position

    func centerView() -> CGPoint {
        return CGPoint(x: Int(self.view.frame.width/2), y: Int(self.view.frame.height*0.75))
    }
    
    func rightView() -> CGPoint {
        return CGPoint(x: Int(self.view.frame.width*0.80), y: Int(self.view.frame.height*0.75))
    }
    
    func leftView() -> CGPoint {
        return CGPoint(x: Int(self.view.frame.width*0.20), y: Int(self.view.frame.height*0.75))
    }
    
    // MARK: - ... random functions
    
    func randomSize() -> Int {
        return Int.random(in: Int(self.view.frame.width/3)...Int(self.view.frame.width))
    }
    
    func randomCGPoint() -> CGPoint {
        let h = Int(self.view.frame.height)
        let w = Int(self.view.frame.width)
        return CGPoint(x: Int.random(in: 0...w), y: Int.random(in: 0...h))
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

