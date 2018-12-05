//
//  ViewController.swift
//  HTTPSample
//
//  Created by 鈴木 大貴 on 2016/10/28.
//  Copyright © 2016年 marty-suzuki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func searchButtonTapped(_ sender: UIButton) {
        guard let username = textField.text else { return }
        fetchUser(username)
    }
    
    private func fetchUser(_ username: String) {
        guard
            let encodedUsername = username.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
            let url = URL(string: "https://qiita.com/api/v2/users/\(encodedUsername)")
        else { return }
        //TODO: 通信を実行、完了次第textView.textに結果を代入して表示
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else { return }
            do {
                let object = try JSONSerialization.jsonObject(with: data, options: [])
                print(object)
                guard let hashTable = object as? [String: Any] else {
                    return
                }
                if let id = hashTable["id"] as? String,
                    let name = hashTable["name"] as? String {
                    DispatchQueue.main.async { [unowned self] in
                        self.textView.textColor = .black
                        self.textView.text = "id = \(id), name = \(name)"
                    }
                } else {
                    guard let message = hashTable["message"] as? String,
                    let type = hashTable["type"] as? String else {
                        return
                    }
                    DispatchQueue.main.async { [unowned self] in
                        self.textView.textColor = .red
                        self.textView.text = "type = \(type), message = \(message)"
                    }
                }
            } catch let e {
                print(e)
            }
        }
        task.resume()
    }
}

