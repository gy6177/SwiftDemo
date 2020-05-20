//
//  HEBaseController.swift
//  HungryEnglish-Swift
//
//  Created by gaoyan on 2020/5/19.
//  Copyright © 2020 GY. All rights reserved.
//

import UIKit

class HEBaseController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = HERGBColor(red: 244, green: 245, blue: 248)
    }
}

//extension UIViewController {
//
//    func mNavigationbarHeight() -> CGFloat {
//        return (self.navigationController?.navigationBar.frame.size.height)!
//    }
//
//    func mTopHeight() -> CGFloat {
//        return (self.navigationController?.navigationBar.frame.size.height)! + kStatusBarHeight()
//    }
//
//    func mTabbarHeight() -> CGFloat {
//        return (self.tabBarController?.tabBar.bounds.size.height)!
//    }
//}

