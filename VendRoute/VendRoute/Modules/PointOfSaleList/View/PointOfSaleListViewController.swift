//
//  PointOfSaleListViewController.swift
//  VendRoute
//
//  Created by Vasili Orlov on 11/03/2020.
//  Copyright © 2020 VR. All rights reserved.
//

import UIKit

class PointOfSaleListViewController: UIViewController, PointOfSaleListViewInput, TransitionAdapter {
    //UI
    @IBOutlet weak var tableView: UITableView!
    //dependency
    var presenter: PointOfSaleListViewOutput?
    
    //data
    private var data: [POSViewModel] = []
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewIsReady()
    }
    
    
    //MARK: PointOfSaleListViewInput
    func setupInitialState() {
    }
    
    func setup(by data: [POSViewModel]) {
        DispatchQueue.main.async {
            self.data = data
            self.tableView.reloadData()
        }
    }
    //MARK: - user action
    @IBAction func didProfileBtnTouchIn(_ sender: Any) {
    }
    @IBAction func didMapBtnTouchin(_ sender: Any) {
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
}
