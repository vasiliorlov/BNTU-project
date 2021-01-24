//
//  EndOfDayInteractorImpl.swift
//  VendRoute
//
//  Created by Vasili Orlov on 24/01/21.
//  Copyright © 2021 Vasili Orlov. All rights reserved.
//

import UIKit

class EndOfDayInteractorImpl: EndOfDayInteractor {
    let visitsDao: VisitDao
    let uploadService: UploadService
    let dbCleaner: DataBaseCleaner
    let mapper: UploadMapper
    
    init(uploadService: UploadService, dbCleaner: DataBaseCleaner, visitsDao: VisitDao) {
        self.uploadService = uploadService
        self.dbCleaner = dbCleaner
        self.visitsDao = visitsDao
        self.mapper = UploadMapper()
    }
    
    func endOfDay(_ completion: @escaping(Bool, Error?) -> Void) {
        let visits: [VisitExt] = visitsDao.getAll()
        let visitApiEntities: [VisitApiEntity] = visits.map{ mapper.map($0) }
        uploadService.upload(visits: visitApiEntities) { (success, error) in
            completion(success, error)
        }
    }
}
