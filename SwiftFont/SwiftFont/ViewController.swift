//
//  ViewController.swift
//  SwiftFont
//
//  Created by gaoyan on 2020/5/19.
//  Copyright © 2020 GY. All rights reserved.
//

import UIKit

class ViewController: UIViewController  , UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var changeFontLB: UILabel!
    
    var data = ["30 Days Swift", "这些字体特别适合打「奋斗」和「理想」",
                "谢谢「造字工房」，本案例不涉及商业使用", "使用到造字工房劲黑体，致黑体，童心体",
                "呵呵，再见🤗 See you next Project", "微博 @Allen朝辉",
                "测试测试测试测试测试测试", "123", "Alex", "@@@@@@"]
    
    var fontNames = ["MFTongXin_Noncommercial-Regular",
                     "MFZhiHei_Noncommercial-Regular",
                     "MFJinHei_Noncommercial-Regular",
                     "Zapfino",
                     "Gaspar Regular"]
    var fontRowIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        changeFontLB.isUserInteractionEnabled = true
        let tapGes = UITapGestureRecognizer(target: self, action: #selector(changeFontClick))
        changeFontLB.addGestureRecognizer(tapGes)
        
    }
    
    @objc func changeFontClick() -> Void {
        if fontRowIndex == fontNames.count-1 {
            fontRowIndex = 0;
        }else{
            fontRowIndex = fontRowIndex + 1
        }
        print(fontNames[fontRowIndex])
        tableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count;
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "FontCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        cell.textLabel?.textColor = UIColor.black
        cell.textLabel?.font = UIFont(name: fontNames[fontRowIndex], size: 16)
        return cell
    }
    
}

