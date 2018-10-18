//
//  LockControl.swift
//  sprint 6 second retake
//
//  Created by Jonathan T. Miles on 10/17/18.
//  Copyright © 2018 Jonathan T. Miles. All rights reserved.
//

import Foundation
import UIKit

enum Appearance {
    static var crimson = UIColor(red: 84.0/255.0, green: 0.0/255.0, blue: 4.0/255.0, alpha: 1.0)
    static var wheat = UIColor(red: 255.0/255.0, green: 226.0/255.0, blue: 170.0/255.0, alpha: 1.0)
    
    static func setUpCrimsonTheme() {
        UINavigationBar.appearance().barTintColor = crimson
        UIBarButtonItem.appearance().tintColor = wheat
        UIButton.appearance().tintColor = wheat
        UILabel.appearance().tintColor = wheat
    }
}

class LockControl: UIControl {
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        
        setup()
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 250.0, height: 250.0)
    }
    
    func setup() {
        self.backgroundColor = UIColor.gray
        self.layer.cornerRadius = 30.0
        self.clipsToBounds = true
        
        lockView.frame = CGRect(origin: CGPoint(x: 57.5, y: 10.0), size: CGSize(width: 135.0, height: 180.0))
        lockView.image = UIImage(named: "Locked")
        self.addSubview(lockView)
        
        sliderView.frame = CGRect(x: 10.0, y: 200.0, width: 230.0, height: 40.0)
        sliderView.backgroundColor = UIColor.darkGray
        sliderView.layer.cornerRadius = 20.0
        sliderView.clipsToBounds = true
        self.addSubview(sliderView)
        
        focusView.frame = CGRect(x: 12.0, y: 202.0, width: 36.0, height: 36.0)
        focusView.backgroundColor = UIColor.black
        focusView.layer.cornerRadius = 18.0
        focusView.clipsToBounds = true
        
        let recognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        focusView.addGestureRecognizer(recognizer)
        self.addSubview(focusView)
        
        handlePan(recognizer)
    }
    
    @objc func handlePan(_ recognizer: UIPanGestureRecognizer) {
        
        let translation: CGPoint = recognizer.translation(in: focusView)
        
        guard let view = recognizer.view else { return }
        
        let startCenter = CGPoint(x: 30.0, y: 220.0)
        let endPoint = CGPoint(x: 220.0, y: 220.0)
    
        view.center = CGPoint(x: view.center.x + translation.x, y: view.center.y)
        
        
        
        switch recognizer.state {
        case .began:
            percentageAcross = 0.0
        case .changed:
            percentageAcross = (view.center.x - startCenter.x) / (endPoint.x - startCenter.x)
        case .ended:
            if percentageAcross > 0.0 && percentageAcross < 0.8 {
                setup()
            } else if percentageAcross > 0.8 {
                view.center = endPoint
                unlock()
            }
        case .cancelled:
            setup()
        default:
            break
        }
        
        recognizer.setTranslation(CGPoint.zero, in: focusView)
    }
    
    func unlock() {
        lockView.image = UIImage(named: "Unlocked")

        NotificationCenter.default.post(name: .unlocked, object: nil)
    }
    
    // MARK: - SubViews and properties
    
    var percentageAcross: CGFloat = 0.0
    var isLocked = false
    
    let lockView = UIImageView()
    let sliderView = UIView()
    let focusView = UIView()
    
}
