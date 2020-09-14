//
//  CalendarChoiseViewController.swift
//  VendRoute
//
//  Created by Vasili Orlov on 14/09/2020.
//  Copyright © 2020 VR. All rights reserved.
//

import UIKit

class CalendarChoiseViewController: UIViewController, CalendarChoiseViewInput, TransitionAdapter {

    var presenter: CalendarChoiseViewOutput?

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewIsReady()
    }


    // MARK: CalendarChoiseViewInput
    func setupInitialState() {
    }
}
