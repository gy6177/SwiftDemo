//
//  PlayVideoCell.swift
//  videoDemo
//
//  Created by gaoyan on 2020/5/19.
//  Copyright © 2020 GY. All rights reserved.
//

import UIKit

//// 定义Video的结构体，属性初始化后不能被改变，因为结构体时值类型。
//// 在你每次定义一个新类或者结构体的时候，实际上你是定义了一个新的 Swift 类型。
//// 因此请使用UpperCamelCase这种方式来命名
//struct Video {
//    let image: String
//    let title: String
//    let source: String
//}

class Video: NSObject {
    let image: String = ""
    let title: String = ""
    let source: String = ""
}

////无参无返回值
//typealias funcBlock = () -> () //或者 () -> Void
////返回值是String
//typealias funcBlockA = (Int,Int) -> String
////返回值是一个函数指针，入参为String
//typealias funcBlockB = (Int,Int) -> (String)->()
////返回值是一个函数指针，入参为String 返回值也是String
//typealias funcBlockC = (Int,Int) -> (String)->String
typealias PlayVideoBlock = (Video) -> ()

class PlayVideoCell: UITableViewCell {

    @IBOutlet weak var videoImageView: UIImageView!
    @IBOutlet weak var videoSourceLabel: UILabel!
    @IBOutlet weak var videoTitleLabel: UILabel!
    @IBOutlet weak var playBtn: UIButton!
    
    var playBlock:(Video) -> () = {param in}
    var video = Video()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func palyVideoAction(_ sender: UIButton) {
        self.playBlock(video)
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
