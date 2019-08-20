
//
//  ExtensionTextField.swift
//  RS
//
//  Created by Aalto on 2019/6/29.
//  Copyright © 2019 aa. All rights reserved.
//

import UIKit

extension UITextField {
    
    /// 占位文字 + 边框样式(Optional) + 是否是密文(Optional)
    ///
    /// - Parameters:
    ///   - hq_placeholder: hq_placeholder
    ///   - border: border
    ///   - isSecureText: isSecureText
    convenience init(hq_placeholder: String, border: UITextField.BorderStyle = .none, isSecureText: Bool = false) {
        self.init()
        
        placeholder = hq_placeholder
        borderStyle = border
        clearButtonMode = .whileEditing
        isSecureTextEntry = isSecureText
    }
}
