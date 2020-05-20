//
//  HEHomeController.swift
//  HungryEnglish-Swift
//
//  Created by gaoyan on 2020/5/19.
//  Copyright © 2020 GY. All rights reserved.
//

import UIKit
import SnapKit


class HEHomeController: HEBaseController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(headerView)
        headerView.snp.makeConstraints { (make) in
            make.left.right.top.equalToSuperview()
//            make.height.equalTo(565)
        }
        makeNavBar()
        
    }
    
    func makeNavBar() -> Void {
        self.view.addSubview(navBarView)
        navBarView.snp.makeConstraints { (make) in
            make.top.right.left.equalTo(self.view)
            make.height.equalTo(mTopHeight())
        }
        
        navBarView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(kStatusBarHeight())
            make.left.equalToSuperview().offset(20)
            make.width.height.equalTo(mNavigationbarHeight())
        }
        
        navBarView.addSubview(notiBtn)
        notiBtn.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(kStatusBarHeight())
            make.right.equalToSuperview()
            make.height.equalTo(mNavigationbarHeight())
            make.width.equalTo(60)
        }
    }
    
    @objc func jumpMessageAction() -> Void {
        
    }
    
    //MARK: 懒加载
    //一、直接懒加载赋值
    //lazy var str: String = "需要时再调用";
    //二、懒加载赋一个函数
    // lazy var str: String = student.test();
    // static  func test() -> String {
    //    return "需要时再调用"
    // }
    //三、懒加载赋一个闭包
    //1、lazy关键字修饰一个变量就可以实现懒加载
    //2、懒加载的本质是,在第一次使用的时候使用调用，只会赋值一次
    //3、swift开发中因为方式三书写比较简单，因此经常使用闭包的形式进行懒加载
    //懒加载控件
    lazy var navBarView:UIView = {
        let navBarView = UIView()
        navBarView.backgroundColor = UIColor.clear
        return navBarView
    }()
    
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont(name: "PingFang SC Semibold", size: 20)
        titleLabel.text = "首页"
        titleLabel.textAlignment = NSTextAlignment.left
        return titleLabel
    }()
    
    lazy var notiBtn: UIButton = {
        let notiBtn = UIButton(type: .custom)
        notiBtn.setImage(UIImage(named: "message"), for: .normal)
        notiBtn.addTarget(self, action: #selector(jumpMessageAction), for: .touchUpInside)
        return notiBtn
    }()
    
    lazy var headerView: HEHomeHeaderView = {
        let headerView = HEHomeHeaderView.customView()
        headerView.topH.constant = mTopHeight()+6
        return headerView;
    }()
}
