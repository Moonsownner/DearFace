//
//  Observable.swift
//  DearFace
//
//  Created by J HD on 9/1/16.
//  Copyright © 2016 Joker. All rights reserved.
//

import Foundation

struct Observable<T> {
    
    typealias Observer = T -> Void
    var observer: Observer?{
        didSet{
            observer?(value)
        }
    }
    
    var value: T{
        didSet{
            observer?(value)
        }
    }
    
    init(value: T, observer: Observer? = nil){
        self.value = value
        self.observer = observer
    }

}