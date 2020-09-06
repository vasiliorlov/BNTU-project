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
        lblInv.text = "\(data.inv)"
        lblAdd.text = "\(data.add)"
        lblRem.text = "\(data.remove)"
        lblSpoil.text = "\(data.spoil)"
        
        self.setNeedsLayout()
    }
}
