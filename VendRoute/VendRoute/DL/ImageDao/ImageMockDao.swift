//
//  ImageMockDao.swift
//  VendRoute
//
//  Created by Vasili Orlov on 07/01/21.
//  Copyright © 2021 Vasili Orlov. All rights reserved.
//

import UIKit

class ImageMockDao: ImageDao {
    func getInageFor(productId: ProductId) -> UIImage? {
        switch productId {
        case "10", "11", "12": return #imageLiteral(resourceName: "icCocaCola")
        case "20", "21", "22": return #imageLiteral(resourceName: "icPepsi")
        case "30", "31", "32": return #imageLiteral(resourceName: "icMars")
        case "40", "41", "42": return #imageLiteral(resourceName: "icSnikers")
        default: return nil
        }
    }
}
