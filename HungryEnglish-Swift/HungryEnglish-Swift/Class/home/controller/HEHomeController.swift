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
        
        makeTableViewUI()
//        view.addSubview(headerView)
//        headerView.snp.makeConstraints { (make) in
//            make.left.right.top.equalToSuperview()
//        }

        makeNavBar()
        
    }
    
    func makeTableViewUI() -> Void {
        view.addSubview(myTableView)
        myTableView.snp.makeConstraints { (make) in
            make.left.right.equalTo(self.view)
            make.top.equalTo(self.view).offset(-kStatusBarHeight())
            make.bottom.equalTo(self.view.snp_bottom).offset(-kBottomHeight())
        }
        
        myTableView.tableHeaderView = headerView
        headerView.snp_makeConstraints { (make) in
            make.left.top.right.equalToSuperview()
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        sizeHeaderToFit()
    }
    ///修改tableview的tableHeaderView的高度
     func sizeHeaderToFit() {
            let headerView = myTableView.tableHeaderView!
            
            headerView.setNeedsLayout()
            // 立马布局子视图
            headerView.layoutIfNeeded()
        
        let height = headerView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
            var frame = headerView.frame
        frame.size.height = height
            headerView.frame = frame
            
            // 重新设置tableHeaderView
            myTableView.tableHeaderView = headerView
        }
    
    func makeNavBar() -> Void {
        view.addSubview(navBarView)
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
    
    lazy var myTableView: UITableView = {
        let myTableView = UITableView()
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.backgroundColor = UIColor.clear
        myTableView.separatorStyle = .none
        return myTableView
    }()
}

extension HEHomeController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "homeCell")
        cell.textLabel?.text = "1"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 7.5
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
}

// MARK: - UIScrollViewDelegate
extension HEHomeController {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == myTableView {
            let point = scrollView.contentOffset;
            if point.y > -kStatusBarHeight() {
                navBarView.backgroundColor = HERGBColor(red: 255, green: 184, blue: 63)
            }else{
                navBarView.backgroundColor = UIColor.clear
            }
        }
    }
}
