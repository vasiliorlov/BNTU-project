//
//  Weak.swift
//  RouteDriver
//
//  Created by Andy Tamilo on 1/20/18.
//  Copyright © 2018 Stylesoft. All rights reserved.
//

class Weak<T: AnyObject> {
    weak var weakObject: T?
    
    init(object: T) {
        weakObject = object
    }
}
