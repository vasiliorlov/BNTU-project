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
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var lblPosName: UILabel!
    @IBOutlet weak var btnCollect: UIButton!
    @IBOutlet weak var btnInventoty: UIButton!
    @IBOutlet weak var btnService: UIButton!
    
    
    @IBOutlet weak var lblCash: UILabel!
    @IBOutlet weak var txtCash: UITextField!
    
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var editItemView: EditPosItemView!
    //data
    private var posModel: PosDetailViewModel?
    private var itemModels: [PosItemViewModel] = []
    //const
    let checkImage = UIImage(systemName: "checkmark.square")?.withRenderingMode(.alwaysTemplate)
    let uncheckImage = UIImage(systemName: "app")?.withRenderingMode(.alwaysTemplate)
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewIsReady()
    }
    
    
    // MARK: PointOfSaleViewInput
    func setupInitialState() {
        shadowView.isHidden = true
        editItemView.isHidden = true
        editItemView.output = self
    }
    
    func setupBy(posModel: PosDetailViewModel) {
        self.posModel = posModel
        self.updateHeader()
    }
    
    func setupBy(posItemModels: [PosItemViewModel]) {
        DispatchQueue.main.async {
            self.itemModels = posItemModels
            self.collectionView.reloadData()
        }
    }
    
    private func updateHeader() {
        DispatchQueue.main.async {
            if let viewData = self.posModel {
                self.lblPosName.text = viewData.name
                
                if let isCollect = viewData.isCollect {
                    self.btnCollect.isEnabled = true
                    self.btnCollect.setImage(isCollect ? self.checkImage : self.uncheckImage, for: .normal)
                    self.btnCollect.imageEdgeInsets.left = -20.0
                    self.btnCollect.tintColor = #colorLiteral(red: 0.1442646384, green: 0.7079803348, blue: 0.2932031453, alpha: 1)
                    self.txtCash.isEnabled = true
                } else {
                    self.txtCash.isEnabled = false
                    self.txtCash.borderStyle = .none
                    self.btnCollect.isEnabled = false
                }
                
                if let isInventory = viewData.isInventory {
                    self.btnInventoty.isEnabled = true
                    self.btnInventoty.setImage(isInventory ? self.checkImage : self.uncheckImage, for: .normal)
                    self.btnInventoty.imageEdgeInsets.left = -20.0
                    self.btnInventoty.tintColor = #colorLiteral(red: 0.2962264717, green: 0.7031357884, blue: 0.8908132911, alpha: 1)
                } else {
                    self.btnInventoty.isEnabled = true
                }
                
                if let isService = viewData.isService {
                    self.btnService.isEnabled = true
                    self.btnService.setImage(isService ? self.checkImage : self.uncheckImage, for: .normal)
                    self.btnService.imageEdgeInsets.left = -20.0
                    self.btnService.tintColor = #colorLiteral(red: 0.9028488994, green: 0.7228065729, blue: 0, alpha: 1)
                } else {
                    self.btnService.isEnabled = false
                }
            }
        }
    }
    
    //MARK: - user action
    @IBAction func didBtnBackTouchIn(_ sender: Any) {
        presenter?.requireCloseScreen()
    }
    
    @IBAction func didBtnCollectTouchIn(_ sender: Any) {
        if let viewData = self.posModel {
            viewData.isCollect?.toggle()
            updateHeader()
            presenter?.didUpdateVisit(viewData)
        }
    }
    
    @IBAction func didBtnInventoryTouchIn(_ sender: Any) {
        if let viewData = self.posModel {
            viewData.isInventory?.toggle()
            updateHeader()
            presenter?.didUpdateVisit(viewData)
        }
    }
    
    @IBAction func didBtnSrviceTouchIn(_ sender: Any) {
        if let viewData = self.posModel {
            viewData.isService?.toggle()
            updateHeader()
            presenter?.didUpdateVisit(viewData)
        }
    }
}

//MARK: -  UICollectionViewDelegate, UICollectionViewDataSource
extension PointOfSaleViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        let rowCount = itemModels.map { $0.row }.max()
        if rowCount != nil {
            return rowCount! + 1
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let columnCount = itemModels.filter{ $0.row == section }.map { $0.column }.max()
        if columnCount != nil {
            return columnCount! + 1
        } else {
            return 0
        }
    }
 
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let item = collectionView.dequeueReusableCell(withReuseIdentifier: "posItemCellId", for: indexPath)  as? PosItemCollectionCell {
            if let viewData = itemModels.first(where: { $0.row == indexPath.section && $0.column == indexPath.row }) {
                item.viewData = viewData
            }
            
            return item
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let posData = self.posModel,
           let viewData = itemModels.first(where: { $0.row == indexPath.section && $0.column == indexPath.row }) {
            editItemView.viewData = viewData
            editItemView.isInventoried = posData.isInventory != nil
            editItemView.isHidden = false
            shadowView.isHidden = false
        }
    }
}

//MARK: - EditPosItemViewOutput
extension PointOfSaleViewController: EditPosItemViewOutput {
    func didUpdateInv(_ value: Int, for id: VisitItemId) {
        if let item = itemModels.first(where: { $0.id == id}) {
            item.inv = value
            presenter?.didUpdateItem(item)
            collectionView.reloadData()
        }
    }
    
    func didUpdateAdd(_ value: Int, for id: VisitItemId) {
        if let item = itemModels.first(where: { $0.id == id}) {
            item.add = value
            presenter?.didUpdateItem(item)
            collectionView.reloadData()
        }
    }
    
    func didUpdateRem(_ value: Int, for id: VisitItemId) {
        if let item = itemModels.first(where: { $0.id == id}) {
            item.remove = value
            presenter?.didUpdateItem(item)
            collectionView.reloadData()
        }
    }
    
    func didUpdateSpoil(_ value: Int, for id: VisitItemId) {
        if let item = itemModels.first(where: { $0.id == id}) {
            item.spoil = value
            presenter?.didUpdateItem(item)
            collectionView.reloadData()
        }
    }
    
    func requireCloseView() {
        editItemView.isHidden = true
        shadowView.isHidden = true
    }
}
