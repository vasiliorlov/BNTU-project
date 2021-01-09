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
    //ui
    @IBOutlet weak var lblChooseDate: UILabel!
    @IBOutlet weak var btnLoad: UIButton!
    @IBOutlet weak var textView: UITextView!
    //dependency
    var presenter: CalendarChoiseViewOutput?
    let dateFormatter: DateFormatter = DateFormatter()
    
    //data
    private var serviceDay: Date?
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewIsReady()
    }
    
    
    // MARK: CalendarChoiseViewInput
    func setupInitialState() {
        btnLoad.layer.cornerRadius = btnLoad.frame.height / 2.0
        let tap = UITapGestureRecognizer(target: self, action: #selector(CalendarChoiseViewController.tapFunction))
        lblChooseDate.isUserInteractionEnabled = true
        lblChooseDate.addGestureRecognizer(tap)
        
        dateFormatter.dateStyle = .full
    }
    
    func showError(message: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: NSLocalizedString("Error", comment: ""),
                                          message: message,
                                          preferredStyle: .alert)
            let actionYes = UIAlertAction(title: NSLocalizedString("Ok", comment: ""), style: .default) { _ in }
            alert.addAction(actionYes)
            
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    //MARK: - user action
    @IBAction func btnLoadTouchIn(_ sender: Any) {
        if self.serviceDay != nil {
            self.presenter?.requireLoadData()
        } else {
            showError(message: NSLocalizedString("A service date has not been selected.", comment: ""))
        }
    }
    
    @IBAction func tapFunction(sender: UITapGestureRecognizer) {
        DispatchQueue.main.async {
            let calendarVC = CalendarViewController(dateSelectedBlock: { [weak self] date in
                if let date = date {
                    self?.lblChooseDate.text = self?.dateFormatter.string(from: date)
                    self?.serviceDay = date
                    self?.presenter?.selectedServiceDate(date)
                } else {
                    self?.serviceDay = nil
                    self?.lblChooseDate.text = NSLocalizedString("Choose a service day", comment: "")
                }
            })
            // From you `UIViewController` present it
            self.present(calendarVC, animated: true)
        }
    }
}
