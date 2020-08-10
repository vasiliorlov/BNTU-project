//
//  PointOfSaleCell.swift
//  VendRoute
//
//  Created by Vasili Orlov on 10/08/20.
//  Copyright © 2020 Vasili Orlov. All rights reserved.
//

import UIKit

class PointOfSaleCell: UITableViewCell {
    @IBOutlet weak var collectView: UIView!
    @IBOutlet weak var invView: UIView!
    @IBOutlet weak var serviceView: UIView!
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblAdress: UILabel!
    
    var viewData: POSViewModel? {
        didSet {
            updateView()
        }
    }
    
    func updateView() {
        guard let viewData = viewData else {
            return
        }
        lblName.text = viewData.posName

        self.setNeedsLayout()
    }
}
