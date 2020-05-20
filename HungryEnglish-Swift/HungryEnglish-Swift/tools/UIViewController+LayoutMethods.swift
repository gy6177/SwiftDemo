//
//  UIViewController+LayoutMethods.swift
//  HungryEnglish-Swift
//
//  Created by gaoyan on 2020/5/20.
//  Copyright © 2020 GY. All rights reserved.
//
import UIKit

extension UIViewController {
    
    func mNavigationbarHeight() -> CGFloat {
        return (self.navigationController?.navigationBar.frame.size.height)!
    }
    
    func mTopHeight() -> CGFloat {
        return (self.navigationController?.navigationBar.frame.size.height)! + kStatusBarHeight()
    }
    
    func mTabbarHeight() -> CGFloat {
        return (self.tabBarController?.tabBar.bounds.size.height)!
    }
}

// 切圆角相应的处理操作
extension UIView {
     /// 切圆角处理操作
    ///
    /// - Parameters:
    ///   - width: UIView 宽度
    ///   - height: UIView 高度
    ///   - corners: UIRectCorner 传递枚举数组 [] 例如： [UIRectCorner.topRight, .topLeft]
    ///   - cornerRadii: CGSize 类型
    func clickCorner(width: CGFloat, height: CGFloat, corners: UIRectCorner, cornerRadii: CGSize) {
        let maskBezier = UIBezierPath(roundedRect: CGRect.init(x: 0, y: 0, width: width, height: height), byRoundingCorners: corners, cornerRadii: cornerRadii)
        let maskLayer = CAShapeLayer.init()
        maskLayer.frame = CGRect.init(x: 0, y: 0, width: width, height: height)
        maskLayer.path = maskBezier.cgPath
        self.layer.mask = maskLayer
    }
}
