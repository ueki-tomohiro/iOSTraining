//
//  SecondViewController.swift
//  NotificationCenterSample
//
//  Created by 植木 友浩 on 2018/12/05.
//  Copyright © 2018 CyberZ. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var receiveText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        NotificationCenter.default.addObserver(self,
            selector: #selector(type(of: self).recieveNotification(_:)),
            name: NSNotification.Name(rawValue: FirstViewController.Notification),
            object: nil)
    }

    @objc func recieveNotification(_ notification: Notification) {
        print("recieveNotification")
        guard let hash = notification.userInfo as? [String: String],
        let value = hash["key"] else {
            return
        }
        
        receiveText.text = value
    }
}

