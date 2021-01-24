//
//  UploadServiceImpl.swift
//  VendRoute
//
//  Created by Vasili Orlov on 23/01/21.
//  Copyright © 2021 Vasili Orlov. All rights reserved.
//

import UIKit
import Amplify

class UploadServiceImpl: UploadService {
    private struct ServicePath {
        static let visit = "/vendvisit"
    }
    
    
    func upload(visits: [VisitApiEntity], callBack: @escaping sendVisitCallBack ) {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        let data = try? encoder.encode(visits)
        let request = RESTRequest(path: ServicePath.visit, body: data)
        
        Amplify.API.post(request: request) { result in
            switch result {
            case .success(let data):
                let str = String(decoding: data, as: UTF8.self)
                print("Visits: \(str)")
                callBack(true, nil)
            case .failure(let apiError):
                print("Visits failed", apiError)
                callBack(false, apiError)
            }
        }
    }
}
