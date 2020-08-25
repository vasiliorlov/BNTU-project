//
//  PointOfSaleListRouterImpl.swift
//  VendRoute
//
//  Created by Vasili Orlov on 11/03/2020.
//  Copyright © 2020 VR. All rights reserved.
//
import Foundation
class PointOfSaleListRouterImpl: PointOfSaleListRouter {
    
    weak var transitionAdapter: TransitionAdapter?
    
    func openPreviousScreen() {
        DispatchQueue.main.async {
            self.transitionAdapter?.navigationController?.popViewController(animated: true)
        }
    }
    
    func openVisitScreen(for posId: PosId){
        let overviewVC = PointOfSaleModuleInitializer.createModule { input in
            input.posId = posId
        }
        DispatchQueue.main.async {
            self.transitionAdapter?.navigationController?.pushViewController(overviewVC, animated: true)
        }
    }
}
