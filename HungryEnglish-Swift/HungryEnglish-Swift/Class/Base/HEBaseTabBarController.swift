//
//  HEBaseTabBarController.swift
//  HungryEnglish-Swift
//
//  Created by gaoyan on 2020/5/19.
//  Copyright © 2020 GY. All rights reserved.
//

import UIKit

class HEBaseTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeViewController()
    }
    
    func makeViewController() -> Void {
        setupChildViewController(childController: HEHomeController(), title: "首页", image: "home", selectedImage: "home_selected")
        setupChildViewController(childController: HEFindController(), title: "发现", image: "find", selectedImage: "find_selected")
        setupChildViewController(childController: HECourseController(), title: "课程", image: "course", selectedImage: "course_selected")
        setupChildViewController(childController: HEMineController(), title: "我的", image: "mine", selectedImage: "mine_selected")

    }
    
    func setupChildViewController(childController: UIViewController, title:String, image:String, selectedImage:String) -> Void {
        childController.title = title;
        //设置图片
        childController.tabBarItem.image = UIImage(named: image)?.withRenderingMode(.alwaysOriginal)
        childController.tabBarItem.selectedImage = UIImage(named: selectedImage)?.withRenderingMode(.alwaysOriginal)
        ///字体颜色
        childController.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : tabbarTitleNormal()], for: UIControl.State.normal)
        childController.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : tabbarTitleSelect()], for: UIControl.State.selected)
        let nav = HEBaseNavigationController(rootViewController: childController)
        addChild(nav)
    }

}
