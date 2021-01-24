//
//  PointOfSaleListViewController.swift
//  VendRoute
//
//  Created by Vasili Orlov on 11/03/2020.
//  Copyright © 2020 VR. All rights reserved.
//

import UIKit
import MBProgressHUD

class PointOfSaleListViewController: UIViewController, PointOfSaleListViewInput, TransitionAdapter {
    //UI
    @IBOutlet weak var tableView: UITableView!
    var menuView: UIAlertController?
    //dependency
    var presenter: PointOfSaleListViewOutput?
    
    //data
    private var data: [POSViewModel] = []
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewIsReady()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter?.didViewAppear()
        
    }
    
    func showLoading(_ isActive: Bool) {
        DispatchQueue.main.async {
            if isActive {
                let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
            } else {
                MBProgressHUD.hide(for: self.view, animated: true)
            }
        }
    }
    
    func showMessage(title: String, message: String) {
        DispatchQueue.main.async {
            if let _ = self.presentedViewController {
                return
            }
            
            let alert = UIAlertController(title: title,
                                          message: message,
                                          preferredStyle: .alert)
            let actionOk = UIAlertAction(title: NSLocalizedString("OK", comment: ""),
                                         style: .cancel) { (action: UIAlertAction) in }
            alert.addAction(actionOk)
            self.present(alert, animated: true) { }
        }
    }
    
    //MARK: PointOfSaleListViewInput
    func setupInitialState() {
        setupMenu()
    }
    
    func setup(by data: [POSViewModel]) {
        DispatchQueue.main.async {
            self.data = data
            self.tableView.reloadData()
        }
    }
    //MARK: - private methods
    
    private func setupMenu() {
        menuView = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        menuView?.addAction(UIAlertAction(title: "End Of Day", style: .default) { _ in
            self.presenter?.requireEndOfDay()
        })
        menuView?.addAction(UIAlertAction(title: "Log Out", style: .default) { _ in
            
        })
        menuView?.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { _ in}))
    }
    
    //MARK: - user action
    @IBAction func didMenuBtnTouchIn(_ sender: Any) {
        present(menuView!, animated: true)
        //presenter?.requireOpenUserProfile()
    }
    
    @IBAction func didMapBtnTouchin(_ sender: Any) {
        presenter?.requireOpenMap()
    }
}

//MARK: - UITableViewDelegate, UITableViewDataSourc
extension PointOfSaleListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "posCellId") as? PointOfSaleCell {
            let cellData = data[indexPath.row]
            cell.viewData = cellData
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellData = data[indexPath.row]
        presenter?.didSelectModel(with: cellData.id)
    }
}
