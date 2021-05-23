//
//  ServiceAsm.swift
//  VendRoute
//
//  Created by Vasili Orlov on 10/10/20.
//  Copyright © 2020 Vasili Orlov. All rights reserved.
//

import UIKit

protocol ServiceAsm {
    var downloadService: DownloadService { get }
    var uploadService: UploadService { get }
    var uploadS3Service: UploadService { get }
}
