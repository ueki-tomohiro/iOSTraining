//
//  SecondViewController.swift
//  InfiniteNavigationSample
//
//  Created by 植木 友浩 on 2018/12/04.
//  Copyright © 2018 szk-atmosphere. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        title = String(navigationController?.childViewControllers.count ?? 0)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func pushButtonTapped(_ sender:UIButton) {
        guard let storyboard = storyboard, let navigationController = navigationController else {
            return
        }
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as? SecondViewController else {
            return
        }
        
        navigationController.pushViewController(viewController, animated: true)
    }
}
