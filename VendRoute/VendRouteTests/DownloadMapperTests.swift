//
//  DownloadMapperTests.swift
//  VendRoute
//
//  Created by Vasili Orlov on 08/01/21.
//  Copyright © 2021 Vasili Orlov. All rights reserved.
//

import XCTest
@testable import VendRoute

class DownloadMapperTests: XCTestCase {
    func testMeasureDoesNotExistForProduct() {
        let inputMeasureEntites: [MeasureApiEntity] = []
        let inputProductEntites: [ProductApiEntity] = MockDataManager().getApiProductEntities()
        let mapper = DownloadMapper()
        mapper.measureApiEntities = inputMeasureEntites
        mapper.productApiEntities = inputProductEntites
        
        let outputEntites = mapper.getProduct()
        
        XCTAssertTrue(outputEntites.isEmpty, "Products set should be empty.")
    }
    
    func testProductsDoNotExist() {
        let inputMeasureEntites: [MeasureApiEntity] = MockDataManager().getApiMeasureEntities()
        let inputProductEntites: [ProductApiEntity] = []
        
        let mapper = DownloadMapper()
        mapper.measureApiEntities = inputMeasureEntites
        mapper.productApiEntities = inputProductEntites
        
        let outputEntites = mapper.getProduct()
        
        XCTAssertTrue(outputEntites.isEmpty, "Products set should be empty.")
    }
    
    func testMeasureExistForProduct() {
        let inputMeasureEntites: [MeasureApiEntity]  = MockDataManager().getApiMeasureEntities()
        let inputProductEntites: [ProductApiEntity] = MockDataManager().getApiProductEntities()
        
        let mapper = DownloadMapper()
        mapper.measureApiEntities = inputMeasureEntites
        mapper.productApiEntities = inputProductEntites
        
        let etalonOutputEntities = MockDataManager().getProduct()
        let outputEntites = mapper.getProduct()
        
        XCTAssertEqual(etalonOutputEntities.count, outputEntites.count, "Product count should be equal.")
        XCTAssertEqual(etalonOutputEntities, outputEntites, "Products from downloadmapper are wrong.")
    }
}
