//
//  ViewController.swift
//  ExternalForceModal
//
//  Created by 鈴木大貴 on 2016/10/16.
//  Copyright © 2016年 marty-suzuki. All rights reserved.
//

import UIKit

// TODO: SecondViewControllerのdelegateを準拠する
class ViewController: UIViewController, SecondViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showTapped(_ sender: UIButton) {
        self.showSecondViewController()
    }

    // TODO: SecondViewController の delegateメソッドを実装
    func secondViewController(_ viewController: SecondViewController, didTapButton button: UIButton) {
        dismiss(animated: true) {
            self.showSecondViewController()
        }
    }
    
    private func showSecondViewController() {
        guard let secondViewController = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else {
        return
        }
        // TODO: secondViewControllerのdelegateを自分にセット
        secondViewController.delegate = self
        // TODO: present(viewControllerToPresent: UIViewController, animated: Bool, completion: (() -> Void)?)
        present(secondViewController, animated: true, completion: nil)
    }
}

