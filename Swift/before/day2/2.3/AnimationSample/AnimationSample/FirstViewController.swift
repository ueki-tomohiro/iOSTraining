//
//  FirstViewController.swift
//  AnimationSample
//
//  Created by 鈴木 大貴 on 2016/10/24.
//  Copyright © 2016年 marty-suzuki. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    private struct Const {
        static let ojisanInitialFrame = CGRect(x: 0, y: 0, width: 170, height: 170)
        static let ojisanMovedFrame = CGRect(x: 150, y: 416, width: 170, height: 170)
    }
    
    @IBOutlet weak var ojisanImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // TODO: アニメーション追加
        // Do any additional setup after loading the view, typically from a nib.
        UIView.animate(withDuration: 2, animations: {
            self.ojisanImageView.frame = Const.ojisanMovedFrame
        } , completion: { _ in
            UIView.animate(withDuration: 2, animations: {
                self.ojisanImageView.frame = Const.ojisanInitialFrame
            } , completion:nil)
        })
    }
}

