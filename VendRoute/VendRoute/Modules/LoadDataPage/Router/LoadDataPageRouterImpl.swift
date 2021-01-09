//
//  LoadDataPageRouterImpl.swift
//  VendRoute
//
//  Created by Vasili Orlov on 12/12/2020.
//  Copyright © 2020 VR. All rights reserved.
//
import UIKit

class LoadDataPageRouterImpl: LoadDataPageRouter {

    weak var transitionAdapter: TransitionAdapter?

    func openPreviousScreen() {
        self.transitionAdapter?.navigationController?.popViewController(animated: true)
    }
    
    func openPosListScreen() {
        DispatchQueue.main.async {
            let posListVC = PointOfSaleListModuleInitializer.createModule { _ in }
            self.transitionAdapter?.navigationController?.pushViewController(posListVC, animated: true)
        }
    }
}
