//
//  PHFetchResult.swift
//  DearFace
//
//  Created by J HD on 16/9/9.
//  Copyright © 2016年 Joker. All rights reserved.
//

import Photos

extension PHFetchResult: SequenceType {
    
    public func generate() -> NSFastGenerator {
        return NSFastGenerator(self)
    }
    
}
