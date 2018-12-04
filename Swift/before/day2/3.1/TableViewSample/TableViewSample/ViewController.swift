//
//  ViewController.swift
//  TableViewSample
//
//  Created by 鈴木 大貴 on 2016/10/24.
//  Copyright © 2016年 marty-suzuki. All rights reserved.
//

import UIKit

//TODO: - UITableViewDataSourceとUITableViewDelegateを継承
class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView?
    //TODO: -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //TODO: - delegateとdataSourceを登録
        if let tableView = tableView {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        }
        //TODO: - Cellを登録]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //TODO: - UITableViewDataSourceの実装
}

extension ViewController : UITableViewDelegate {
    
}

extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        if indexPath.row % 3 == 0 {
            cell.textLabel?.text = "\(indexPath.row)" // 3で割り切れるときのみ、textを代入
        }
        return cell
    }
}
