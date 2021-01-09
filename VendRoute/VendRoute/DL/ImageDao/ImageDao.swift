//
//  ImageDao.swift
//  VendRoute
//
//  Created by Vasili Orlov on 07/01/21.
//  Copyright © 2021 Vasili Orlov. All rights reserved.
//

import UIKit

protocol ImageDao {
    func getInageFor(productId: ProductId) -> UIImage?
}
