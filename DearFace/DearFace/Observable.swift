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
    var observers: [Observer]{
        didSet{
            observers.forEach{ $0(value) }
        }
    }
    
    var value: T{
        didSet{
            observers.forEach{ $0(value) }
        }
    }
    
    init(value: T){
        self.value = value
        self.observers = []
    }

}