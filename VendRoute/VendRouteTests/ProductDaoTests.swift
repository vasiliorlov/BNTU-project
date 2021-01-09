//
//  ProductDaoTests.swift
//  VendRoute
//
//  Created by Vasili Orlov on 08/01/21.
//  Copyright © 2021 Vasili Orlov. All rights reserved.
//

import XCTest
@testable import VendRoute

class ProductDaoTests: XCTestCase {

    func testSaveEmptySet() {
        let inputProducts: [Product] = []
        let coraDataManagerInstance: CoraDataManager = CoraDataManager()
        let mapper = CoraMapper(context: coraDataManagerInstance.persistentContainer.newBackgroundContext())
        let productDao = ProductDaoImpl(coraDataManager: coraDataManagerInstance, mapper: mapper)
        let dbCleaner: DataBaseCleaner = DataBaseCleanerImpl(coreDataManager: coraDataManagerInstance)
       
        dbCleaner.clearUserTable()
        productDao.save(inputProducts)
        let outputProducts = productDao.getAll()
        
        XCTAssertTrue(outputProducts.isEmpty, "Get all function should return emty set.")
    }
    
    func testSaveDuplicateProducts() {
        let inputProducts = MockDataManager().getProduct().sorted { $0.id < $1.id }
        XCTAssertFalse(inputProducts.isEmpty, "Input products is empty")
        
        let coraDataManagerInstance: CoraDataManager = CoraDataManager()
        let mapper = CoraMapper(context: coraDataManagerInstance.persistentContainer.newBackgroundContext())
        let productDao = ProductDaoImpl(coraDataManager: coraDataManagerInstance, mapper: mapper)
        let dbCleaner: DataBaseCleaner = DataBaseCleanerImpl(coreDataManager: coraDataManagerInstance)
       
        dbCleaner.clearUserTable()
        productDao.save(inputProducts + inputProducts)
        
        
        let outputProducts = productDao.getAll().sorted { $0.id < $1.id }
        
        XCTAssertEqual(inputProducts, outputProducts, "Dublicate products were not saved correctle.")
    }
    
    func testSaveProducts() {
        let inputProducts = MockDataManager().getProduct().sorted { $0.id < $1.id }
        XCTAssertFalse(inputProducts.isEmpty, "Input products is empty")
        
        let coraDataManagerInstance: CoraDataManager = CoraDataManager()
        let mapper = CoraMapper(context: coraDataManagerInstance.persistentContainer.newBackgroundContext())
        let productDao = ProductDaoImpl(coraDataManager: coraDataManagerInstance, mapper: mapper)
        let dbCleaner: DataBaseCleaner = DataBaseCleanerImpl(coreDataManager: coraDataManagerInstance)
       
        dbCleaner.clearUserTable()
        productDao.save(inputProducts)
        
        
        let outputProducts = productDao.getAll().sorted { $0.id < $1.id }
        
        XCTAssertEqual(inputProducts, outputProducts, "Products were not saved correctly.")
    }
    
    func testRemoveByEmpySetId() {
        let inputProducts = MockDataManager().getProduct().sorted { $0.id < $1.id }
        let idsForRemoved: [ProductId] = []
        
        let coraDataManagerInstance: CoraDataManager = CoraDataManager()
        let mapper = CoraMapper(context: coraDataManagerInstance.persistentContainer.newBackgroundContext())
        let productDao = ProductDaoImpl(coraDataManager: coraDataManagerInstance, mapper: mapper)
        let dbCleaner: DataBaseCleaner = DataBaseCleanerImpl(coreDataManager: coraDataManagerInstance)
       
        dbCleaner.clearUserTable()
        productDao.save(inputProducts)
        
        //remove
        productDao.removeBy(ids: idsForRemoved)
        let removedInputProducts = inputProducts.filter{ !idsForRemoved.contains($0.id) }
            .sorted { $0.id < $1.id }
        
        let outputProducts = productDao.getAll().sorted { $0.id < $1.id }
        
        XCTAssertEqual(removedInputProducts, outputProducts, "Products were not removed correctly.")
    }
    
    func testRemoveBySetId() {
        let inputProducts = MockDataManager().getProduct().sorted { $0.id < $1.id }
        let idsForRemoved: [ProductId] = Array(repeating: ("\(Int.random(in: 0..<inputProducts.count))"), count: 3)
        
        let coraDataManagerInstance: CoraDataManager = CoraDataManager()
        let mapper = CoraMapper(context: coraDataManagerInstance.persistentContainer.newBackgroundContext())
        let productDao = ProductDaoImpl(coraDataManager: coraDataManagerInstance, mapper: mapper)
        let dbCleaner: DataBaseCleaner = DataBaseCleanerImpl(coreDataManager: coraDataManagerInstance)
       
        dbCleaner.clearUserTable()
        productDao.save(inputProducts)
        
        //remove
        productDao.removeBy(ids: idsForRemoved)
        let removedInputProducts = inputProducts.filter{ !idsForRemoved.contains($0.id) }
            .sorted { $0.id < $1.id }
        
        let outputProducts = productDao.getAll().sorted { $0.id < $1.id }
        
        XCTAssertEqual(removedInputProducts, outputProducts, "Products were not removed correctly.")
    }
}
