//
//  ViewController.swift
//  KeyboardNotificationSample
//
//  Created by 鈴木大貴 on 2016/10/29.
//  Copyright © 2016年 marty-suzuki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var textViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var keyboardButton: UIBarButtonItem!
    
    private var keyboardHidden:Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        NotificationCenter.default.addObserver(self,
                                     selector: #selector(ViewController.keyboardWillShow(_:)),
                                         name: NSNotification.Name.UIKeyboardWillShow,
                                       object: nil)
        
        // TODO: キーボードが隠れる際の通知を登録
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillShow(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector:#selector(ViewController.keyboardWillHide(_:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: - KeyboardNotification
    func keyboardWillShow(_ notification: Notification) {
        // TODO: textViewのbottomのconstraintをキーボードの高さに再設定する（userInfoのUIKeyboardFrameEndUserInfoKeyの値を参照する）
        keyboardButton.title = "Keyboard hide"
        keyboardHidden = false

        guard let userInfo = notification.userInfo,
            let keyboardInfo = userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue else {
            return
        }
        let keyboardSize = keyboardInfo.cgRectValue.size
        UIView.animate(withDuration: 2, animations: { [unowned self] in
            self.textViewBottomConstraint.constant = keyboardSize.height
        })
    }
    
    func keyboardWillHide(_ notification: Notification) {
        keyboardButton.title = "Keyboard show"
        keyboardHidden = true
        // TODO: textViewのbottomのconstraintを0に再設定する
        UIView.animate(withDuration: 2, animations: { [unowned self] in
            self.textViewBottomConstraint.constant = 0
        })
    }
    
    // TODO: キーボードを表示・隠す処理
    @IBAction func toggleKeyboard(_ sender:UIButton) {
        if (keyboardHidden) {
            textView.becomeFirstResponder()
        } else {
            textView.resignFirstResponder()
        }
    }
}

