//
//  Commen.swift
//  WeiBo
//
//  Created by 渠晓友 on 2017/5/24.
//  Copyright © 2017年 xiaoyouPrince. All rights reserved.
//

import UIKit

/// itravel 的 app信息，临时使用
//let app_key = "2681167680"
//let app_secret = "5072b1af9da41b457202eb8b7ebfa30f"
//let redirect_uri = "http://www.baidu.com"

let app_key = "3336673106"
let app_secret = "99ecccb658a1c43ead8aefa0bdfbea8c"
let redirect_uri = "http://www.baidu.com"

// MARK: - 一些微博授权常量

private let rootUrl = "https://api.weibo.com/oauth2/authorize"          /// 授权根路径
//let app_key = "2625427871"                                              /// client_id 对应参数 app_key
//let app_secret = "eca1ed907d76ad6f6ce62a8feda67a1c"                     /// app_secret
//let redirect_uri = "http://www.520it.com"                               /// 回调路径
let authUrlStr = "\(rootUrl)?client_id=\(app_key)&redirect_uri=\(redirect_uri)" /// authUrlstring


// MARK: - 通知常量

// 发微博添加/删除 image的通知
let picPickerAddPhotoNote = NSNotification.Name(rawValue: "picPickerAddPhotoNote")
let picPickerDeletePhotoNote = NSNotification.Name(rawValue: "picPickerDeletePhotoNote")


let ShowPhotoBrowserIndexKey = "ShowPhotoBrowserIndexKey"
let ShowPhotoBrowserUrlsKey = "ShowPhotoBrowserUrlsKey"

let ShowPhotoBrowserNote = NSNotification.Name(rawValue: "picPickerDeletePhotoNote")



// MARK: - 测试地址

let kGetUrl : String = "http://httpbin.org/get"                         /// git请求测试
let kPostUrl : String = "http://httpbin.org/post"                       /// post请求测试


// MARK:-一些常量

let kStatusBarH : CGFloat = 20                                          /// 状态栏高度
let kNavBarH : CGFloat = 44                                             /// 导航栏高度
let kTabbarH : CGFloat = 44                                             /// tabbar高度


let kScreenW : CGFloat = (UIScreen.screens.first?.bounds.size.width)!   /// 屏幕宽度
let kScreenH : CGFloat = (UIScreen.screens.first?.bounds.size.height)!  /// 屏幕高度

// MARK: - 打印增强
func Dlog<T>(_ message : T ,file : String = #file , funName : String = #function , lineNum : Int = #line){
    
    let filePath = (file as NSString).lastPathComponent
    
    #if DEBUG
        
        print("\(filePath):\(funName):第\(lineNum)行-\n\(message)")
        
    #endif
}



