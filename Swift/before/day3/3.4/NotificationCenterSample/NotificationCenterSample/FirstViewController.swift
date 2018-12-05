//
//  FirstViewController.swift
//  NotificationCenterSample
//
//  Created by 植木 友浩 on 2018/12/05.
//  Copyright © 2018 CyberZ. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    static let Notification = "pushNotificationTapped"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func pushButtonTapped(_ sender:UIButton) {
        print("pushButtonTapped")
        let dict = ["key" : "value"]
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: FirstViewController.Notification), object: self, userInfo: dict)
    }
}

