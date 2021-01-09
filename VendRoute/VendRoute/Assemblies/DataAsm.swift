//
//  DataAsm.swift
//  VendRoute
//
//  Created by Vasili Orlov on 28/07/20.
//  Copyright © 2020 Vasili Orlov. All rights reserved.
//

import UIKit

protocol DataAsm {
    var appSettings: AppSettings { get }
    var productDao: ProductDao { get }
    var posDao: PosDao { get }
    var visitDao: VisitDao { get }
    var imageDao: ImageDao { get }
    
    var dbCleaner: DataBaseCleaner { get }
}
