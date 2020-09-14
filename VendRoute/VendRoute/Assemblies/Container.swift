//
//  Container.swift
//  VendRoute
//
//  Created by Vasili Orlov on 3/10/20.
//  Copyright © 2020 Vasili Orlov. All rights reserved.
//

import UIKit

class Container {
    let presentationAsm: PresentationAsm
    let dataAsm: DataAsm
    let domainAsm: DomainAsm
    
    static var shared: Container {
        let instance = Container()
        return instance
    }
    
    private init() {
        self.presentationAsm = PresentationAsmProd()
        self.dataAsm = DataAsmProd()
        self.domainAsm = DomainAsmProd()
    }
    
}
