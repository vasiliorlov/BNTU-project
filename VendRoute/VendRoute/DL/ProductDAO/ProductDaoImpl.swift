//
//  ProductDaoImpl.swift
//  VendRoute
//
//  Created by Vasili Orlov on 16/08/20.
//  Copyright © 2020 Vasili Orlov. All rights reserved.
//

import UIKit
import CoreData

class ProductDaoImpl: ProductDao {
    let coraDataManager: CoraDataManager
    let mapper: CoraMapper
    let context: NSManagedObjectContext
    
    init(coraDataManager: CoraDataManager, mapper: CoraMapper) {
        self.coraDataManager = coraDataManager
        self.mapper = mapper
        self.context = coraDataManager.persistentContainer.viewContext
    }
    
    //MARK: - ProductDao
    func getAll() -> [Product] {
        do {
            let results = try context.fetch(CoraProduct.fetchRequest()) as! [CoraProduct]
            return results.compactMap{ mapper.map($0) }
        } catch {
            return []
        }
    }
    
    func save(_ products: [Product]) {
        let _ = products.map { mapper.map($0) }
        coraDataManager.saveContext()
    }
    
    func removeBy(ids: [ProductId]) {
        
    }
    
    //MARK: - Measure methods
    private func save(_ measures: [Measure]) {
        
    }

}
