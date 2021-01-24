//
//  DownloadManagerGraphImpl.swift
//  VendRoute
//
//  Created by Vasili Orlov on 24/01/21.
//  Copyright © 2021 Vasili Orlov. All rights reserved.
//

import UIKit
import Amplify

class DownloadManagerGraphImpl: DownloadManager {
    func loadData(for serviceDate: Date, stepCallBack: @escaping DownloadCallback, completion: @escaping () -> Void) {
        stepCallBack(.success(.measure))
        stepCallBack(.success(.product))
        stepCallBack(.success(.pos))
        stepCallBack(.success(.visit))
        completion()
    }
}
