//
//  PointOfSaleListPresenter.swift
//  VendRoute
//
//  Created by Vasili Orlov on 11/03/2020.
//  Copyright © 2020 VR. All rights reserved.
//
import UIKit
import Amplify

class PointOfSaleListPresenter: PointOfSaleListModuleInput, PointOfSaleListViewOutput {
    
    // dependencies
    weak var view: PointOfSaleListViewInput?
    var router: PointOfSaleListRouter
    var posDao: PosDao
    var visitDao: VisitDao
    private let eodInteractor: EndOfDayInteractor
    private var autProvider: AuthManager
    
    //data
    var editedPoses: [PointOfSale] = []
    var mappedVisits: [PosId: Visit] = [:]
    
    //MARK: - life cycle
    init(router: PointOfSaleListRouter, view: PointOfSaleListViewInput, posDao: PosDao, visitDao: VisitDao, eodInteractor: EndOfDayInteractor, autProvider: AuthManager) {
        self.view = view
        self.router = router
        self.posDao = posDao
        self.visitDao = visitDao
        self.eodInteractor = eodInteractor
        self.autProvider = autProvider
        self.autProvider.output = self
    }
    
    //MARK: - PointOfSaleListModuleInput
    func viewIsReady() {
        view?.setupInitialState()
    }
    
    func didViewAppear() {
        loadData {
            let data = self.editedPoses.compactMap { self.map($0) }
                .sorted(by: { $0.posName < $1.posName })
            self.view?.setup(by: data)
        }
    }
    
    func didSelectModel(with id: PosId) {
        router.openVisitScreen(for: id)
    }
    
    func requireOpenUserProfile() {
        router.openUserProfileScreen(output: self)
    }
    
    func requireOpenMap() {
        router.openMapScreen()
    }
    
    func requireEndOfDay() {
        view?.showLoading(true)
        eodInteractor.endOfDay { (sucess, error) in
            self.view?.showLoading(false)
            if sucess {
                self.router.openChooseServiceDayScreen()
            } else if let err = error {
                let title = NSLocalizedString("Error", comment: "")
                self.view?.showMessage(title: title, message: err.localizedDescription)
            }
        }
    }
    
    func requireLogOut() {
        view?.showLoading(true)
        eodInteractor.endOfDay { (sucess, error) in
            if sucess {
                self.autProvider.signOut()
            } else if let err = error {
                self.view?.showLoading(true)
                let title = NSLocalizedString("Error", comment: "")
                self.view?.showMessage(title: title, message: err.localizedDescription)
            }
        }
    }
    //MARK: - private methods
    private func loadData(_ completion: @escaping () -> ()) {
        DispatchQueue.global().async {
            self.editedPoses = self.posDao.getAll()
            self.mappedVisits = Dictionary(uniqueKeysWithValues: self.visitDao.getAll().map{ ($0.posId, $0)})
            completion()
        }
    }
    
    private func updateView() {

    }
    //MARK: - mapper methods
    private func map(_ pos: PointOfSale) -> POSViewModel? {
        if let visit = self.mappedVisits[pos.id] {
            return POSViewModel(id: pos.id, posName: pos.name, adress: pos.adress.text, collected: visit.isCollect, inventoried: visit.isInventory, servised: visit.isService, needCollected: visit.needCollect, needInventoried: visit.needInventory, needServised: visit.needService)
        } else {
            return nil
        }
    }
}

//MARK: - UserProfileModuleOutput
extension PointOfSaleListPresenter: UserProfileModuleOutput {
    
}

//MARK: - AuthManagerOutput
extension PointOfSaleListPresenter: AuthManagerOutput {
    func didSFetchSession(_ session: AuthSession) {}
    
    func didSuccessfully(_ operation: AuthOperation) {
        if operation == .signOut {
            view?.showLoading(false)
            router.openLoginScreen()
        }
    }
    
    func didErrorOccuredOnOperation(_ operation: AuthOperation, error: AmplifyError) {
        if operation == .signOut {
            view?.showLoading(false)
            view?.showMessage(title: NSLocalizedString("Error", comment: ""), message: error.localizedDescription)
        }
    }
}
