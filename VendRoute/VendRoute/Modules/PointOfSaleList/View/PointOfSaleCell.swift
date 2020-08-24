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
        lblAdress.text = viewData.adress
        
        updateFlags()
        
        self.setNeedsLayout()
    }
    
    func updateFlags() {
        guard let viewData = viewData else {
            return
        }
        
        if viewData.collected {
            collectView.backgroundColor = #colorLiteral(red: 0.1579934061, green: 0.7870589495, blue: 0.3260317743, alpha: 1)
        } else {
            collectView.backgroundColor = .clear
            collectView.layer.borderWidth = 2.0
            collectView.layer.borderColor = #colorLiteral(red: 0.1579934061, green: 0.7870589495, blue: 0.3260317743, alpha: 1)
        }
        
        
        if viewData.inventoried {
            invView.backgroundColor = #colorLiteral(red: 0.3289328516, green: 0.781253159, blue: 0.9897740483, alpha: 1)
        } else {
            invView.backgroundColor = .clear
            invView.layer.borderWidth = 2.0
            invView.layer.borderColor = #colorLiteral(red: 0.3289328516, green: 0.781253159, blue: 0.9897740483, alpha: 1)
        }
        
        if viewData.servised {
            serviceView.backgroundColor = #colorLiteral(red: 1, green: 0.8057073951, blue: 0, alpha: 1)
        } else {
            serviceView.backgroundColor = .clear
            serviceView.layer.borderWidth = 2.0
            serviceView.layer.borderColor = #colorLiteral(red: 1, green: 0.8057073951, blue: 0, alpha: 1)
        }
    }
}
