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
    lazy private var uploadServiceInstance: UploadService = UploadServiceImpl()
    lazy private var uploadS3ServiceInstance: UploadService = UploadS3Service(userDao: Container.shared.dataAsm.userDao)
    
    var downloadService: DownloadService {
        return downloadServiceInstance
    }
    
    var uploadService: UploadService {
        return uploadServiceInstance
    }
    
    var uploadS3Service: UploadService {
        return uploadS3ServiceInstance
    }
}
