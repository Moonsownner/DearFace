//
//  MakeFaceCell.swift
//  DearFace
//
//  Created by J HD on 9/1/16.
//  Copyright © 2016 Joker. All rights reserved.
//

import UIKit

class MakeFaceCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.clear
        
        layer.borderColor = UIColor.cyan.cgColor
        layer.borderWidth = OneWidth
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
