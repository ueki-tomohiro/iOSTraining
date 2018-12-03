//
//  SecondViewController.swift
//  ModalViewControllerBasic
//
//  Created by 植木 友浩 on 2018/12/03.
//  Copyright © 2018 marty-suzuki. All rights reserved.
//

import UIKit

protocol SecondViewControllerDelegate: class {
    func secondViewController(_ viewController: SecondViewController, didTapButton button: UIButton)
}

class SecondViewController: UIViewController {
    weak var delegate: SecondViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        delegate?.secondViewController(self, didTapButton: sender)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        guard let identifier = segue.identifier, identifier == "presentSecondViewController" else {
            return
        }
        let destination = segue.destination
    }
     */
}
