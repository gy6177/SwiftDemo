//
//  HEColorManager.swift
//  HungryEnglish-Swift
//
//  Created by gaoyan on 2020/5/19.
//  Copyright © 2020 GY. All rights reserved.
//

import UIKit

func HERGBColor(red:CGFloat, green:CGFloat, blue:CGFloat) -> UIColor {
    
    return UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: 1)
}

func HERGBColorAlpha(red:CGFloat, green:CGFloat, blue:CGFloat, alpha: CGFloat) -> UIColor {
    
    return UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: alpha)
}

func tabbarTitleNormal() -> UIColor {
    return HERGBColor(red: 204, green: 204, blue: 204)
}

func tabbarTitleSelect() -> UIColor {
    return HERGBColor(red: 255, green: 184, blue: 63)
}

func navBarBgColor() -> UIColor {
    return UIColor.white
}

func navBarTitleColor() -> UIColor {
    return HERGBColor(red: 51, green: 51, blue: 51)
}


