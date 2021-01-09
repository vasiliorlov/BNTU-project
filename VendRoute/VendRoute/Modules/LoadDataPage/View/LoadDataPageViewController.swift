//
//  LoadDataPageViewController.swift
//  VendRoute
//
//  Created by Vasili Orlov on 12/12/2020.
//  Copyright © 2020 VR. All rights reserved.
//

import UIKit

class LoadDataPageViewController: UIViewController, LoadDataPageViewInput, TransitionAdapter {

    var presenter: LoadDataPageViewOutput?
    private var data: [LoadingTitleViewData] = []
    @IBOutlet weak var txtView: UITextView!
    

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewIsReady()
        txtView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
    }


    // MARK: LoadDataPageViewInput
    func showErrorMessage(_ message: String) {
        DispatchQueue.main.async {
            if let _ = self.presentedViewController {
                return
            }
            
            let alert = UIAlertController(title: NSLocalizedString("Error", comment: ""),
                                          message: message,
                                          preferredStyle: .alert)
            let actionOk = UIAlertAction(title: NSLocalizedString("OK", comment: ""),
                                         style: .cancel) { (action: UIAlertAction) in }
            alert.addAction(actionOk)
            self.present(alert, animated: true) { }
        }
    }
    
    func setup(data: [LoadingTitleViewData]) {
        self.data = data
        updateView()
    }
    
    func update(id: String, with state: LoadingTitleState) {
        self.data = data.map({ (item) -> LoadingTitleViewData in
            if item.id == id {
                return LoadingTitleViewData(id: id, title: item.title, state: state)
            } else {
                return item
            }
        })
        
        updateView()
    }
    
    //MARK: - private ui methods
    private func updateView() {
        var string = ""
        for item in data {
            string += "\(item.title) - \(item.state.rawValue)\n"
        }
        
        DispatchQueue.main.async {
            self.txtView.text = string
        }
    }
}
