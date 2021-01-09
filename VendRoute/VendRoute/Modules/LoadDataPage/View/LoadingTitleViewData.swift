//
//  LoadingTitleViewData.swift
//  VendRoute
//
//  Created by Vasili Orlov on 19/12/20.
//  Copyright © 2020 Vasili Orlov. All rights reserved.
//

import UIKit

enum LoadingTitleState: String {
    case loading = "loading..."
    case loaded = "has been loaded"
}

struct LoadingTitleViewData {
    let id: String
    let title: String
    let state: LoadingTitleState
}
