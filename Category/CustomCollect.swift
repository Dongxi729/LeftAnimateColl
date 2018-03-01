//
//  CustomCollectV
//  TimeStamp
//
//  Created by 郑东喜 on 2017/8/11.
//  Copyright © 2017年 郑东喜. All rights reserved.
//  自定义CollectionView

import UIKit

protocol CustomCollectDelegate {
    /// 选择的cell
    func selectCell(_ indexPath : IndexPath)
}

class CustomCollect : UIView,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    var delegate : CustomCollectDelegate?
    
    /// collectionView布局
    lazy var layout: UICollectionViewFlowLayout = {
        let d: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        d.scrollDirection = .vertical
        return d
    }()
    
    var customIndex : IndexPath!
    
    /// UICollectionView
    lazy var collecTTC: UICollectionView = {

        let d : UICollectionView = UICollectionView.init(frame: self.bounds, collectionViewLayout: self.layout)
        d.delegate = self
        d.dataSource = self
        d.backgroundColor = .gray
        d.register(MyTestCollectionViewCell.self, forCellWithReuseIdentifier: "MyTestCollectionViewCell")
        return d
    }()
    
    /// 标题数组
    var titles : [String] = []
    
    /// 图片数组
    var imgs : [String] = []
    
    /// 多少个collectionView
    var cells : Int = 0
    
    /// uicollectionViewFlowLayout 中itemSize 的大小
    var cellItemSize : CGSize = CGSize.init()
    
    /// 初始化collectionView
    ///
    /// - Parameters:
    ///   - titles: 数组
    ///   - imgs: 图片名字数组
    ///   - rect: 大小
    ///   - cellItemSize: cellItemSize  的大小
    init(_ titles :[String],_ imgs : [String],_ rect : CGRect,_ cellItemSize :CGSize) {

        super.init(frame: rect)
        self.cells = titles.count
        self.titles = titles
        self.imgs = imgs
        self.layout.itemSize = CGSize.init(width: cellItemSize.width, height: cellItemSize.height)
        addSubview(collecTTC)
    }
    
    // MARK: - UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewFlowLayout
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyTestCollectionViewCell", for: indexPath) as! MyTestCollectionViewCell
        
        self.customIndex = indexPath
        cell.myLabel.text = titles[indexPath.row]
        if imgs.count > 0 {
            cell.myImageView.image = UIImage.init(named: imgs[indexPath.row])
        }
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.delegate?.selectCell(indexPath)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


class MyTestCollectionViewCell: UICollectionViewCell {
    
    lazy var myLabel: UILabel = {
        let label = UILabel.init(frame: CGRect.init(x: 0, y: self.Height * 0.6 + COMMON_MARGIN / 2, width: self.Width, height: self.Height * 0.3))
        label.text = "我的小标题"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 13)
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.yellow.cgColor
        return label
    }()

    lazy var myImageView: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: self.Width, height: self.Height * 0.6))
        d.contentMode = UIViewContentMode.scaleAspectFit
        return d
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(myImageView)
        contentView.addSubview(myLabel)
        backgroundColor = .red
        layer.borderWidth = 1
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

