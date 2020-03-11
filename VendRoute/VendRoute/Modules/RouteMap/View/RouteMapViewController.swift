//
//  RouteMapViewController.swift
//  VendRoute
//
//  Created by Vasili Orlov on 11/03/2020.
//  Copyright © 2020 VR. All rights reserved.
//

import UIKit

class RouteMapViewController: UIViewController, RouteMapViewInput, TransitionAdapter {

    var presenter: RouteMapViewOutput?

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewIsReady()
    }


    // MARK: RouteMapViewInput
    func setupInitialState() {
    }
}
