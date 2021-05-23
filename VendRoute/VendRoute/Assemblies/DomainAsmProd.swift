//
//  DomainAsmProd.swift
//  VendRoute
//
//  Created by Vasili Orlov on 14/09/20.
//  Copyright © 2020 Vasili Orlov. All rights reserved.
//

import UIKit

class DomainAsmProd: DomainAsm {
    
    var authManager: AuthManager {
        let dataAsm = Container.shared.dataAsm
        return AmplifyAuthManager(userDao: dataAsm.userDao)
    }
    
    var downloadManager: DownloadManager {
        let dataAsm = Container.shared.dataAsm
        let serviceAsm = Container.shared.serviceAsm
        
        return DownloadManagerImpl(downloadService: serviceAsm.downloadService,
                                   posDao: dataAsm.posDao,
                                   productDao: dataAsm.productDao,
                                   visitDao: dataAsm.visitDao,
                                   routeDao: dataAsm.routeDao,
                                   mapper: DownloadMapper(),
                                   dbCleaner: dataAsm.dbCleaner)
    }
    
    var downloadS3Manager: DownloadManager {
        let dataAsm = Container.shared.dataAsm
        return DownloadManagerS3Impl(userDao: dataAsm.userDao,
                                     mapper: DownloadMapper(),
                                     productDao: dataAsm.productDao,
                                     visitDao: dataAsm.visitDao,
                                     posDao: dataAsm.posDao,
                                     routeDao: dataAsm.routeDao,
                                     dbCleaner: dataAsm.dbCleaner)
    }
    
    var endOfDayInteractor: EndOfDayInteractor {
        let dataAsm = Container.shared.dataAsm
        let serviceAsm = Container.shared.serviceAsm
        
        return EndOfDayInteractorImpl(uploadService: serviceAsm.uploadS3Service,
                                      dbCleaner: dataAsm.dbCleaner,
                                      visitsDao: dataAsm.visitDao)
    }
}
