//
//  FourthViewController.swift
//  TabSample
//
//  Created by 植木 友浩 on 2018/12/04.
//  Copyright © 2018 szk-atmosphere. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController {
    init(imageName: String) {
        super.init(nibName: nil, bundle: nil)
        if let tabBarItem = tabBarItem {
            tabBarItem.title = "Fourth"
            tabBarItem.image = UIImage(named: imageName)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
