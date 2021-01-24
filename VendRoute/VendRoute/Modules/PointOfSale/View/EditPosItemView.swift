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
        txtInvField.delegate = self
        
        txtInvField.isEnabled = isInventoried
        txtInvField.borderStyle = isInventoried ? .roundedRect : .none
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
extension EditPosItemView: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let txt = textField.text,
              let invValue = Int(txt),
              let id = viewData?.id else { return }
        
        switch textField {
        case txtInvField: output?.didUpdateInv(invValue > 99 ? 99 : invValue, for: id)
        case txtAddedField: output?.didUpdateAdd(invValue > 99 ? 99 : invValue, for: id)
        case txtRemField: output?.didUpdateRem(invValue > 99 ? 99 : invValue, for: id)
        case txtSpoilField: output?.didUpdateSpoil(invValue > 99 ? 99 : invValue, for: id)
            
        default: return
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string.count == 0 { //we always allow to remove character
            return true
        }
        let currentText = textField.text as NSString?
        let supposedString = currentText?.replacingCharacters(in: range, with: string)
        let predicate = NSPredicate(format: "SELF MATCHES %@", "^[0-9]{0,2}$")
        let shouldChangeValue = predicate.evaluate(with: supposedString)
        return shouldChangeValue
        
    }
}
