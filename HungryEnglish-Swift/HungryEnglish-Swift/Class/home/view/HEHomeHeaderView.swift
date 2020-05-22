//
//  HEHomeHeaderView.swift
//  HungryEnglish-Swift
//
//  Created by gaoyan on 2020/5/20.
//  Copyright © 2020 GY. All rights reserved.
//

import UIKit
import Kingfisher

struct HomeCategory {
    let name:String
    let imageStr: String
}

class HEHomeHeaderView: UIView {
    
//    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var firstTitleLabel: UILabel!
    @IBOutlet weak var firstTimeLabel: UILabel!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var secondTitleLabel: UILabel!
    @IBOutlet weak var secondTimeLabel: UILabel!
    @IBOutlet weak var bannerView: ZCycleView!
    @IBOutlet weak var categoryView: UIView!
    @IBOutlet weak var topH: NSLayoutConstraint!
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    private var reuseIdentifier: String = "HEHomeCategoryCell"
//    private var categoryArray: Array<HomeCategory?> = []

    lazy var categoryArray: [HomeCategory] = {
        () -> [HomeCategory] in
        
        return [HomeCategory(name: "听力", imageStr: "listening"),HomeCategory(name: "口语", imageStr: "speaking"),HomeCategory(name: "阅读", imageStr: "reading"),HomeCategory(name: "写作", imageStr: "writing"),HomeCategory(name: "背单词", imageStr: "reciting"),HomeCategory(name: "句子翻译", imageStr: "sentenceTranslation"),HomeCategory(name: "词伙库", imageStr: "collocation"),HomeCategory(name: "观点库", imageStr: "opinion")]
    }()
    
    
    static func customView() -> HEHomeHeaderView {
        return Bundle.main.loadNibNamed("HEHomeHeaderView", owner: nil, options: nil)?.first as! HEHomeHeaderView
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        let corners: UIRectCorner = .bottomRight
//        bgView.clickCorner(corners: corners, cornerRadii: CGSize(width: 10,height: 10))
        bannerView.setImagesGroup([UIImage(named: "编组 2(1)"),UIImage(named: "编组 21")])
        bannerView.delegate = self;
        self.layer.cornerRadius = 8.5

        makeCategoryView()
    }
    
    func makeCategoryView() -> Void {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: 76, height: 108)
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.minimumLineSpacing = 0
        
        categoryCollectionView.collectionViewLayout = flowLayout
        categoryCollectionView.backgroundColor = UIColor.clear
        categoryCollectionView.isScrollEnabled = false
        categoryCollectionView.showsVerticalScrollIndicator = false
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        let customNib = UINib.init(nibName: "HEHomeCategoryCell", bundle: nil)
        categoryCollectionView.register(customNib, forCellWithReuseIdentifier: reuseIdentifier)
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
        pageControl.dotSize = CGSize(width: 8, height: 4)
        pageControl.currentDotSize = CGSize(width: 12, height: 4)
        pageControl.spacing = 5
        pageControl.dotRadius = 2.5
        pageControl.currentDotRadius = 2.5
        pageControl.pageIndicatorTintColor = HERGBColorAlpha(red: 255, green: 168, blue: 0, alpha: 0.19)
        pageControl.currentPageIndicatorTintColor = HERGBColor(red: 255, green: 168, blue: 0)
    }
    
}

extension HEHomeHeaderView: UICollectionViewDelegate,UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! HEHomeCategoryCell
        let category = categoryArray[indexPath.item]
        cell.nameLabel.text = category.name
        cell.iconImageView.image = UIImage(named: category.imageStr)
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
}
