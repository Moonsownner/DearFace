//
//  Observable.swift
//  DearFace
//
//  Created by J HD on 9/1/16.
//  Copyright © 2016 Joker. All rights reserved.
//

import Foundation

struct Observable<T> {
    
    //MARK: something left to optimize, only the new Observer need to execute
    typealias Observer = (T) -> Void
    var observers: [String: Observer]{
        didSet{
            observers.values.forEach{ $0(value) }
        }
    }
    
    var value: T{
        didSet{
            observers.values.forEach{ $0(value) }
        }
    }
    
    init(value: T){
        self.value = value
        self.observers = [:]
    }

}
