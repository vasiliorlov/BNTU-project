//
//  DomainAsm.swift
//  VendRoute
//
//  Created by Vasili Orlov on 14/09/20.
//  Copyright © 2020 Vasili Orlov. All rights reserved.
//

import UIKit

protocol DomainAsm {
    var authManager: AuthManager { get }
    var downloadManager: DownloadManager { get }
    var downloadS3Manager: DownloadManager { get }
    var endOfDayInteractor: EndOfDayInteractor { get }
}
