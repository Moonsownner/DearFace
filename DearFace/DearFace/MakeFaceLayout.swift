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
    
    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareLayout() {
        guard let collect = self.collectionView else{ return }
        let sections = collect.numberOfSections()
        let sz = collect.bounds.size
        let width = sz.width + 200
        let shortside = floor(width/100.0)
        let cellside = width/shortside
        
        var x = 0
        var y = 0
        var atts = [UICollectionViewLayoutAttributes]()
        for i in 0..<sections{
            let items = collect.numberOfItemsInSection(i)
            for j in 0..<items{
                let att = UICollectionViewLayoutAttributes(forCellWithIndexPath: NSIndexPath(forItem: j, inSection: i))
                att.frame = CGRectMake(CGFloat(x)*cellside, CGFloat(y)*cellside, cellside, cellside)
                atts.append(att)
                x = x.successor()
                if CGFloat(x) >= shortside{
                    x = 0
                    y = y.successor()
                }
            }
        }
        for att in atts{
            self.atts[att.indexPath] = att
        }
        let fluff = (x == 0) ? 0 : 1
        self.sz = CGSizeMake(width, CGFloat(y + fluff)*cellside)
    }
    
    override func layoutAttributesForItemAtIndexPath(indexPath: NSIndexPath) -> UICollectionViewLayoutAttributes? {
        return atts[indexPath]
    }
    
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return Array(self.atts.values)
    }
    
    override func collectionViewContentSize() -> CGSize {
        print(sz)
        return sz
    }
    
}
