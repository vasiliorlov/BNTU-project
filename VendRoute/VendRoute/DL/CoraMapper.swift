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
    func map(_ adress: Adress) -> CoraAdress {
        let coraObject = CoraAdress(context: context)
        coraObject.city = adress.city
        coraObject.street = adress.street
        coraObject.postCode = Int64(adress.postCode)
        coraObject.latitude = adress.gps.latitude
        coraObject.longitude = adress.gps.longitude
        return coraObject
    }
    
    func map(_ coraAdress: CoraAdress) -> Adress? {
        if let city = coraAdress.city, let street = coraAdress.street {
            let postCode = coraAdress.postCode
            let latitude = coraAdress.latitude
            let longitude = coraAdress.longitude
            
            let gps = GpsCoordinate(longitude: longitude, latitude: latitude)
            return Adress(city: city, street: street, gps: gps, postCode: Int(postCode))
        } else {
            return nil
        }
    }
    //MARK: - PointOfSale
    func map(_ pos: PointOfSale) -> CoraPOS {
        let coraObject = CoraPOS(context: context)
        coraObject.id = pos.id
        coraObject.name = pos.name
        coraObject.comment = pos.comment
        coraObject.adress = map(pos.adress)
        coraObject.isCollect = pos.isCollect
        coraObject.isInventory = pos.isInventory
        coraObject.isService = pos.isService
        return coraObject
    }
    
    func map(_ coraPos: CoraPOS) -> PointOfSale? {
        if let coraAdress = coraPos.adress, let adress = map(coraAdress), let id  = coraPos.id, let name = coraPos.name {
            return PointOfSale(id: id, name: name, adress: adress, comment: coraPos.comment, isCollect: coraPos.isCollect, isInventory: coraPos.isInventory, isService: coraPos.isService)
        } else {
            return nil
        }
    }
    
    
    //MARK: - Measure
    func map(_ measure: Measure) -> CoraMeasure {
        let coraObject = CoraMeasure(context: context)
        coraObject.id = measure.id
        coraObject.measureFactor = Int16(measure.measureFactor)
        coraObject.name = measure.name
        return coraObject
    }
    
    func map(_ coraMeasure: CoraMeasure) -> Measure? {
        if let id = coraMeasure.id, let name = coraMeasure.name {
            return Measure(id: id, measureFactor: Int(coraMeasure.measureFactor), name: name)
        } else {
            return nil
        }
    }
    
    //MARK: - Product
    func map(_ product: Product) -> CoraProduct {
        let coraObject = CoraProduct(context: context)
        coraObject.id = product.id
        coraObject.name = product.name
        coraObject.measure = map(product.measure)
        return coraObject
    }
    
    func map(_ coraProduct: CoraProduct) -> Product? {
        if let coraMeasure = coraProduct.measure, let measure = map(coraMeasure), let id = coraProduct.id, let name = coraProduct.name {
            return Product(id: id, name: name, measure: measure)
        } else {
            return nil
        }
    }
    //MARK: - map VisitItem
    func map(_ item: VisitItem) -> CoraVisitItem {
        let coraObject = CoraVisitItem(context: context)
        coraObject.add = Int16(item.add)
        coraObject.inv = Int16(item.inv)
        coraObject.remove = Int16(item.remove)
        coraObject.spoiled = Int16(item.spoiled)
        coraObject.row = Int16(item.row)
        coraObject.column = Int16(item.column)
        coraObject.product = map(item.product)
        return coraObject
    }
    
    func map(_ coraItem: CoraVisitItem) -> VisitItem? {
        if let coraProduct = coraItem.product, let product = map(coraProduct), let id = coraItem.id {
            return VisitItem(id: id, column: Int(coraItem.column), row: Int(coraItem.row), product: product, add: Int(coraItem.add), remove: Int(coraItem.remove), spoiled: Int(coraItem.spoiled), inv: Int(coraItem.inv))
        } else {
            return nil
        }
    }
    
    func map(_ visit: VisitExt) -> CoraVisit {
        let coraObject = CoraVisit(context: context)
        let items = visit.items.compactMap { map($0) }
        coraObject.cash = visit.cash
        coraObject.comment = visit.comment
        coraObject.pos = map(visit.pos)
        coraObject.id = visit.id
        coraObject.items = NSSet(array: items)
        return coraObject
    }
    
    func map(_ coraVisit: CoraVisit) -> VisitExt? {
        if let coraItems = coraVisit.items?.allObjects as? [CoraVisitItem], let id = coraVisit.id, let coraPos = coraVisit.pos, let pos = map(coraPos) {
            let items = coraItems.compactMap{ map($0) }
            let cash = coraVisit.cash
            let comment = coraVisit.comment
            let visit = VisitExt(id: id, pos: pos, cash: cash, comment: comment, itemIds: items.map{ $0.id })
            visit.items = items
            return visit
        } else {
            return nil
        }
    }
    
}
