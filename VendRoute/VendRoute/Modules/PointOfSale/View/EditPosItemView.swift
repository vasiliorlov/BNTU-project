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

class EditPosItemView: UIView, NibLoadable {
    @IBOutlet weak var imgProduct: UIImageView!
    @IBOutlet weak var lblProductName: UILabel!
    @IBOutlet weak var txtInvField: NoPastedTextField!
    @IBOutlet weak var txtAddedField: NoPastedTextField!
    @IBOutlet weak var txtRemField: NoPastedTextField!
    @IBOutlet weak var txtSpoilField: NoPastedTextField!
    
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
    // MARK: - UI Setup
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupFromNib()
        updateView()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupFromNib()
        updateView()
    }
    
    func updateView() {
        guard let viewData = viewData else {
            return
        }
        lblProductName.text = viewData.productName
        imgProduct.image = viewData.image
        txtInvField.text = viewData.inv.map { "\($0)" }
        txtInvField.isEnabled = isInventoried
        txtAddedField.text = viewData.add.map { "\($0)" }
        txtRemField.text = viewData.remove.map { "\($0)" }
        txtSpoilField.text = viewData.spoil.map { "\($0)" }
        
        self.layer.borderWidth = 2.0
        self.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)

        self.setNeedsLayout()
    }
    
    //MARK: - user action
    
    @IBAction func didCloseBtnTouchIn(_ sender: Any) {
        output?.requireCloseView()
        self.endEditing(true)
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
