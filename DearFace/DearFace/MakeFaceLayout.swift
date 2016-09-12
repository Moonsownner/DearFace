//
//  MakeFaceLayout.swift
//  DearFace
//
//  Created by J HD on 16/9/10.
//  Copyright © 2016年 Joker. All rights reserved.
//

import UIKit

class MakeFaceLayout: UICollectionViewLayout {
    
    var sz: CGSize = CGSizeZero
    var atts = [NSIndexPath: UICollectionViewLayoutAttributes]()
    
    override func prepareLayout() {
        guard let collect = self.collectionView else{ return }
        let sections = collect.numberOfSections()
        let items = collect.numberOfItemsInSection(0)
        
        sz = collect.contentSize
        
        let cellWidth = floor(sz.width/CGFloat(sections))
        let cellHeight = floor(sz.height/CGFloat(items))
        
        var x = 0
        var y = 0
        var atts = [UICollectionViewLayoutAttributes]()
        for i in 0..<sections{
            for j in 0..<items{
                let att = UICollectionViewLayoutAttributes(forCellWithIndexPath: NSIndexPath(forItem: j, inSection: i))
                att.frame = CGRectMake(CGFloat(x)*cellWidth, CGFloat(y)*cellHeight, cellWidth, cellHeight)
                atts.append(att)
                x = x.successor()
            }
            x = 0
            y = y.successor()
        }
        for att in atts{
            self.atts[att.indexPath] = att
        }
    }
    
    override func layoutAttributesForItemAtIndexPath(indexPath: NSIndexPath) -> UICollectionViewLayoutAttributes? {
        return atts[indexPath]
    }
    
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return Array(self.atts.values)
    }
    
    override func collectionViewContentSize() -> CGSize {
        return sz
    }
    
}
