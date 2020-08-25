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
    @IBOutlet weak var lblPosName: UILabel!
    
    @IBOutlet weak var btnCollect: UIButton!
    @IBOutlet weak var btnInventoty: UIButton!
    @IBOutlet weak var btnService: UIButton!
    
    
    @IBOutlet weak var lblCash: UILabel!
    @IBOutlet weak var txtCash: UITextField!
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
        DispatchQueue.main.async {
            self.lblPosName.text = posModel.name
            let checkImage = UIImage(systemName: "checkmark.square")?.withRenderingMode(.alwaysTemplate)
            let uncheckImage = UIImage(systemName: "app")?.withRenderingMode(.alwaysTemplate)
            
            if let isCollect = posModel.isCollect {
                self.btnCollect.isEnabled = true
                self.btnCollect.setImage(isCollect ? checkImage : uncheckImage, for: .normal)
                self.btnCollect.imageEdgeInsets.left = -20.0
                self.btnCollect.tintColor = #colorLiteral(red: 0.1442646384, green: 0.7079803348, blue: 0.2932031453, alpha: 1)
            } else {
                self.btnCollect.isEnabled = false
            }
            
            if let isInventory = posModel.isInventory {
                self.btnInventoty.isEnabled = true
                self.btnInventoty.setImage(isInventory ? checkImage : uncheckImage, for: .normal)
                self.btnInventoty.imageEdgeInsets.left = -20.0
                self.btnInventoty.tintColor = #colorLiteral(red: 0.2962264717, green: 0.7031357884, blue: 0.8908132911, alpha: 1)
            } else {
                self.btnInventoty.isEnabled = true
            }
            
            if let isService = posModel.isService {
                self.btnService.isEnabled = false
                self.btnService.setImage(isService ? checkImage : uncheckImage, for: .normal)
                self.btnService.imageEdgeInsets.left = -20.0
                self.btnService.tintColor = #colorLiteral(red: 0.9028488994, green: 0.7228065729, blue: 0, alpha: 1)
            } else {
                self.btnService.isEnabled = false
            }
        }
    }
    
    //MARK: - user action
    
    @IBAction func didBtnBackTouchIn(_ sender: Any) {
    }
    @IBAction func didBtnCollectTouchIn(_ sender: Any) {
    }
    @IBAction func didBtnInventoryTouchIn(_ sender: Any) {
    }
    @IBAction func didBtnSrviceTouchIn(_ sender: Any) {
    }
}
