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
        return AmplifyAuthManager()
    }
    
    var downloadManager: DownloadManager {
        let dataAsm = Container.shared.dataAsm
        let serviceAsm = Container.shared.serviceAsm
        
        return DownloadManagerImpl(downloadService: serviceAsm.downloadService,
                                   posDao: dataAsm.posDao,
                                   productDao: dataAsm.productDao,
                                   visitDao: dataAsm.visitDao,
                                   mapper: DownloadMapper(),
                                   dbCleaner: dataAsm.dbCleaner)
    }
    
    var endOfDayInteractor: EndOfDayInteractor {
        let dataAsm = Container.shared.dataAsm
        let serviceAsm = Container.shared.serviceAsm
        
        return EndOfDayInteractorImpl(uploadService: serviceAsm.uploadService,
                                      dbCleaner: dataAsm.dbCleaner,
                                      visitsDao: dataAsm.visitDao)
    }
}
