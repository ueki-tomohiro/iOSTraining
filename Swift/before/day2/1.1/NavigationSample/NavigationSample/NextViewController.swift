//
//  NextViewController.swift
//  NavigationSample
//
//  Created by 植木 友浩 on 2018/12/04.
//  Copyright © 2018 szk-atmosphere. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {
    @IBOutlet weak var label:UILabel?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func setTitle(title:String) {
        self.title = title
        label?.text = String(format: " %@ Tapped", title)
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
