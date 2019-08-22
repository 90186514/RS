//
//  ExtensionPath.swift
//  RS
//
//  Created by Aalto on 2019/6/29.
//  Copyright © 2019 aa. All rights reserved.
//

import UIKit
/*
 分开来注释一下：
 ^ 匹配一行的开头位置
 (?![0-9]+$) 预测该位置后面不全是数字
 (?![a-zA-Z]+$) 预测该位置后面不全是字母
 [0-9A-Za-z] {8,16} 由8-16位数字或这字母组成
 $ 匹配行结尾位置
 
 注：(?!xxxx) 是正则表达式的负向零宽断言一种形式，标识预该位置后不是xxxx字符。
 https:blog.csdn.net/w6524587/article/details/56279494
 密码(以字母开头，长度在6~18之间，只能包含字母、数字和下划线)：
 ^[a-zA-Z]\w{5,17}$
 强密码(必须包含大小写字母和数字的组合，不能使用特殊字符，长度在8-10之间)：
 ^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,10}$
 
 */
//MARK:- 验证电子邮件地址
extension String {
    var isEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
}
//MARK:- 包含大写及小写字母与数字
extension String {
    static func isStandardPW(originString:String) ->  Bool {
        let regex = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{4,16}$"
        let pre = NSPredicate(format: "SELF MATCHES %@", regex)
        let isMatch = pre.evaluate(with: originString)
        return isMatch
    }
    
}

// MARK:- 在swift中使用NSClassFromString className要加工程名前缀
extension String {
    /// - Parameter className: className
    static func swiftClassFromString(className: String) -> AnyClass! {
        // get the project name
        if  let appName: String = Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as! String? {
            // YourProject.className
            let classStringName = appName + "." + className
            return NSClassFromString(classStringName)
        }
        return nil;
    }
}

// MARK:- DocumentDirectory 路径
extension String {
    ///
    /// - Parameter fileName: fileName
    /// - Returns: DocumentDirectory 内文件路径
    static func hq_appendDocmentDirectory(fileName: String) -> String? {
        
        guard let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first else {
            return "error"
        }
        return (path as NSString).appendingPathComponent(fileName)
    }
    
    // MARK:- Caches 路径
    ///
    /// - Parameter fileName: fileName
    /// - Returns: Cacher 内文件路径
    static func hq_appendCachesDirectory(fileName: String) -> String? {
    
        guard let path = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).first else {
            return "error"
        }
        return (path as NSString).appendingPathComponent(fileName)
    }
    
    // MARK:- Tmp 路径
    ///
    /// - Parameter fileName: fileName
    /// - Returns: Tmp 内文件路径
    static func hq_appendTmpDirectory(fileName: String) -> String? {
        
        let path = NSTemporaryDirectory()
        return (path as NSString).appendingPathComponent(fileName)
    }
    
    // MARK:- 判断文件是否存在
    static func isExist(atPath filePath : String) -> Bool {
        return FileManager.default.fileExists(atPath: filePath)
    }
    
    // MARK:- 删除文件 或者目录
    static func delete(atPath filePath : String) -> Bool {
        guard isExist(atPath: filePath) else {
            return false
        }
        do {
            try FileManager.default.removeItem(atPath: filePath)
            return true
        } catch  {
            print(error)
            return false
        }
    }
}
