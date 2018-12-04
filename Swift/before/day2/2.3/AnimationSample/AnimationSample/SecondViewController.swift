//
//  SecondViewController.swift
//  AnimationSample
//
//  Created by 鈴木 大貴 on 2016/10/24.
//  Copyright © 2016年 marty-suzuki. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    private struct Const {
        static let ojisanInitialFrame = CGRect(x: 65, y: 115, width: 170, height: 170)
        static let ojisanInitialFrame2 = CGRect(x: 215, y: 115, width: 170, height: 170)
    }
    
    let ojisanImageView1 = UIImageView(image: UIImage(named: "ojisan"))
    let ojisanImageView2 = UIImageView(image: UIImage(named: "ojisan2"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // TODO: ojisanImageView1の追加
         view.addSubview(ojisanImageView1)
        ojisanImageView1.frame = Const.ojisanInitialFrame
        
        // TODO: ojisanImageView2の追加
        view.addSubview(ojisanImageView2)
        ojisanImageView2.frame = Const.ojisanInitialFrame2

        // TODO: ojisanImageView2を非表示にしておく
        ojisanImageView2.isHidden = true
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

