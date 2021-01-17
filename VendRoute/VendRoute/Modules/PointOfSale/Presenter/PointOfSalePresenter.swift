//
//  PointOfSalePresenter.swift
//  VendRoute
//
//  Created by Vasili Orlov on 11/03/2020.
//  Copyright © 2020 VR. All rights reserved.
//
import Foundation

class PointOfSalePresenter: PointOfSaleModuleInput, PointOfSaleViewOutput {

    //data
    var posId: PosId?
    private var pos: PointOfSale?
    private var visit: VisitExt?
    // dependencies
    weak var view: PointOfSaleViewInput?
    var router: PointOfSaleRouter
    var posDao: PosDao
    var visitDao: VisitDao
    var imageDao: ImageDao
    
    //MARK: - life cycle
    init(router: PointOfSaleRouter, view: PointOfSaleViewInput, posDao: PosDao, visitDao: VisitDao, imageDao: ImageDao) {
        self.view = view
        self.router = router
        self.posDao = posDao
        self.visitDao = visitDao
        self.imageDao = imageDao
    }

    //MARK: - PointOfSaleViewOutput
    func viewIsReady() {
        view?.setupInitialState()
        loadData {
            self.updateView()
        }
    }
    
    func requireCloseScreen() {
        if let visit = self.visit {
            visitDao.removeBy(ids: [visit.id])
            visitDao.save([visit])
        }
        router.openPreviousScreen()
    }
    
    func didUpdateModel(_ model: PosItemViewModel) {
        if let visitItem = visit?.items.first(where: {$0.id == model.id }) {
            visitItem.add = model.add
            visitItem.inv = model.inv
            visitItem.remove = model.remove
            visitItem.spoiled = model.spoil
        }
    }
    //MARK: - private methods
    private func loadData(_ completion: @escaping () -> ()) {
        DispatchQueue.global().async {
            if let id = self.posId {
                self.pos = self.posDao.getBy(id: id)
                self.visit = self.visitDao.getExtendedBy(posId: id)
            }
            completion()
        }
    }
    
    private func updateView() {
        if let pos = self.pos {
            view?.setupBy(posModel: map(pos))
        }
        
        if let visit = self.visit {
            let itemsViewData = visit.items.map{ map(item: $0) }
            view?.setupBy(posItemModels: itemsViewData)
        }
    }
    
    //MARK: - mapper methods
    private func map(_ pos: PointOfSale) -> PosDetailViewModel {
        return PosDetailViewModel(name: pos.name,
                                  isCollect: pos.needCollect ? pos.isCollect : nil,
                                  isInventory: pos.needInventory ? pos.isInventory : nil,
                                  isService: pos.needService ? pos.isService : nil)
    }
    
    private func map(item: VisitItem) -> PosItemViewModel {
        return PosItemViewModel(id: item.id,
                                productName: "\(item.product.name) [\(item.product.measure.name)]",
                                row: item.row,
                                column: item.column,
                                inv: item.inv,
                                add: item.add,
                                remove: item.remove,
                                spoil: item.spoiled,
                                image: imageDao.getInageFor(productId: item.product.id))
    }
}
