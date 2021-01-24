//
//  PointOfSaleListViewInput.swift
//  VendRoute
//
//  Created by Vasili Orlov on 11/03/2020.
//  Copyright © 2020 VR. All rights reserved.
//

protocol PointOfSaleListViewInput: class {

    /**
        @author Vasili Orlov
        Setup initial state of the view
    */

    func setupInitialState()
    func setup(by data: [POSViewModel])
    func showLoading(_ isActive: Bool)
    func showMessage(title: String, message: String)
}
