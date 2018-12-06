//
//  ViewController.swift
//  ImagePickerSample
//
//  Created by 鈴木 大貴 on 2016/10/27.
//  Copyright © 2016年 marty-suzuki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func cameraButtonTapped(_ sender: UIButton) {
        //TODO: UIImagePickerControllerの作成
        let imagePickerVC = UIImagePickerController()
        // UIImagePickerControllerSourceType.savedPhotosAlbum だと直接写真選択画面
        imagePickerVC.sourceType = .photoLibrary
        // 選択したメディアの編集を可能にするかどうか
        imagePickerVC.allowsEditing = true
        
        // 選択可能なメディアの制限 デフォルトは photo のみ。
        // movie を選択可能にするには
        // imagePickerVC.mediaTypes = UIImagePickerController.availableMediaTypes(for: imagePickerVC.sourceType)!
        imagePickerVC.delegate = self
        present(imagePickerVC, animated: true, completion: nil)
    }
}

//MARK: - UIImagePickerControllerDelegate, UINavigationControllerDelegate
extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    //TODO: delegateメソッドの追加
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        dismiss(animated: true, completion: nil)
        
        imageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
    }
}
