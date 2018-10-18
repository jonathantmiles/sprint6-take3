//
//  ViewController.swift
//  sprint 6 second retake
//
//  Created by Jonathan T. Miles on 10/17/18.
//  Copyright © 2018 Jonathan T. Miles. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(setUnlockStatus(notification:)), name: .unlocked, object: nil)
    }

    
    @IBOutlet weak var resetLockButton: UIBarButtonItem! {
        didSet {
            let resetButton = UIButton(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: 35.0, height: 25.0)))
            resetButton.setTitle("Reset", for: .normal)
            resetButton.addTarget(self, action: #selector(resetLockAction), for: .touchUpInside)
            resetButton.tintColor = Appearance.wheat
            resetLockButton.customView = resetButton
            
            UIView.animate(withDuration: 0.0) {
                self.resetLockButton.customView!.alpha = 0.0
            }
            
        }
    }
    
    @objc func resetLockAction() {
        lockControl.setup()
        UIView.animate(withDuration: 0.0) {
            self.resetLockButton.customView!.alpha = 0.0
        }
    }
    
    @objc func setUnlockStatus(notification: NSNotification) {
        UIView.animate(withDuration: 0.0) {
            self.resetLockButton.customView!.alpha = 1.0
        }
    }
    
    @IBOutlet weak var lockControl: LockControl!
}

extension Notification.Name {
    static let unlocked = Notification.Name("unlocked")
}
