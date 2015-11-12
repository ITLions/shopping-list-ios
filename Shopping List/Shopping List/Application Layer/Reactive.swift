//
//  Reactive.swift
//  Shopping List
//
//  Created by Pavel Gatilov on 11/11/15.
//  Copyright © 2015 Pavel Gatilov. All rights reserved.
//

class Signal<T> {
    typealias ValueClosure = (value: T) -> ()
    
    private var observers: Array<ValueClosure>
    
    init() {
        observers = [ValueClosure]()
    }
    
    func next(value: ValueClosure) {
        self.observers.append(value)
    }
    
    func fire(value: T) {
        for observer in self.observers {
            observer(value: value)
        }
    }
}