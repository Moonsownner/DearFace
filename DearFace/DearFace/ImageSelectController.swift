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
    
    lazy var longPress: UILongPressGestureRecognizer = {
        let gesture = UILongPressGestureRecognizer()
        gesture.addTarget(self, action: Selector(("longPressAction")))
        return gesture
    }()
    
    var assets = [PHAsset](){
        didSet{
            self.collectionView?.reloadData()
        }
    }
    
    init(){
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = ImageSelectItem.padding
        layout.minimumInteritemSpacing = ImageSelectItem.padding
        layout.itemSize = ImageSelectItem.size
        layout.scrollDirection = .horizontal
        layout.headerReferenceSize = CGSize.zero
        layout.footerReferenceSize = CGSize.zero
        layout.sectionInset = UIEdgeInsets(top: ImageSelectItem.padding, left: ImageSelectItem.padding, bottom: ImageSelectItem.padding, right: ImageSelectItem.padding)
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = UIColor.white
        collectionView?.register(ImageSelectCell.self, forCellWithReuseIdentifier: cellId)
        
        fetchImage()
    }
    
    func fetchImage(){
        let albums = PHAssetCollection.fetchAssetCollections(with: .smartAlbum, subtype: .smartAlbumUserLibrary, options: nil)
        guard let album = albums.firstObject else{ return }
        
        let options = PHFetchOptions()
        options.predicate = NSPredicate(format: "mediaType = %@", NSNumber(value: PHAssetMediaType.image.rawValue as Int))

        let result = PHAsset.fetchAssets(in: album, options: options)
//        for asset in result{
//            guard let ass = asset as? PHAsset else{ return }
//            assets.append(ass)
//        }
    }
    
}

extension ImageSelectController{
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return assets.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ImageSelectCell
        cell.setBackImage(assets[(indexPath as NSIndexPath).item])
        return cell
    }
    
}
