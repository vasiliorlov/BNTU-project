//
//  ComparisonDataManager.swift
//  VendRoute
//
//  Created by Vasili Orlov on 08/01/21.
//  Copyright © 2021 Vasili Orlov. All rights reserved.
//

import Foundation
import CoreData

class MockDataManager {
    func getApiServiceResponse() {
        
    }
    
    func getApiMeasureEntities() -> [MeasureApiEntity] {
        let measure1 = MeasureApiEntity(id: "measure1", measureFactor: 1, name: "Each")
        let measure2 = MeasureApiEntity(id: "measure2", measureFactor: 2, name: "Pair")
        let measure3 = MeasureApiEntity(id: "measure3", measureFactor: 10, name: "Box")
        return [measure1, measure2, measure3]
    }
    
    func getApiProductEntities() -> [ProductApiEntity] {
        let product1 = ProductApiEntity(id: "product1", name: "Cola", measureId: "measure1")
        let product2 = ProductApiEntity(id: "product2", name: "Pepsi", measureId: "measure2")
        let product3 = ProductApiEntity(id: "product3", name: "Mars", measureId: "measure3")
        return [product1, product2, product3]
        
    }
    
    func getProduct() -> [Product] {
        let measure1 = Measure(id: "measure1", measureFactor: 1, name: "Each")
        let measure2 = Measure(id: "measure2", measureFactor: 2, name: "Pair")
        let measure3 = Measure(id: "measure3", measureFactor: 10, name: "Box")
        
        let product1 = Product(id: "product1", name: "Cola", measure: measure1)
        let product2 = Product(id: "product2", name: "Pepsi", measure: measure2)
        let product3 = Product(id: "product3", name: "Mars", measure: measure3)
        
        return [product1, product2, product3]
    }
    

    func getCoreProducts() -> [CoreProduct] {
        return []
    }
}
