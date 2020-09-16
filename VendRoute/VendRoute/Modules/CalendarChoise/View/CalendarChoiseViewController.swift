//
//  CalendarChoiseViewController.swift
//  VendRoute
//
//  Created by Vasili Orlov on 14/09/2020.
//  Copyright © 2020 VR. All rights reserved.
//

import UIKit
import CalendarFoundation

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
    
    func showDatePicker() {
        DispatchQueue.main.async {
            let calendarVC = CalendarViewController(dateSelectedBlock: { [weak self] date in
                if let date = date {
                    presenter?.selectedServiceDate(date)
                } else {
                    // user selected option "Remove date" = `date` is `nil`
                }
            })
            
            // From you `UIViewController` present it
            self.present(calendarVC, animated: true)
        }
    }
    
}
