//
//  PointOfSaleViewController.swift
//  VendRoute
//
//  Created by Vasili Orlov on 11/03/2020.
//  Copyright © 2020 VR. All rights reserved.
//

import UIKit

class PointOfSaleViewController: UIViewController, PointOfSaleViewInput, TransitionAdapter {
    
    var presenter: PointOfSaleViewOutput?
    //UI
    @IBOutlet weak var btnCollect: UIButton!
    @IBOutlet weak var btnInventoty: UIButton!
    @IBOutlet weak var btnService: UIButton!
    
    //data
    private var posModel: PosDetailViewModel?
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewIsReady()
    }
    
    
    // MARK: PointOfSaleViewInput
    func setupInitialState() {
    }
    
    func setupBy(posModel: PosDetailViewModel) {
        if let isCollect = posModel.isCollect {
            btnCollect.isEnabled = true
            btnCollect.setImage(isCollect ? UIImage(systemName: "checkmark.square"): UIImage(systemName: "app"), for: .normal)
            btnCollect.imageEdgeInsets.left = -50.0
        } else {
            btnCollect.isEnabled = true
        }
        
        if let isInventory = posModel.isInventory {
            btnInventoty.isEnabled = true
            btnInventoty.setImage(isInventory ? UIImage(systemName: "checkmark.square"): UIImage(systemName: "app"), for: .normal)
            btnInventoty.imageEdgeInsets.left = -50.0
        } else {
            btnInventoty.isEnabled = true
        }
        
        if let isService = posModel.isService {
            btnService.isEnabled = true
            btnService.setImage(isService ? UIImage(systemName: "checkmark.square"): UIImage(systemName: "app"), for: .normal)
            btnService.imageEdgeInsets.left = -50.0
        } else {
            btnService.isEnabled = true
        }
    }
}
