//
//  ExtensionColor.swift
//  RS
//
//  Created by Aalto on 2019/6/29.
//  Copyright © 2019 aa. All rights reserved.
//

import UIKit
private typealias RotateAnimation = UIView
extension RotateAnimation {
    func rotateAnimation(_ toValue: CGFloat, duration: CFTimeInterval = 0.2, completionDelegate: AnyObject? = nil) {
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotateAnimation.toValue = toValue
        rotateAnimation.duration = duration
        rotateAnimation.isRemovedOnCompletion = false
        rotateAnimation.fillMode = .forwards
        self.layer.add(rotateAnimation, forKey: nil)
    }
}

private typealias CubeAnimation = UIView
extension CubeAnimation {
    func cubeAnimation() -> CATransition {
        let animate = CATransition.init()
        animate.duration = 0.3
        animate.timingFunction = CAMediaTimingFunction.init(name: .easeIn)
        animate.type =  CATransitionType(rawValue: "cube")
        //立方体效果
    
        //设置动画子类型
        animate.subtype = .fromTop
        return animate
    }
}
