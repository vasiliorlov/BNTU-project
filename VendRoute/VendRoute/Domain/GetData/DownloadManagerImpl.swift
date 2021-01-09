//
//  DownloadManagerImpl.swift
//  VendRoute
//
//  Created by Vasili Orlov on 03/10/20.
//  Copyright © 2020 Vasili Orlov. All rights reserved.
//

import UIKit

class DownloadManagerImpl: DownloadManager {
    let downloadService: DownloadService
    let posDao: PosDao
    let productDao: ProductDao
    let visitDao: VisitDao
    let mapper: DownloadMapper
    let dbCleaner: DataBaseCleaner
    
    
    init(downloadService: DownloadService, posDao: PosDao, productDao: ProductDao, visitDao: VisitDao, mapper: DownloadMapper, dbCleaner: DataBaseCleaner) {
        self.downloadService = downloadService
        self.posDao = posDao
        self.productDao = productDao
        self.visitDao = visitDao
        self.mapper = mapper
        self.dbCleaner = dbCleaner
    }
    
    func loadData(for serviceDate: Date, stepCallBack: @escaping DownloadCallback, completion: @escaping () -> Void) {
        dbCleaner.clearUserTable()
        downloadService.load { (result) in
            switch result {
            case .success(let measureEntities):
                self.mapper.measureApiEntities = measureEntities
                stepCallBack(.success(.measure))
            case .failure(let error):
                stepCallBack(.failure(error))
            }
        } productCallBack: { (result) in
            switch result {
            case .success(let productEntities):
                self.mapper.productApiEntities = productEntities
                stepCallBack(.success(.product))
                let products = self.mapper.getProduct()
                self.productDao.save(products)
            case .failure(let error):
                stepCallBack(.failure(error))
            }
        } posCallBack: { (result) in
            switch result {
            case .success(let posEntities):
                self.mapper.posApiEntities = posEntities
                stepCallBack(.success(.pos))
                let poses = self.mapper.getPoses()
                self.posDao.save(poses)
            case .failure(let error):
                stepCallBack(.failure(error))
            }
        } visitCallBack: { (result) in
            switch result {
            case .success(let visitEntities):
                self.mapper.visitApiEnties = visitEntities
                stepCallBack(.success(.visit))
                let visits = self.mapper.getVisits()
                self.visitDao.save(visits)
                completion()
            case .failure(let error):
                stepCallBack(.failure(error))
            }
        }

    }

}
