//
//  HEHomeHeaderView.swift
//  HungryEnglish-Swift
//
//  Created by gaoyan on 2020/5/20.
//  Copyright © 2020 GY. All rights reserved.
//

import UIKit
import Kingfisher

class HEHomeHeaderView: UIView {
    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var firstTitleLabel: UILabel!
    @IBOutlet weak var firstTimeLabel: UILabel!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var secondTitleLabel: UILabel!
    @IBOutlet weak var secondTimeLabel: UILabel!
    @IBOutlet weak var bannerView: ZCycleView!
    @IBOutlet weak var categoryView: UIView!
    @IBOutlet weak var topH: NSLayoutConstraint!
    
    static func customView() -> HEHomeHeaderView {
        return Bundle.main.loadNibNamed("HEHomeHeaderView", owner: nil, options: nil)?.first as! HEHomeHeaderView
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        bgView.clickCorner(width: bgView.frame.size.width, height: bgView.frame.size.height, corners: [UIRectCorner.bottomLeft,UIRectCorner.bottomRight], cornerRadii: CGSize(width: 10,height: 10))
        bannerView.delegate = self;
        
    }
    
    func makeCategoryView() -> Void {
        
    }
    
    
}

extension HEHomeHeaderView: ZCycleViewProtocol{
    
    func cycleViewConfigureDefaultCellImage(_ cycleView: ZCycleView, imageView: UIImageView, image: UIImage?, index: Int) {
        imageView.image = image
    }

    func cycleViewConfigureDefaultCellImageUrl(_ cycleView: ZCycleView, imageView: UIImageView, imageUrl: String?, index: Int) {
        imageView.kf.setImage(with: URL(string: imageUrl ?? ""), placeholder: UIImage(named: ""))
    }

    func cycleViewConfigurePageControl(_ cycleView: ZCycleView, pageControl: ZPageControl) {
        pageControl.pageIndicatorTintColor = HERGBColor(red: 255, green: 168, blue: 0)
        pageControl.currentPageIndicatorTintColor = HERGBColorAlpha(red: 255, green: 168, blue: 0, alpha: 0.19)
        pageControl.alignment = .center
    }

}
