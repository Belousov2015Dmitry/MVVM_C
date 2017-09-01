//
//  Observable.swift
//  MVVM_C
//
//  Created by developer on 01.09.17.
//  Copyright © 2017 burunduk. All rights reserved.
//

import Foundation


typealias Observer<T> = (T) -> ()



class Binding<T>
{
    weak var target: AnyObject?
    var observer: Observer<T>
    
    
    required init(target: AnyObject, observer: @escaping Observer<T>) {
        self.target = target
        self.observer = observer
    }
}



class Observable<V>
{
    var value: V {
        didSet {
            observers.forEach { (binding) in
                binding.observer(value)
            }
        }
    }
    private var observers: [Binding<V>] = []
    
    
    required init(_ value: V) {
        self.value = value
    }
    
    
    func addObserver<T : AnyObject>(_ target: T, observer: @escaping Observer<V>) {
        let index = observers.index { (binding) -> Bool in
            binding.target === target
        }
        
        if index == nil {
            observers.append( Binding(target: target, observer: observer) )
        }
        else {
            observers[index!].observer = observer
        }
    }
    
    func removeObserver<T : AnyObject>(_ target: T) {
        guard
            let index = observers.index(where: { (binding) -> Bool in
                binding.target === target
            })
        else { return }
        
        observers.remove(at: index)
    }
}
