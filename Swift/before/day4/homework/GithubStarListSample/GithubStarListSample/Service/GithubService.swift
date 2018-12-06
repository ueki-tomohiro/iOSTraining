//
//  GithubService.swift
//  GithubStarListSample
//
//  Created by 植木 友浩 on 2018/12/06.
//  Copyright © 2018 Cyber-Z. All rights reserved.
//

import Foundation

import Alamofire
import RxSwift
import SwiftyJSON

class GithubService {
    enum SORT : String {
        case stars
        case forks
        case updated
    }
    
    enum APIError: Error {
        case parseError
        case unknown
    }
    
    static let shared = GithubService()
    
    private init(){}
    
    func getUser(q:String, sort:SORT) -> Single<[GithubRepository]> {
        return Single<[GithubRepository]>.create{ observer in
            let url = "https://api.github.com/search/repositories"
            let parameters: Parameters = [
                "q": q,
                "sort" : sort.rawValue
            ]
            let req = Alamofire.request(url, method: .get, parameters: parameters).responseJSON{ response in
                if response.result.isSuccess {
                    guard let object = response.result.value else {
                        observer(.error(APIError.parseError))
                        return
                    }
                    let result = JSON(object)
                    var items:[GithubRepository]  = []
                    
                    let json = result.filter({ (name, json) -> Bool in
                        return name == "items"
                    }).first.map{$1}
                    
                    if let json = json, let array = json.array {
                        array.forEach{
                            item in
                            if let repository = GithubRepository(json:item) {
                                items.append(repository)
                            }
                        }
                    }
                    
                    observer(.success(items))
                } else {
                    if let error = response.error {
                        observer(.error(error))
                    } else {
                        observer(.error(APIError.unknown))
                    }
                }
            }
            return Disposables.create() {req.cancel()}
        }
    }
}
