//
//  PosDetailViewModel.swift
//  VendRoute
//
//  Created by Vasili Orlov on 24/08/20.
//  Copyright © 2020 Vasili Orlov. All rights reserved.
//

import UIKit

class PosDetailViewModel {
    let name: String    
    var isCollect: Bool?
    var isInventory: Bool?
    var isService: Bool?
    
    init(name: String, isCollect: Bool?, isInventory: Bool?, isService: Bool?) {
        self.name = name
        self.isCollect = isCollect
        self.isInventory = isInventory
        self.isService = isService
    }
}
