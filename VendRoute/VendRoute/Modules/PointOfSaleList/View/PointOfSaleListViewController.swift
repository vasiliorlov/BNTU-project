//
//  PointOfSaleListViewController.swift
//  VendRoute
//
//  Created by Vasili Orlov on 11/03/2020.
//  Copyright © 2020 VR. All rights reserved.
//

import UIKit

class PointOfSaleListViewController: UIViewController, PointOfSaleListViewInput, TransitionAdapter {

    var presenter: PointOfSaleListViewOutput?

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewIsReady()
    }


    // MARK: PointOfSaleListViewInput
    func setupInitialState() {
    }
}
