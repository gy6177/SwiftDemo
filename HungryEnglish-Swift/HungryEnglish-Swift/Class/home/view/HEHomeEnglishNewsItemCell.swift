//
//  HEHomeEnglishNewsItemCell.swift
//  HungryEnglish-Swift
//
//  Created by gaoyan on 2020/5/22.
//  Copyright © 2020 GY. All rights reserved.
//

import UIKit

struct NewsInfo {
    let newsId:String
    let newsCoverUrl: String
    let title: String
    let readNum: String
    let likeNum: String
}

class HEHomeEnglishNewsItemCell: UITableViewCell {

    @IBOutlet weak var newsImg: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var readLabel: UILabel!
    @IBOutlet weak var likeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
