//
//  RouteMapPresenter.swift
//  VendRoute
//
//  Created by Vasili Orlov on 11/03/2020.
//  Copyright © 2020 VR. All rights reserved.
//
import MapKit

class RouteMapPresenter: RouteMapModuleInput, RouteMapViewOutput {
    
    // dependencies
    weak var view: RouteMapViewInput?
    var router: RouteMapRouter
    private var posDao: PosDao
    
    //data
    private var poses: [PointOfSale] = []
    init(router: RouteMapRouter, view: RouteMapViewInput, posDao: PosDao) {
        self.view = view
        self.router = router
        self.posDao = posDao
    }
    //MARK: - RouteMapViewOutput
    func viewIsReady() {
        view?.setupInitialState()
        loadData {
            let viewData = self.poses.map { self.map(pos: $0) }
            self.view?.setData(viewData)
        }
    }
    
    func requireCloseModule() {
        router.openPreviousScreen()
    }
    
    //MARK: - private methods
    private func loadData(_ completion: () -> Void) {
        self.poses = posDao.getAll()
        completion()
    }
    
    private func map(pos: PointOfSale) -> PosMapViewModel {
        return PosMapViewModel(title: pos.name,
                               adress: "\(pos.adress.city), \(pos.adress.street)",
                               comment: pos.comment,
                               location: CLLocationCoordinate2D(latitude: pos.adress.gps.latitude, longitude: pos.adress.gps.longitude))
    }
}
