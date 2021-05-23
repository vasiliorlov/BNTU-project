//
//  DownloadManagerS3Impl.swift
//  VendRoute
//
//  Created by Vasili Orlov on 29/01/21.
//  Copyright © 2021 Vasili Orlov. All rights reserved.
//

import UIKit
import Amplify
import AmplifyPlugins
struct StoragePath {
    static let measure = "measure.json"
    static let product = "product.json"
    static let pos = "pos.json"
    static let visit = "visit.json"
    static let route = "route.json"
}

typealias StorageKey = String

typealias DownloadResultListCallBack = (Result<StorageListResult, Error>) -> Void
typealias LoadProgressCallBack = (Progress) -> Void
typealias DownloadResultCallBack = (Result<Data, Error>) -> Void

@objc protocol DownloadMediaServiceOutput: class {
    func addedDownloadTask(total: Int)
    func removedDownloadTask(total: Int)
}


class DownloadManagerS3Impl: DownloadManager {
    
    let userDao: UserDao
    let productDao: ProductDao
    let visitDao: VisitDao
    let posDao: PosDao
    let routeDao: RouteDao
    let dbCleaner: DataBaseCleaner
   
    let mapper: DownloadMapper
    private var loadingCheckTable: [StorageKey: StorageDownloadDataOperation] = [:]
    private var delegates = DelegatesHolder<DownloadMediaServiceOutput>()
    
    init(userDao: UserDao, mapper: DownloadMapper, productDao: ProductDao, visitDao: VisitDao, posDao: PosDao, routeDao: RouteDao, dbCleaner: DataBaseCleaner) {
        self.userDao = userDao
        self.mapper = mapper
        self.productDao = productDao
        self.visitDao = visitDao
        self.posDao = posDao
        self.routeDao = routeDao
        self.dbCleaner = dbCleaner
    }
    
    func loadData(for serviceDate: Date, stepCallBack: @escaping DownloadCallback, completion: @escaping () -> Void) {
        dbCleaner.clearUserTable()
        downloadBy(key: StoragePath.measure) { _ in }
            resultCallBack: { (result) in
                switch result {
                case .success(let data):
                    if let measureEntities: [MeasureApiEntity] = try? JSONDecoder().decode([MeasureApiEntity].self, from: data) {
                        self.mapper.measureApiEntities = measureEntities
                        stepCallBack(.success(.measure))
                        self.getProducts(stepCallBack: stepCallBack, completion: completion)
                    } else {
                        let error = NSError(domain: "Does not serializate measure", code: 10000, userInfo: nil)
                        stepCallBack(.failure(error))
                    }
                case .failure(let error): stepCallBack(.failure(error))
                }
            }
    }
    
    private func getProducts(stepCallBack: @escaping DownloadCallback, completion: @escaping () -> Void) {
        self.downloadBy(key: StoragePath.product) { _ in }
            resultCallBack: { (result) in
                switch result {
                case .success(let data):
                    if let productEntities: [ProductApiEntity] = try? JSONDecoder().decode([ProductApiEntity].self, from: data) {
                        self.mapper.productApiEntities = productEntities
                        stepCallBack(.success(.product))
                        let products = self.mapper.getProduct()
                        self.productDao.save(products)
                        self.getPoses(stepCallBack: stepCallBack, completion: completion)
                    } else {
                        let error = NSError(domain: "Does not serializate products", code: 10000, userInfo: nil)
                        stepCallBack(.failure(error))
                    }
                    
                case .failure(let error): stepCallBack(.failure(error))
                }
            }
    }
    
    private func getPoses(stepCallBack: @escaping DownloadCallback, completion: @escaping () -> Void) {
        self.downloadBy(key: StoragePath.pos) { _ in }
            resultCallBack: { (result) in
                switch result {
                case .success(let data):
                    if let posEntities: [PosApiEntity] = try? JSONDecoder().decode([PosApiEntity].self, from: data) {
                        self.mapper.posApiEntities = posEntities
                        stepCallBack(.success(.pos))
                        let poses = self.mapper.getPoses()
                        self.posDao.save(poses)
                        self.getVisits(stepCallBack: stepCallBack, completion: completion)
                    } else {
                        let error = NSError(domain: "Does not serializate poses", code: 10000, userInfo: nil)
                        stepCallBack(.failure(error))
                    }
                case .failure(let error): stepCallBack(.failure(error))
                }
            }
    }
    
    private func getVisits(stepCallBack: @escaping DownloadCallback, completion: @escaping () -> Void) {
        self.downloadBy(key: StoragePath.visit) { _ in }
            resultCallBack: { (result) in
                switch result {
                case .success(let data):
                    if let visitEntities: [VisitApiEntity] = try? JSONDecoder().decode([VisitApiEntity].self, from: data) {
                        self.mapper.visitApiEnties = visitEntities
                        stepCallBack(.success(.visit))
                        let visits = self.mapper.getVisits()
                        self.visitDao.save(visits)
                        self.getRoutes(stepCallBack: stepCallBack, completion: completion)
                    } else {
                        let error = NSError(domain: "Does not serializate visits", code: 10000, userInfo: nil)
                        stepCallBack(.failure(error))
                    }
                case .failure(let error): stepCallBack(.failure(error))
                }
            }
    }
    
    private func getRoutes(stepCallBack: @escaping DownloadCallback, completion: @escaping () -> Void) {
        self.downloadBy(key: StoragePath.route) { _ in }
            resultCallBack: { (result) in
                switch result {
                case .success(let data):
                    if let routeEntities: [RouteApiEntity] = try? JSONDecoder().decode([RouteApiEntity].self, from: data) {
                        self.mapper.routeApiEntities = routeEntities
                        stepCallBack(.success(.route))
                        let routes = self.mapper.getRoutes()
                        self.routeDao.save(routes)
                        completion()
                    } else {
                        let error = NSError(domain: "Does not serializate routes", code: 10000, userInfo: nil)
                        stepCallBack(.failure(error))
                    }
                case .failure(let error): stepCallBack(.failure(error))
                }
            }
    }
    
    func getList(resultCallBack: @escaping DownloadResultListCallBack) {
        Amplify.Storage.list(options: StorageListRequest.Options.init(accessLevel: .guest,
                                                                      targetIdentityId: nil,
                                                                      path: "",
                                                                      pluginOptions: nil)) { event in
            switch event {
            case let .success(listResult):
                print("List request completed. Total count: \(listResult.items.count)")
                listResult.items.forEach { item in
                    print("key: \(item.key), size: \(item.size ?? 0) b, modify: \(item.lastModified)")
                }
                resultCallBack(.success(listResult))
            case let .failure(storageError):
                print("List request failed: \(storageError.errorDescription)")
                resultCallBack(.failure(storageError))
            }
        }
    }
    
    func downloadBy(key: StorageKey, progressCallBack: @escaping LoadProgressCallBack, resultCallBack: @escaping DownloadResultCallBack) {
        
        let task = Amplify.Storage.downloadData(
            key: key,
            progressListener: { progress in
                print("Download progress: fraction \(progress.fractionCompleted), completed \(progress.completedUnitCount) of \(progress.totalUnitCount)")
                progressCallBack(progress)
            }, resultListener: { (event) in
                switch event {
                case let .success(data):
                    print("Download request completed: \(data)")
                    resultCallBack(.success(data))
                case let .failure(storageError):
                    print("Download request failed: \(storageError.errorDescription)")
                    resultCallBack(.failure(storageError))
                }
                
                self.removeTask(for: key)
            })
        self.addNewTask(for: key, task: task)
    }
    
    func isDownloading(key: StorageKey) -> Bool {
        return loadingCheckTable.contains { (index, value) -> Bool in
            return key == index
        }
    }
    
    func cancel() {
        let tasks = loadingCheckTable.map{ $0.value}
        tasks.forEach { $0.cancel() }
        loadingCheckTable.removeAll()
        delegates.notifyDelegates {
            $0.removedDownloadTask(total: 0)
        }
    }
    
    func subscribe(_ output: DownloadMediaServiceOutput) {
        delegates.addDelegate(output)
    }
    
    //MARK: - private methods
    
    private func removeTask(for key: StorageKey) {
        loadingCheckTable.removeValue(forKey: key)
        self.clearTasks()
        
        let totalCount = loadingCheckTable.count
        delegates.notifyDelegates {
            $0.removedDownloadTask(total: totalCount)
        }
    }
    
    private func clearTasks() {
        var temp: [StorageKey: StorageDownloadDataOperation] = [:]
        for (index, value) in loadingCheckTable {
            if value.isExecuting {
                temp[index] = value
            }
        }
        loadingCheckTable = temp
    }
    
    private func addNewTask(for key: StorageKey, task: StorageDownloadDataOperation) {
        loadingCheckTable[key] = task
        let totalCount = loadingCheckTable.count
        delegates.notifyDelegates {
            $0.addedDownloadTask(total: totalCount)
        }
    }
}
