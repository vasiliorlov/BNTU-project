//
//  DownloadManager.swift
//  VendRoute
//
//  Created by Vasili Orlov on 03/10/20.
//  Copyright © 2020 Vasili Orlov. All rights reserved.
//

import UIKit

enum LoadingDataStep {
    case measure
    case product
    case pos
    case visit
    
    var descr: String {
        switch self {
        case .measure: return "Measure"
        case .product: return "Products"
        case .pos: return "Poses"
        case .visit: return "Visits"
        }
        
    }
}

typealias DownloadCallback = (Result<LoadingDataStep, Error>) -> Void

protocol DownloadManager {
    func loadData(for serviceDate: Date, stepCallBack: @escaping DownloadCallback, completion: @escaping () -> Void)
}
