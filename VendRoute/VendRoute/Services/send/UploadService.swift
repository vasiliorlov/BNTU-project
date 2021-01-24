//
//  UploadService.swift
//  VendRoute
//
//  Created by Vasili Orlov on 23/01/21.
//  Copyright © 2021 Vasili Orlov. All rights reserved.
//

import UIKit

typealias sendVisitCallBack = (_ sucess: Bool, _ error: Error?) -> Void

protocol UploadService {
    func upload(visits: [VisitApiEntity], callBack: @escaping sendVisitCallBack)
}
