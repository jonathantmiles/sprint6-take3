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
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func resetLock(_ sender: Any) {
        lockControl.setup()
    }
    
    @IBOutlet weak var lockControl: LockControl!
}

