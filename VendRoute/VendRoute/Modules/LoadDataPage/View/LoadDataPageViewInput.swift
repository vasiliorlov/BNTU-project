//
//  LoadDataPageViewInput.swift
//  VendRoute
//
//  Created by Vasili Orlov on 12/12/2020.
//  Copyright © 2020 VR. All rights reserved.
//

protocol LoadDataPageViewInput: class {

    /**
        @author Vasili Orlov
        Setup initial state of the view
    */
    func showErrorMessage(_ message: String)
    func setup(data: [LoadingTitleViewData])
    func update(id: String, with state: LoadingTitleState)
}
