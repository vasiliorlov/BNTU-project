//
//  DataAsmProd.swift
//  VendRoute
//
//  Created by Vasili Orlov on 28/07/20.
//  Copyright © 2020 Vasili Orlov. All rights reserved.
//

import UIKit

class DataAsmProd: DataAsm {
    lazy private var coraDataManagerInstance: CoraDataManager = CoraDataManager()
    lazy private var mapper = CoraMapper(context: coraDataManagerInstance.persistentContainer.newBackgroundContext())
    var appSettings: AppSettings = UserDefaultsAppSettingsImpl()
    lazy private var userDaoInstance: UserDao = UserDefaultsDao()
    var productDao: ProductDao {
        return ProductDaoImpl(coraDataManager: coraDataManagerInstance, mapper: mapper)
    }
    
    var posDao: PosDao {
        return PosDaoImpl(coraDataManager: coraDataManagerInstance, mapper: mapper)
    }
    
    var visitDao: VisitDao {
        return VisitDaoImpl(coraDataManager: coraDataManagerInstance, mapper: mapper)
    }
    
    var dbCleaner: DataBaseCleaner {
        return DataBaseCleanerImpl(coreDataManager: coraDataManagerInstance)
    }
    
    var imageDao: ImageDao {
        return ImageMockDao()
    }
    
    var userDao: UserDao {
        return userDaoInstance
    }
    
    var routeDao: RouteDao {
        return RouteDaoImpl(coraDataManager: coraDataManagerInstance, mapper: mapper)
    }
    
}
