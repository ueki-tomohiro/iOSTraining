//
//  ViewController.swift
//  NavigationSample
//
//  Created by 鈴木 大貴 on 2016/10/23.
//  Copyright © 2016年 szk-atmosphere. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nextButtonTapped(_ sender:UIButton) {
        guard let titleLabel = sender.titleLabel, let titleText = titleLabel.text else {
            return
        }
        
        guard let storyboard = storyboard, let navigationController = navigationController else {
            return
        }
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "NextViewController") as? NextViewController else {
            return
        }
        viewController.setTitle(title: titleText)
        navigationController.pushViewController(viewController, animated: true)
    }
}

