//
//  ViewController.swift
//  ScrollViewSample
//
//  Created by 鈴木大貴 on 2016/10/25.
//  Copyright © 2016年 marty-suzuki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var scrollView:UIScrollView?
    
    let scrollInit:CGFloat = 0
    let scrollOffset:CGFloat = 300
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let scrollView = UIScrollView(frame: view.frame)
        view.addSubview(scrollView)
        
        let image = UIImage(named:"big_image")!
        let scale = UIScreen.main.scale * 2
        let size = CGSize(width: image.size.width * scale, height: image.size.height * scale)
        let imageView = UIImageView(frame:CGRect(origin: .zero, size:size))

        imageView.image = image
        
        scrollView.addSubview(imageView)
        scrollView.contentOffset.y = scrollOffset
        scrollView.contentSize = imageView.frame.size
        scrollView.maximumZoomScale = 3
        scrollView.minimumZoomScale = 0.5
        scrollView.delegate = self
        scrollView.scrollsToTop = true
        
        self.scrollView = scrollView
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 2, animations: {
            self.scrollView?.contentOffset.y = self.scrollInit
        }, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

//MARK: - UIScrollViewDelegate
extension ViewController: UIScrollViewDelegate {
    // TODO: UIScrollViewDelegateのメソッドを追加
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        for imageView in scrollView.subviews where imageView is UIImageView {
            return imageView
        }
        return nil
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(String(format:"x:%f, y:%f", scrollView.contentOffset.x, scrollView.contentOffset.y))
    }
    
    func scrollViewShouldScrollToTop(_ scrollView: UIScrollView) -> Bool {
        return true
    }
}
