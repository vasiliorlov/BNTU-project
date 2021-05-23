//
//  UploadS3Service.swift
//  VendRoute
//
//  Created by Vasili Orlov on 30/01/21.
//  Copyright © 2021 Vasili Orlov. All rights reserved.
//

import UIKit
import Amplify
import AmplifyPlugins

typealias UploadCallBack = (Result<String, Error>) -> Void

@objc protocol UploadServiceOutput: class {
    func addedUploadTask(total: Int)
    func removedUploadTask(total: Int)
}


class UploadS3Service: UploadService {
    private let userDao: UserDao
    private var uploadingCheckTable: [StorageKey: StorageUploadDataOperation] = [:]
    private var delegates = DelegatesHolder<UploadServiceOutput>()
    
    init(userDao: UserDao) {
        self.userDao = userDao
    }
    
    func upload(visits: [VisitApiEntity], callBack: @escaping sendVisitCallBack) {
        let encoder = JSONEncoder()
        let userName: String = userDao.get().name ?? "unknownUser"
        
        encoder.outputFormatting = .prettyPrinted
        if let data = try? encoder.encode(visits) {
            let task = Amplify.Storage.uploadData(
                key: userName + "/" + StoragePath.visit,
                data: data,
                progressListener: { progress in
                    print("Upload progress: fraction \(progress.fractionCompleted), completed \(progress.completedUnitCount) of \(progress.totalUnitCount)")
                }, resultListener: { event in
                    switch event {
                    case let .success(data):
                        print("Upload completed: \(data)")
                        callBack(true, nil)
                    case let .failure(storageError):
                        print("Upload \(StoragePath.visit) failed: \(storageError.errorDescription)")
                        callBack(true, storageError) //FIX IT ----
                    }
                    
                    self.removeTask(for: StoragePath.visit)
                })
            
            self.addNewTask(for: StoragePath.visit, task: task)
        } else {
            let error = NSError(domain: "Does not serializate visits", code: 10000, userInfo: nil)
            callBack(false, error)
        }
    }
    
    private func addNewTask(for key: StorageKey, task: StorageUploadDataOperation) {
        uploadingCheckTable[key] = task
        let totalCount = uploadingCheckTable.count
        delegates.notifyDelegates {
            $0.addedUploadTask(total: totalCount)
        }
    }
    
    private func removeTask(for key: StorageKey) {
        uploadingCheckTable.removeValue(forKey: key)
        self.clearTasks()
        
        let totalCount = uploadingCheckTable.count
        delegates.notifyDelegates {
            $0.removedUploadTask(total: totalCount)
        }
    }
    
    
    func cancel() {
        let tasks = uploadingCheckTable.map{ $0.value}
        tasks.forEach { $0.cancel() }
        uploadingCheckTable.removeAll()
        delegates.notifyDelegates {
            $0.removedUploadTask(total: 0)
        }
    }
    
    func subscribe(_ output: UploadServiceOutput) {
        delegates.addDelegate(output)
    }
    
    
    private func clearTasks() {
        var temp: [StorageKey: StorageUploadDataOperation] = [:]
        for (index, value) in uploadingCheckTable {
            if value.isExecuting {
                temp[index] = value
            }
        }
        uploadingCheckTable = temp
    }
    
}
