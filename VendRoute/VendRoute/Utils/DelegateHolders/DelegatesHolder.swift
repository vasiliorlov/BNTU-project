//
//  DelegatesHolder.swift
//  RouteDriver
//
//  Created by Andy Tamilo on 3/12/18.
//  Copyright © 2018 Stylesoft. All rights reserved.
//

import Foundation



class DelegatesHolder<T: AnyObject> {
    
    typealias DelegateNotifyBlock = (_ delegate: T) -> Void
    
    private var delegates: [Weak<T>] = [Weak<T>]()
    
    func isAlreadyAdded(_ delegate: T) -> Bool {
        for delegateHolder in delegates {
            if delegateHolder.weakObject === delegate {
                return true
            }
        }
        return false
    }
    
    func addDelegate(_ delegate: T) {
        guard !isAlreadyAdded(delegate) else {
            return
        }
            
        let wrapper = Weak(object: delegate)
        delegates.append(wrapper)
        removeEmptyDelegates()
    }
    
    func removeDelegate(_ delegate: T) {
        let index = delegates.firstIndex { (obj: Weak) -> Bool in
            return obj.weakObject === delegate
        }
        if let index = index {
            delegates.remove(at: index)
        }
        removeEmptyDelegates()
    }
    
    func removeAll() {
        delegates.removeAll()
    }
    
    private func removeEmptyDelegates() {
        for i in (0..<delegates.count).reversed() {
            let obj = delegates[i]
            if obj.weakObject == nil {
                delegates.remove(at: i)
            }
        }
    }
    
    func notifyDelegates(_ block: DelegateNotifyBlock) {
        removeEmptyDelegates()
        for delegateHolder in self.delegates {
            if let delegate = delegateHolder.weakObject {
                block(delegate)
            }
        }
    }
}
