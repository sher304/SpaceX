//
//  Dynamic.swift
//  SpaceX
//
//  Created by Шермат Эшеров on 19/8/22.
//

import Foundation


class Dynamic<T>{
    
    typealias Listener = (T) -> Void
    var listener: Listener?
    
    func bind(_ listener: Listener?){
        self.listener = listener
    }
    
    var value: T{
        didSet{
            self.listener?(value)
        }
    }
    
    init(_ v: T){
        self.value = v
    }
    
}
