//
//  StartFlowViewController.swift
//  VendRoute
//
//  Created by Vasili Orlov on 24/10/2020.
//  Copyright © 2020 VR. All rights reserved.
//

import UIKit

class StartFlowViewController: UIViewController, StartFlowViewInput, TransitionAdapter {

    var presenter: StartFlowViewOutput?

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewIsReady()
    }


    // MARK: StartFlowViewInput
    func setupInitialState() {
    }
}
