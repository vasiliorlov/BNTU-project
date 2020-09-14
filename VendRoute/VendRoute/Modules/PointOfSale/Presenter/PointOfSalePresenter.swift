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

    
    //MARK: - life cycle
    init(router: PointOfSaleRouter, view: PointOfSaleViewInput, posDao: PosDao, visitDao: VisitDao) {
        self.view = view
        self.router = router
        self.posDao = posDao
        self.visitDao = visitDao
    }

    //MARK: - PointOfSaleViewOutput
    func viewIsReady() {
        view?.setupInitialState()
        loadData {
            self.updateView()
        }
    }
    
    func requireCloseScreen() {
        router.openPreviousScreen()
    }
    
    //MARK: - private methods
    private func loadData(_ completion: @escaping () -> ()) {
        DispatchQueue.global().async {
            if let id = self.posId {
                self.pos = self.posDao.getBy(id: id)
            }
            completion()
        }
    }
    
    private func updateView() {
        if let pos = self.pos {
            view?.setupBy(posModel: map(pos))
        }
    }
    
    //MARK: - mapper methods
    private func map(_ pos: PointOfSale) -> PosDetailViewModel {
        return PosDetailViewModel(name: pos.name,
                                  isCollect: pos.needCollect ? pos.isCollect : nil,
                                  isInventory: pos.needInventory ? pos.isInventory : nil,
                                  isService: pos.needService ? pos.isService : nil)
    }
    
}
