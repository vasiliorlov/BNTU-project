//
//  RouteMapViewInput.swift
//  VendRoute
//
//  Created by Vasili Orlov on 11/03/2020.
//  Copyright © 2020 VR. All rights reserved.
//

protocol RouteMapViewInput: class {

    /**
        @author Vasili Orlov
        Setup initial state of the view
    */

    func setupInitialState()
    func setData(_ data: [PosMapViewModel])
}
