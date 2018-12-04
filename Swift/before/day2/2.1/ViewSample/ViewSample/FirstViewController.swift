//
//  FirstViewController.swift
//  ViewSample
//
//  Created by 鈴木 大貴 on 2016/10/24.
//  Copyright © 2016年 szk-atmosphere. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let imageView = UIImageView(frame: CGRect(x: 130, y: 450, width: 100, height: 100))
        imageView.image = UIImage(named: "ojisan")
        self.view.addSubview(imageView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func removeButtonTappd(_ sender:UIButton) {
        for view in self.view.subviews {
            if view is UIImageView {
                view.removeFromSuperview()
            }
        }
    }
}
