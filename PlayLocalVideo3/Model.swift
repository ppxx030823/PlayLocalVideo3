//
//  Model.swift
//  PlayLocalVideo3
//
//  Created by ppx on 2025/2/12.
//

import UIKit
import AVKit
import AVFoundation

// MARK: - Model
// 定义Video的结构体，属性初始化后不能被改变，因为结构体时值类型。
// 在你每次定义一个新类或者结构体的时候，实际上你是定义了一个新的 Swift 类型。
// 因此请使用UpperCamelCase这种方式来命名
struct Video {
    let image: String
    let title: String
    let source: String
}




