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
    
    private let cellId = "cell"
    
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
        layout.scrollDirection = .Horizontal
        layout.headerReferenceSize = CGSizeZero
        layout.footerReferenceSize = CGSizeZero
        layout.sectionInset = UIEdgeInsets(top: ImageSelectItem.padding, left: ImageSelectItem.padding, bottom: ImageSelectItem.padding, right: ImageSelectItem.padding)
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = UIColor.whiteColor()
        collectionView?.registerClass(ImageSelectCell.self, forCellWithReuseIdentifier: cellId)
        
        fetchImage()
    }
    
    func fetchImage(){
        let albums = PHAssetCollection.fetchAssetCollectionsWithType(.SmartAlbum, subtype: .SmartAlbumUserLibrary, options: nil)
        guard let album = albums.firstObject as? PHAssetCollection else{ return }
        
        let options = PHFetchOptions()
        options.predicate = NSPredicate(format: "mediaType = %@", NSNumber(integer: PHAssetMediaType.Image.rawValue))

        let result = PHAsset.fetchAssetsInAssetCollection(album, options: options)
        for asset in result{
            guard let ass = asset as? PHAsset else{ return }
            assets.append(ass)
        }
    }
    
}

extension ImageSelectController{
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return assets.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellId, forIndexPath: indexPath) as! ImageSelectCell
        cell.setBackImage(assets[indexPath.item])
        return cell
    }
    
}
