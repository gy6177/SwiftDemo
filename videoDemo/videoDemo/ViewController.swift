//
//  ViewController.swift
//  videoDemo
//
//  Created by gaoyan on 2020/5/19.
//  Copyright © 2020 GY. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate{

    @IBOutlet weak var tableView: UITableView!
    var dataSource = [
    // 给项目编译后属于同一个module，所以Video不需要import就可以使用
        Video(image: "videoScreenshot01",
              title: "Introduce 3DS Mario",
              source: "Youtube - 06:32"),
        Video(image: "videoScreenshot02",
              title: "Emoji Among Us",
              source: "Vimeo - 3:34"),
        Video(image: "videoScreenshot03",
              title: "Seals Documentary",
              source: "Vine - 00:06"),
        Video(image: "videoScreenshot04",
              title: "Adventure Time",
              source: "Youtube - 02:39"),
        Video(image: "videoScreenshot05",
              title: "Facebook HQ",
              source: "Facebook - 10:20"),
        Video(image: "videoScreenshot06",
              title: "Lijiang Lugu Lake",
              source: "Allen - 20:30")
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //MARK: delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "playVideoCell"
        
        ///  从storyBoard创建，读取
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! PlayVideoCell
        let video = dataSource[indexPath.row]

        cell.videoImageView.image = UIImage(named: video.image)
        cell.videoTitleLabel.text = video.title
        cell.videoSourceLabel.text = video.source
        
        return cell
    }
}

