//
//  UserProfileModuleInput.swift
//  VendRoute
//
//  Created by Vasili Orlov on 25/10/2020.
//  Copyright © 2020 VR. All rights reserved.
//

protocol UserProfileModuleInput: class {
    var output: UserProfileModuleOutput? { get set }
}

protocol UserProfileModuleOutput: class {
}
