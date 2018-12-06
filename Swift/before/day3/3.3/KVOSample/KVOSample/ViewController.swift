//
//  ViewController.swift
//  KVOSample
//
//  Created by 植木 友浩 on 2018/12/05.
//  Copyright © 2018 CyberZ. All rights reserved.
//

import UIKit

class Counter : NSObject {
    static let shared:Counter = Counter()
    
    @objc dynamic var count:Int = 0
    
    override private init() {
        super.init()
    }
    
    func countUp() {
        count += 1
    }
    
    func countDown() {
        count = max(0, count - 1)
    }
}

class ViewController: UIViewController {
    @IBOutlet weak var countText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        Counter.shared.addObserver(self,
            forKeyPath: #keyPath(Counter.count),
            options: [.new, .old],
            context: nil)
        updateCount(Counter.shared.count)
    }
    
    deinit {
        Counter.shared.removeObserver(self, forKeyPath: "count")
    }
    
    override func observeValue(forKeyPath keyPath: String?,
                               of object: Any?,
                               change: [NSKeyValueChangeKey : Any]?,
                               context: UnsafeMutableRawPointer?) {
        guard let keyPath = keyPath, let change = change else { return }
        
        if keyPath == #keyPath(Counter.count) {
            guard let current = change[NSKeyValueChangeKey.newKey] as? NSNumber else { return }
            updateCount(current.intValue)
        }
    }
    
    @IBAction func countDownTapped(_ sender:UIButton) {
        Counter.shared.countDown()
    }
    
    @IBAction func countUpTapped(_ sender:UIButton) {
        Counter.shared.countUp()
    }
    
    @IBAction func pushTapped(_ sender:UIButton) {
        guard let storyboard = storyboard, let navigationController = navigationController else {
            return
        }
        let viewController = storyboard.instantiateViewController(withIdentifier: "ViewController")
        navigationController.pushViewController(viewController, animated: true)
    }
    
    private func updateCount(_ count:Int) {
        countText.text = String(count)
    }
}

