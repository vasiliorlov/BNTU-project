//
//  DownloadMapper.swift
//  VendRoute
//
//  Created by Vasili Orlov on 12/12/20.
//  Copyright © 2020 Vasili Orlov. All rights reserved.
//

import UIKit

class DownloadMapper {
    var measureApiEntities: [MeasureApiEntity] = []
    var productApiEntities: [ProductApiEntity] = []
    var posApiEntities: [PosApiEntity] = []
    var visitApiEnties: [VisitApiEntity] = []
    var routeApiEntities: [RouteApiEntity] = []
    
    func getProduct() -> [Product] {
        let measureItems = measureApiEntities.compactMap{ map(measureApiEntity: $0) }
        let mappedMeasureItems = Dictionary(uniqueKeysWithValues: measureItems.map{ ($0.id, $0) })
        
        var products: [Product] = []
        for productApiEntity in productApiEntities {
            if let measure = mappedMeasureItems[productApiEntity.measureId] {
                let product = Product(id: productApiEntity.id, name: productApiEntity.name, measure: measure)
                products.append(product)
            }
        }
        
        return products
    }
    
    func getPoses() -> [PointOfSale] {
        return posApiEntities.compactMap { map(posApiEntity: $0) }
    }
    
    func getVisits() -> [VisitExt] {
        let products = getProduct()
        let mappedProducts = Dictionary(uniqueKeysWithValues: products.map{ ($0.id, $0) })
        let poses = getPoses()
        let mappedPoses = Dictionary(uniqueKeysWithValues: poses.map{ ($0.id, $0) })
        
        var visits: [VisitExt] = []
        for visitApiEntity in visitApiEnties {
            if let pos = mappedPoses[visitApiEntity.posId] {
                
                var items: [VisitItem] = []
                
                for visitItemApiEntity in visitApiEntity.items {
                    if let product = mappedProducts[visitItemApiEntity.productId] {
                        let visitItem = VisitItem(id: visitItemApiEntity.id, column: visitItemApiEntity.column, row: visitItemApiEntity.row, product: product, add: visitItemApiEntity.add, remove: visitItemApiEntity.remove, spoiled: visitItemApiEntity.spoiled, inv: visitItemApiEntity.inv)
                        items.append(visitItem)
                    }
                }
                
                let visit = VisitExt(id: visitApiEntity.id, posId: visitApiEntity.posId, cash: visitApiEntity.cash, comment: visitApiEntity.comment, isCollect: visitApiEntity.isCollect, isInventory: visitApiEntity.isInventory, isService: visitApiEntity.isService, needCollect: visitApiEntity.needCollect, needInventory: visitApiEntity.needInventory, needService: visitApiEntity.needService, itemIds: items.map{ $0.id })
                visit.items = items
                
                visits.append(visit)
            }
            
        }
        return visits
    }
    
    func getRoutes() -> [Route] {
        return self.routeApiEntities.map{ Route(fromPosId: $0.fromPosId, toPosId: $0.toPosId, dist: $0.dist)}
    }
    //MARK: - mapper methods
    private func map(measureApiEntity: MeasureApiEntity) -> Measure {
        return Measure(id: measureApiEntity.id , measureFactor: measureApiEntity.measureFactor, name: measureApiEntity.name)
    }
    
    private func map(gpsApiEntity: GpsApiEntity) -> GpsCoordinate {
        return GpsCoordinate(longitude: gpsApiEntity.longitude, latitude: gpsApiEntity.latitude)
    }
    
    private func map(adressApiEntity: AdressApiEntity) -> Adress {
        let gps = map(gpsApiEntity: adressApiEntity.gps)
        return Adress(city: adressApiEntity.city, street: adressApiEntity.street, gps: gps, postCode: adressApiEntity.postCode)
    }
    
    private func map(posApiEntity: PosApiEntity) -> PointOfSale {
        let adress = map(adressApiEntity: posApiEntity.adress)
        return PointOfSale(id: posApiEntity.id , name: posApiEntity.name, adress: adress, comment: posApiEntity.comment)
    }
}
