//
//  ServiceAsmProd.swift
//  VendRoute
//
//  Created by Vasili Orlov on 10/10/20.
//  Copyright © 2020 Vasili Orlov. All rights reserved.
//

import UIKit

class ServiceAsmProd: ServiceAsm {
    lazy private var downloadServiceInstance: DownloadService = DownloadServiceImpl()
    
    var downloadService: DownloadService {
        return downloadServiceInstance
    }
}
