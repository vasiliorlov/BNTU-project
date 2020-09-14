//
//  DomainAsmProd.swift
//  VendRoute
//
//  Created by Vasili Orlov on 14/09/20.
//  Copyright © 2020 Vasili Orlov. All rights reserved.
//

import UIKit

class DomainAsmProd: DomainAsm {
    lazy private var authAmolifyManagerInstance: AuthManager = AmplifyAuthManager()
    
    var authManager: AuthManager {
        return authAmolifyManagerInstance
    }
}
