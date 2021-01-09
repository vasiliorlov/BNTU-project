//
//  PosItemCollectionCell.swift
//  VendRoute
//
//  Created by Vasili Orlov on 06/09/20.
//  Copyright © 2020 Vasili Orlov. All rights reserved.
//

import UIKit

class PosItemCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var lblProductName: UILabel!
    @IBOutlet weak var lblInv: UILabel!
    @IBOutlet weak var lblAdd: UILabel!
    @IBOutlet weak var lblRem: UILabel!
    @IBOutlet weak var lblSpoil: UILabel!
    
    var viewData: PosItemViewModel? {
        didSet {
            updateView()
        }
    }
    
    func updateView() {
        guard let data = viewData else { return }
        lblProductName.text = data.productName
        lblInv.text = data.inv.map { "\($0)"}
        lblAdd.text = data.inv.map { "\($0)"}
        lblRem.text = data.inv.map { "\($0)"}
        lblSpoil.text = data.inv.map { "\($0)"}
        
        self.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        self.layer.borderWidth = 1.0
        self.layer.cornerRadius = 4.0
        
        self.imageView.image = data.image
        self.setNeedsLayout()
    }
}
