//
//  PointOfSaleListPresenter.swift
//  VendRoute
//
//  Created by Vasili Orlov on 11/03/2020.
//  Copyright © 2020 VR. All rights reserved.
//
import UIKit

class PointOfSaleListPresenter: PointOfSaleListModuleInput, PointOfSaleListViewOutput {
    
    // dependencies
    weak var view: PointOfSaleListViewInput?
    var router: PointOfSaleListRouter
    var posDao: PosDao
    
    //data
    var editedPoses: [PointOfSale] = []
    
    //MARK: - life cycle
    init(router: PointOfSaleListRouter, view: PointOfSaleListViewInput, posDao: PosDao) {
        self.view = view
        self.router = router
        self.posDao = posDao
    }
    
    //MARK: - PointOfSaleListModuleInput
    func viewIsReady() {
        view?.setupInitialState()
        loadData {
            let data = self.editedPoses.map { self.map($0) }
            self.view?.setup(by: data)
        }
    }
    
    func didSelectModel(with id: PosId) {
        router.openVisitScreen(for: id)
    }
    
    //MARK: - private methods
    private func loadData(_ completion: @escaping () -> ()) {
        DispatchQueue.global().async {
            self.editedPoses = self.posDao.getAll()
            completion()
        }
    }
    
    private func updateView() {

    }
    //MARK: - mapper methods
    private func map(_ pos: PointOfSale) -> POSViewModel {
        return POSViewModel(id: pos.id, posName: pos.name, adress: pos.adress.text, collected: pos.isCollect, inventoried: pos.isInventory, servised: pos.isService)
    }
}
