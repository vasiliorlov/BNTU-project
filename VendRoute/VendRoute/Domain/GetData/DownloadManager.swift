//
//  DownloadManager.swift
//  VendRoute
//
//  Created by Vasili Orlov on 03/10/20.
//  Copyright © 2020 Vasili Orlov. All rights reserved.
//

import UIKit

typealias DownloadPosCallback = (Result<[Visit], Error>) -> Void

protocol DownloadManager {
    func loadVisits(for serviceDate: Date, completion: DownloadPosCallback )
}
