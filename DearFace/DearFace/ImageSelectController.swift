//
//  ImageSelectController.swift
//  DearFace
//
//  Created by J HD on 16/9/9.
//  Copyright © 2016年 Joker. All rights reserved.
//

import UIKit
import Photos

class ImageSelectController: UICollectionViewController {
    
    fileprivate let cellId = "cell"
    
//    lazy var longPress: UILongPressGestureRecognizer = {
//        let gesture = UILongPressGestureRecognizer()
//        gesture.addTarget(self, action: Selector("longPressAction"))
//        return gesture
//    }()
    
    init(){
        let layout = ImageSelectLayout(assets: Photo.assets)
        
        
//        let layout = UICollectionViewFlowLayout()
//        layout.minimumLineSpacing = ImageSelectItem.padding
//        layout.minimumInteritemSpacing = ImageSelectItem.padding
//        layout.itemSize = ImageSelectItem.size
//        layout.scrollDirection = .horizontal
//        layout.headerReferenceSize = CGSize.zero
//        layout.footerReferenceSize = CGSize.zero
//        layout.sectionInset = UIEdgeInsets(top: ImageSelectItem.padding, left: ImageSelectItem.padding, bottom: ImageSelectItem.padding, right: ImageSelectItem.padding)
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = UIColor.white
        collectionView?.register(ImageSelectCell.self, forCellWithReuseIdentifier: cellId)
    }
    
}

extension ImageSelectController{
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Photo.assets.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ImageSelectCell
        cell.setBackImage(Photo.assets[indexPath.item])
        return cell
    }
    
}
