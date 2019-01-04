//
//  Color.swift
//  Swift-VIPER
//
//  Created by Yuni Huang on 2019/1/4.
//  Copyright © 2019 Yuni Huang. All rights reserved.
//

import Foundation

struct Color: Codable {
    var name: String
    var hex: String
    var r: Float
    var g: Float
    var b: Float
    var desc: String
}

struct JsonData: Codable {
    var results: [Color]
}
