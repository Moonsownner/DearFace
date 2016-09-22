//
//  ImageSelectLayout.swift
//  DearFace
//
//  Created by J HD on 16/9/22.
//  Copyright © 2016年 Joker. All rights reserved.
//

import UIKit
import Photos

class ImageSelectLayout: UICollectionViewLayout {
    
    ///所有cell的宽
    let widths: [CGFloat]
    
    var atts = [IndexPath: UICollectionViewLayoutAttributes]()
    var sz = CGSize.zero
    
    weak var delegate: ImageSelectController?
    
    init(assets: [PHAsset]) {
        var rs = [CGFloat]()
        for item in assets{
            rs.append(ImageSelectItem.height*CGFloat(item.pixelWidth)/CGFloat(item.pixelHeight))
        }
        self.widths = rs
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepare() {
        guard let collect = collectionView else{ return }
        
        //only one section
        let items = collect.numberOfItems(inSection: 0)
        
        var x: CGFloat = 0
        var atts = [UICollectionViewLayoutAttributes]()
        for j in 0..<items{
            x = x + ImageSelectItem.padding
            let att = UICollectionViewLayoutAttributes(forCellWith: IndexPath(item: j, section: 0))
            att.frame = CGRect(x: x, y: ImageSelectItem.padding, width: widths[j], height: ImageSelectItem.height)
            atts.append(att)
            x = x + widths[j]
        }
        for att in atts{
            self.atts[att.indexPath] = att
        }
        
        sz = CGSize(width: x + ImageSelectItem.padding, height: ImageSelectItem.rowHeight)
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return atts[indexPath]
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return Array(self.atts.values)
    }
    
    override var collectionViewContentSize: CGSize{
        return sz
    }
    
    override func invalidationContext(forInteractivelyMovingItems targetIndexPaths: [IndexPath], withTargetPosition targetPosition: CGPoint, previousIndexPaths: [IndexPath], previousPosition: CGPoint) -> UICollectionViewLayoutInvalidationContext {
        let context = super.invalidationContext(forInteractivelyMovingItems: targetIndexPaths, withTargetPosition: targetPosition, previousIndexPaths: previousIndexPaths, previousPosition: previousPosition)
        self.delegate?.collectionView(self.collectionView!, moveItemAt: previousIndexPaths[0], to: targetIndexPaths[0])
        return context
    }
    
}
