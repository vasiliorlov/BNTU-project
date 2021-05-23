//
//  LoadDataPagePresenter.swift
//  VendRoute
//
//  Created by Vasili Orlov on 12/12/2020.
//  Copyright © 2020 VR. All rights reserved.
//
import Foundation

class LoadDataPagePresenter: LoadDataPageModuleInput, LoadDataPageViewOutput {
    private struct LoadingStep {
        static let measure = "Measure"
        static let product = "Product"
    }
    
    
    // dependencies
    weak var view: LoadDataPageViewInput?
    var router: LoadDataPageRouter
    let downloadManager: DownloadManager
    let appSettings: AppSettings
    
    init(router: LoadDataPageRouter, view: LoadDataPageViewInput, downloadManager: DownloadManager, appSettings: AppSettings) {
        self.view = view
        self.router = router
        self.downloadManager = downloadManager
        self.appSettings = appSettings
    }
    
    //MARK: - LoadDataPageViewOutput
    func viewIsReady() {
        let initData = getSteps()
        view?.setup(data: initData)
        load {
            
        }
    }
    
    //MARK: - private methods
    private func load(_ completion: () -> Void) {
        let serviceDate = appSettings.serviceDate

        downloadManager.loadData(for: serviceDate) { (result) in
            switch result {
            case .success(let step):
                self.view?.update(id: step.descr, with: .loaded)
            case .failure(let error):
                self.view?.showErrorMessage(error.localizedDescription)
            }
        } completion: {
            self.router.openPosListScreen()
        }
    }
    
    private func getSteps() -> [LoadingTitleViewData] {
        return [ LoadingTitleViewData(id: LoadingDataStep.measure.descr, title: LoadingDataStep.measure.descr, state: .loading),
                 LoadingTitleViewData(id: LoadingDataStep.product.descr, title: LoadingDataStep.product.descr, state: .loading),
                 LoadingTitleViewData(id: LoadingDataStep.pos.descr, title: LoadingDataStep.pos.descr, state: .loading),
                 LoadingTitleViewData(id: LoadingDataStep.visit.descr, title: LoadingDataStep.visit.descr, state: .loading),
                 LoadingTitleViewData(id: LoadingDataStep.route.descr, title: LoadingDataStep.route.descr, state: .loading)]
    }
    
}
