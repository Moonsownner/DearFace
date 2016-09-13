//
//  MakeFaceLayout.swift
//  DearFace
//
//  Created by J HD on 16/9/10.
//  Copyright © 2016年 Joker. All rights reserved.
//

import UIKit

class MakeFaceLayout: UICollectionViewLayout {
    
    var sz: CGSize = CGSize.zero
    var atts = [IndexPath: UICollectionViewLayoutAttributes]()
    
    override func prepare() {
        guard let collect = self.collectionView else{ return }
        let sections = collect.numberOfSections
        let items = collect.numberOfItems(inSection: 0)
        
        sz = collect.contentSize
        
        let cellWidth = floor(sz.width/CGFloat(sections))
        let cellHeight = floor(sz.height/CGFloat(items))
        
        var x = 0
        var y = 0
        var atts = [UICollectionViewLayoutAttributes]()
        for i in 0..<sections{
            for j in 0..<items{
                let att = UICollectionViewLayoutAttributes(forCellWith: IndexPath(item: j, section: i))
                att.frame = CGRect(x: CGFloat(x)*cellWidth, y: CGFloat(y)*cellHeight, width: cellWidth, height: cellHeight)
                atts.append(att)
                x = (x + 1)
            }
            x = 0
            y = (y + 1)
        }
        for att in atts{
            self.atts[att.indexPath] = att
        }
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return atts[indexPath]
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return Array(self.atts.values)
    }
    
    override var collectionViewContentSize : CGSize {
        return sz
    }
    
}
