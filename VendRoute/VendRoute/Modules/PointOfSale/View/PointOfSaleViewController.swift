//
//  PointOfSaleViewController.swift
//  VendRoute
//
//  Created by Vasili Orlov on 11/03/2020.
//  Copyright © 2020 VR. All rights reserved.
//

import UIKit

class PointOfSaleViewController: UIViewController, PointOfSaleViewInput, TransitionAdapter {

    var presenter: PointOfSaleViewOutput?

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewIsReady()
    }


    // MARK: PointOfSaleViewInput
    func setupInitialState() {
    }
}
