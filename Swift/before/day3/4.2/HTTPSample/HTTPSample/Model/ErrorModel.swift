//
//  ErrorModel.swift
//  HTTPSample
//
//  Created by 植木 友浩 on 2018/12/06.
//  Copyright © 2018 Cyber-Z. All rights reserved.
//

import Foundation

struct ErrorModel : Decodable {
    var type: String
    var message: String
}
