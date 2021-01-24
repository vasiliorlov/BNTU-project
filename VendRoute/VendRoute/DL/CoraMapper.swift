//
//  CoraMapper.swift
//  VendRoute
//
//  Created by Vasili Orlov on 16/08/20.
//  Copyright © 2020 Vasili Orlov. All rights reserved.
//

import UIKit
import CoreData

class CoraMapper {
    let context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    //MARK: - Adress
    func map(_ adress: Adress) -> CoreAdress {
        let coraObject = CoreAdress(context: context)
        coraObject.city = adress.city
        coraObject.street = adress.street
        coraObject.postCode = adress.postCode
        coraObject.latitude = adress.gps.latitude
        coraObject.longitude = adress.gps.longitude
        return coraObject
    }
    
    func map(_ coraAdress: CoreAdress) -> Adress? {
        if let city = coraAdress.city,
           let street = coraAdress.street,
           let postCode = coraAdress.postCode {
            let latitude = coraAdress.latitude
            let longitude = coraAdress.longitude
            
            let gps = GpsCoordinate(longitude: longitude, latitude: latitude)
            return Adress(city: city, street: street, gps: gps, postCode: postCode)
        } else {
            return nil
        }
    }
    //MARK: - PointOfSale
    func map(_ pos: PointOfSale) -> CorePOS {
        let coraObject = CorePOS(context: context)
        coraObject.id = pos.id
        coraObject.name = pos.name
        coraObject.comment = pos.comment
        coraObject.adress = map(pos.adress)
        return coraObject
    }
    
    func map(_ coraPos: CorePOS) -> PointOfSale? {
        if let coraAdress = coraPos.adress, let adress = map(coraAdress), let id  = coraPos.id, let name = coraPos.name {
            return PointOfSale(id: id, name: name, adress: adress, comment: coraPos.comment)
        } else {
            return nil
        }
    }
    
    
    //MARK: - Measure
    func map(_ measure: Measure) -> CoreMeasure {
        let coraObject = CoreMeasure(context: context)
        coraObject.id = measure.id
        coraObject.measureFactor = Int16(measure.measureFactor)
        coraObject.name = measure.name
        return coraObject
    }
    
    func map(_ coraMeasure: CoreMeasure) -> Measure? {
        if let id = coraMeasure.id, let name = coraMeasure.name {
            return Measure(id: id, measureFactor: Int(coraMeasure.measureFactor), name: name)
        } else {
            return nil
        }
    }
    
    //MARK: - Product
    func map(_ product: Product) -> CoreProduct {
        let coraObject = CoreProduct(context: context)
        coraObject.id = product.id
        coraObject.name = product.name
        coraObject.measure = map(product.measure)
        return coraObject
    }
    
    func map(_ coraProduct: CoreProduct) -> Product? {
        if let coraMeasure = coraProduct.measure, let measure = map(coraMeasure), let id = coraProduct.id, let name = coraProduct.name {
            return Product(id: id, name: name, measure: measure)
        } else {
            return nil
        }
    }
    //MARK: - map VisitItem
    func map(_ item: VisitItem) -> CoreVisitItem {
        let coraObject = CoreVisitItem(context: context)
        coraObject.id = item.id
        coraObject.add = item.add.map{ "\($0)"}
        coraObject.inv = item.inv.map{ "\($0)"}
        coraObject.remove = item.remove.map{ "\($0)"}
        coraObject.spoiled = item.spoiled.map{ "\($0)"}
        coraObject.row = Int16(item.row)
        coraObject.column = Int16(item.column)
        coraObject.product = map(item.product)
        return coraObject
    }
    
    func map(_ coraItem: CoreVisitItem) -> VisitItem? {
        if let coraProduct = coraItem.product, let product = map(coraProduct), let id = coraItem.id {
            return VisitItem(id: id, column: Int(coraItem.column), row: Int(coraItem.row), product: product,
                             add: Int(coraItem.add ?? ""),
                             remove: Int(coraItem.remove ?? ""),
                             spoiled: Int(coraItem.spoiled ?? ""),
                             inv: Int(coraItem.inv ?? ""))
        } else {
            return nil
        }
    }
    
    func map(_ visit: VisitExt) -> CoreVisit {
        let coraObject = CoreVisit(context: context)
        let items = visit.items.compactMap { map($0) }
        coraObject.cash = visit.cash
        coraObject.comment = visit.comment
        coraObject.posId = visit.posId
        coraObject.id = visit.id
        coraObject.isCollect = visit.isCollect
        coraObject.isInventory = visit.isInventory
        coraObject.isService = visit.isService
        
        coraObject.needCollect = visit.needCollect
        coraObject.needInventory = visit.needInventory
        coraObject.needService = visit.needService
        
        coraObject.items = NSSet(array: items)
        return coraObject
    }
    
    func map(_ coraVisit: CoreVisit) -> VisitExt? {
        if let coraItems = coraVisit.items?.allObjects as? [CoreVisitItem], let id = coraVisit.id, let posId = coraVisit.posId {
            let items = coraItems.compactMap{ map($0) }
            let cash = coraVisit.cash
            let comment = coraVisit.comment
            let visit = VisitExt(id: id, posId: posId, cash: cash, comment: comment, isCollect: coraVisit.isCollect, isInventory: coraVisit.isInventory, isService: coraVisit.isService, needCollect: coraVisit.needService, needInventory: coraVisit.needInventory, needService: coraVisit.needService, itemIds: items.map{ $0.id })
            visit.items = items
            return visit
        } else {
            return nil
        }
    }
    
}
