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
        
        collectView.backgroundColor = viewData.collected ? #colorLiteral(red: 0.1579934061, green: 0.7870589495, blue: 0.3260317743, alpha: 1) : #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        collectView.layer.borderWidth = 2.0
        collectView.layer.borderColor = viewData.needCollected ? #colorLiteral(red: 0.1579934061, green: 0.7870589495, blue: 0.3260317743, alpha: 1) : #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        collectView.layer.cornerRadius = collectView.frame.height / 2.0
        
        invView.backgroundColor = viewData.inventoried ? #colorLiteral(red: 0.3289328516, green: 0.781253159, blue: 0.9897740483, alpha: 1) : #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        invView.layer.borderWidth = 2.0
        invView.layer.borderColor = viewData.needInventoried ? #colorLiteral(red: 0.3289328516, green: 0.781253159, blue: 0.9897740483, alpha: 1) : #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        invView.layer.cornerRadius = invView.frame.height / 2.0
        
        serviceView.backgroundColor = viewData.servised ? #colorLiteral(red: 1, green: 0.8057073951, blue: 0, alpha: 1) : #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        serviceView.layer.borderWidth = 2.0
        serviceView.layer.borderColor = viewData.needServised ? #colorLiteral(red: 1, green: 0.8057073951, blue: 0, alpha: 1) : #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        serviceView.layer.cornerRadius = serviceView.frame.height / 2.0
    }
}
