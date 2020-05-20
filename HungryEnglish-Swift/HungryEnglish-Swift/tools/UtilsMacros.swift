//
//  UtilsMacros.swift
//  HungryEnglish-Swift
//
//  Created by gaoyan on 2020/5/20.
//  Copyright © 2020 GY. All rights reserved.
//

//import Foundation
import UIKit

let kScreenW = UIScreen.main.bounds.size.width
let kScreenH = UIScreen.main.bounds.size.height
//let kNavBarHeight = 44.0

func kStatusBarHeight() -> CGFloat {
    if #available(iOS 13.0, *) {

        return UIApplication.shared.windows.first?.windowScene?.statusBarManager?.statusBarFrame.size.height ?? 0.0
    }else{
        return UIApplication.shared.statusBarFrame.size.height
    }
}

    
func kBottomHeight() -> CGFloat {
    var navh:CGFloat = 0.0
    if #available(iOS 11.0, *) {
        // 不能用 keywindow，会有崩溃的风险
        navh += UIApplication.shared.delegate?.window?!.safeAreaInsets.bottom ?? 0.0;
    }else{
        
        navh += 0
    }
    
    return navh

}
