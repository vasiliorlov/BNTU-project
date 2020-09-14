//
//  UserModel.swift
//  VendRoute
//
//  Created by Vasili Orlov on 14/09/20.
//  Copyright © 2020 Vasili Orlov. All rights reserved.
//

import UIKit

class UserModel {
    let email: String
    let password: String
    
    init(email: String, password: String) {
        self.email = email
        self.password = password
    }
}
