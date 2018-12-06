//
//  ViewController.swift
//  GithubStarListSample
//
//  Created by 鈴木 大貴 on 2016/11/05.
//  Copyright © 2016年 szk-atmosphere. All rights reserved.
//

import UIKit

import RxSwift

class ViewController: UIViewController {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    
    private let disposeBag = DisposeBag()

    fileprivate var repositories: [GithubRepository] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.register(GithubTableViewCell.nib, forCellReuseIdentifier: GithubTableViewCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        
        if !UIApplication.shared.isStatusBarHidden {
            tableView.contentInset.top = UIApplication.shared.statusBarFrame.size.height
        }
        
        fetchRepositories()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func fetchRepositories() {
        
        //TODO: - 取得中はactivityIndicatorをアニメーションさせる
        activityIndicator.startAnimating()
        
        //TODO: - 該当のURLからJSONを取得する
        GithubService.shared.getUser(q: "language swift", sort:.stars).subscribe(
            onSuccess: { [weak self] entity in
                //TODO: - 取得したJSONらGithubRepositoryの配列を生成し、repositoriesに代入
                self?.stopIndicator()
                self?.updateRepository(items:entity)
            },
            onError: { [weak self] error in
                //TODO: - 取得に失敗した場合は、エラーのアラートを出す
                self?.stopIndicator()
                self?.showError(error:error)
            }
        ).disposed(by: disposeBag)
    }
    
    private func updateRepository(items:[GithubRepository]) {
        repositories = items
        tableView.reloadData()
    }
    
    private func showError(error:Error) {
        UIAlertController.showRetryAlert(to: self, with: error) { [weak self] in
            self?.fetchRepositories()
        }
    }
    
    private  func stopIndicator() {
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GithubTableViewCell.identifier) as! GithubTableViewCell
        //TODO: - セルに表示する内容を設定する
        cell.configure(with: repositories[indexPath.item])
        return cell
    }
}

extension ViewController: UITableViewDelegate {
}
