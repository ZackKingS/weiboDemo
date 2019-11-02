//
//  StatusViewModel.swift
//  WeiBo
//
//  Created by 渠晓友 on 2017/5/27.
//  Copyright © 2017年 xiaoyouPrince. All rights reserved.
//
//  微博视图模型封装

import UIKit

class StatusViewModel: NSObject {
    
    var status : Status
    
    var cellHeight : CGFloat = 0   /// cell 高度
    
    var sourceText : String?       /// 微博正文，经过处理后直接使用
    var creatTimeStr : String?     /// 微博正文，经过处理后直接使用
    var verifiedImage : UIImage?   /// 用户认证图片
    var vipImage : UIImage?        /// 用户会员等级图片
    var profileURL : URL?          /// 用户头像的处理
    var picURLs : [URL] = [URL]()  /// 微博配图的处理
    
    
    init( status : Status ){
        
        self.status = status
        
        // 1.处理微博来源
        if let source = status.source , status.source != "" {
            
            // 截取用户微博来源
            // "<a href=\"http://app.weibo.com/t/feed/4WrlHq\" rel=\"nofollow\">专业版微博平台</a>"
            
            let startIndex = ((source as NSString?)?.range(of: ">").location)! + 1
            let length = ((source as NSString?)?.range(of: "</").location)! - startIndex
            
            // 恶心的Swift3.0中的Range
            sourceText = (source as NSString).substring(with: NSMakeRange(startIndex, length))
        }
        
        // 2.处理时间
        if let creatAt = status.created_at {
            creatTimeStr = Date.creatDateString(creatAtString: creatAt)
        }
        
        // 3。处理用户认证类型
        let verified_type = status.user?.verified_type ?? -1
        switch verified_type {
        case 0:
            verifiedImage = UIImage(named: "avatar_vip") //个人认证
        case 2,3,5:
            verifiedImage = UIImage(named: "avatar_enterprise_vip") //组织企业认证
        case 220:
            verifiedImage = UIImage(named: "avatar_grassroot") //机构认证
        default:
            verifiedImage = nil
        }
        
        // 4.处理用户等级
        let mbrank = status.user?.mbrank ?? 0
        
        if mbrank > 0 && mbrank <= 6 {
            vipImage = UIImage(named: "common_icon_membership_level\(mbrank)")
        }
        
        
        // 5. 用户头像的处理
        let profile_url = status.user?.profile_image_url ?? ""
        profileURL = URL(string: profile_url)
        
        // 6.处理微博配图
        let picURLS = status.pic_urls?.count != 0 ? status.pic_urls : status.retweeted_status?.pic_urls
   
        if let picurlDicts = picURLS {
            
            for picurlDict in picurlDicts{
                
                /**
                    thumbnail_pic : 缩略图
                    bmiddle_pic : 中等图
                    original_pic : 原图
                 */
                guard let picUrlString = picurlDict["thumbnail_pic"] else {
                    continue
                }
                
                // 替换成原图、中图
                var urlStr = ""
                if picUrlString.contains("thumbnail") {
                    let range = (picUrlString as NSString).range(of: "thumbnail")
                    urlStr = (picUrlString as NSString).replacingCharacters(in: range, with: "bmiddle")
                }
                
                self.picURLs.append(URL(string : urlStr)!)
                
            }
        }
    }
}
