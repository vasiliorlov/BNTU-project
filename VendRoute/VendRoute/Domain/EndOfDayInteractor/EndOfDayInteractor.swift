//
//  EndOfDayInteractor.swift
//  VendRoute
//
//  Created by Vasili Orlov on 24/01/21.
//  Copyright © 2021 Vasili Orlov. All rights reserved.
//

import UIKit

protocol EndOfDayInteractor {
    func endOfDay(_ completion: @escaping (Bool, Error?) -> Void)
}
