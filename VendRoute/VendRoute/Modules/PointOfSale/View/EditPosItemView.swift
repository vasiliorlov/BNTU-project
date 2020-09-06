//
//  EditPosItemView.swift
//  VendRoute
//
//  Created by Vasili Orlov on 04/09/20.
//  Copyright © 2020 Vasili Orlov. All rights reserved.
//

import UIKit

protocol EditPosItemViewOutput: class {
    func didUpdateInv(_ value: Int, for id: VisitItemId)
    func didUpdateAdd(_ value: Int, for id: VisitItemId)
    func didUpdateRem(_ value: Int, for id: VisitItemId)
    func didUpdateSpoil(_ value: Int, for id: VisitItemId)
    
    func requireCloseView()
}

class EditPosItemView: UIView {
    @IBOutlet weak var imgProduct: UIImageView!
    @IBOutlet weak var lblProductName: UILabel!
    @IBOutlet weak var txtInvField: UnderlinedTextField!
    @IBOutlet weak var txtAddedField: UnderlinedTextField!
    @IBOutlet weak var txtRemField: UnderlinedTextField!
    @IBOutlet weak var txtSpoilField: UnderlinedTextField!
    
    weak var output: EditPosItemViewOutput?
    var viewData: PosItemViewModel? {
        didSet {
            updateView()
        }
    }
    
    var isInventoried: Bool = true {
        didSet {
            updateView()
        }
    }
    
    func updateView() {
        guard let viewData = viewData else {
            return
        }
        lblProductName.text = viewData.productName
        txtInvField.text = "\(viewData.inv)"
        txtInvField.isEnabled = isInventoried
        txtAddedField.text = "\(viewData.add)"
        txtRemField.text = "\(viewData.remove)"
        txtSpoilField.text = "\(viewData.spoil)"
        
        self.setNeedsLayout()
    }
    
    //MARK: - user action
    
    @IBAction func didCloseBtnTouchIn(_ sender: Any) {
        output?.requireCloseView()
    }
}

//MARK: - UITextViewDelegate
extension EditPosItemView: UITextViewDelegate {
    func textViewDidEndEditing(_ textView: UITextView) {
        guard let invValue = Int(textView.text), let id = viewData?.id else { return }
        switch textView {
        case txtInvField: output?.didUpdateInv(invValue, for: id)
        case txtAddedField: output?.didUpdateAdd(invValue, for: id)
        case txtRemField: output?.didUpdateRem(invValue, for: id)
        case txtSpoilField: output?.didUpdateSpoil(invValue, for: id)
            
        default: return
        }
    }
}
