//
//  HEBaseNavigationController.swift
//  HungryEnglish-Swift
//
//  Created by gaoyan on 2020/5/20.
//  Copyright © 2020 GY. All rights reserved.
//

import UIKit

class HEBaseNavigationController: UINavigationController {

    var popDelegate:UIGestureRecognizerDelegate?

//    override func initialize() {
//        setupNavigationBarTheme()
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBarTheme()
        popDelegate  = self.interactivePopGestureRecognizer?.delegate
        
        self.delegate = self;
    }
    
    /**
    *  设置UIBarButtonItem的主题
    */
    func setupNavigationBarTheme() -> Void {
        let appearance = UINavigationBar.appearance()
        appearance.barTintColor = navBarBgColor()
        appearance.tintColor = UIColor.black
        
        ///设置字体
        let att = NSMutableDictionary()
        att[NSAttributedString.Key.font] = UIFont(name: "苹方-简 中黑体", size: 17);
        att[NSAttributedString.Key.foregroundColor] = navBarTitleColor();
        appearance.titleTextAttributes = att as? [NSAttributedString.Key : Any];
        
    }

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {

        if self.viewControllers.count > 0 {
            ///如果现在push的不是栈底控制器(最先push进来的那个控制器)
            viewController.hidesBottomBarWhenPushed = true
            //设置导航栏的按钮
            let backItem = UIBarButtonItem(image: UIImage(named: "system-backnew"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(back))
            self.navigationItem.leftBarButtonItem = backItem;
            // 就有滑动返回功能
            self.interactivePopGestureRecognizer!.delegate = nil
        }
        super.pushViewController(viewController, animated: animated)
    }
    
    @objc func back() -> Void {
        self.popViewController(animated: true)
    }
    
    
}

//MARK:- UINavigationControllerDelegate
// 知识点：扩展
// 扩展和 Objective-C 中的分类类似，但没有名称
// 扩展可以为一个类型添加新的功能，但是不能重写已有的功能。
// 扩展可以添加新的计算型属性，但是不可以添加存储型属性，也不可以为已有属性添加属性观察器。
extension HEBaseNavigationController: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        // 如果展示的控制器是根控制器，就还原pop手势代理
        if viewController == self.viewControllers.first {
            self.interactivePopGestureRecognizer?.delegate = popDelegate
        }
    }
}
