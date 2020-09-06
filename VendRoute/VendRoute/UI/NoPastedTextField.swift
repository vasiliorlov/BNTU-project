//
//  NoPastedTextField.swift
//  RouteDriver
//
//  Created by Vasili Arlou on 11/12/18.
//  Copyright © 2018 Stylesoft. All rights reserved.
//

import Foundation
import UIKit

class NoPastedTextField: UITextField {
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        if action == #selector(UIResponderStandardEditActions.paste(_:)) || action == #selector(UIResponderStandardEditActions.cut(_:)) {
            return false
        }
        return super.canPerformAction(action, withSender: sender)
    }
}
