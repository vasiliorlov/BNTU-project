//
//  DownloadServiceImpl.swift
//  VendRoute
//
//  Created by Vasili Orlov on 10/10/20.
//  Copyright © 2020 Vasili Orlov. All rights reserved.
//

import UIKit
import Amplify

class DownloadServiceImpl: DownloadService {
    private struct ServicePath {
        static let uom = "/uom"
        static let product = "/products"
        static let pos = "/pos"
        static let visit = "/vendvisit"
    }
    
    
    func load(measureCallBack: @escaping ServiceMeasureCallBack,
              productCallBack: @escaping ServiceProductCallBack,
              posCallBack: @escaping ServicePosCallBack,
              visitCallBack: @escaping ServiceVisitCallBack) {
        
        loadMeasure(callBack: measureCallBack) {
            self.loadProducts(callBack: productCallBack) {
                self.loadPoses(callBack: posCallBack) {
                    self.loadVisits(callBack: visitCallBack) {
                        
                    }
                }
            }
        }
    }
    
    private func loadMeasure(callBack: @escaping ServiceMeasureCallBack, continueCallBack: @escaping () -> Void) {
        let request = RESTRequest(path: ServicePath.uom)
        Amplify.API.get(request: request) { result in
            switch result {
            case .success(let data):
                let str = String(decoding: data, as: UTF8.self)
                print("Uoms: \(str)")
                
                do {
                    let uoms = try JSONDecoder().decode([MeasureApiEntity].self, from: data)
                    callBack(.success(uoms))
                    continueCallBack()
                    
                } catch let error {
                    callBack(.failure(error))
                }
            case .failure(let apiError):
                print("Uoms failed", apiError)
                callBack(.failure(apiError))
            }
        }
    }
    
    private func loadProducts(callBack: @escaping ServiceProductCallBack, continueCallBack: @escaping () -> Void) {
        let request = RESTRequest(path: ServicePath.product)
        Amplify.API.get(request: request) { result in
            switch result {
            case .success(let data):
                let str = String(decoding: data, as: UTF8.self)
                print("Products: \(str)")
                
                do {
                    let products = try JSONDecoder().decode([ProductApiEntity].self, from: data)
                    callBack(.success(products))
                    continueCallBack()
                    
                } catch let error {
                    callBack(.failure(error))
                }
            case .failure(let apiError):
                print("Products failed", apiError)
                callBack(.failure(apiError))
            }
        }
    }
    
    private func loadPoses(callBack: @escaping ServicePosCallBack, continueCallBack: @escaping () -> Void) {
        let request = RESTRequest(path: ServicePath.pos)
        Amplify.API.get(request: request) { result in
            switch result {
            case .success(let data):
                let str = String(decoding: data, as: UTF8.self)
                print("Poses: \(str)")
                
                do {
                    let poses = try JSONDecoder().decode([PosApiEntity].self, from: data)
                    callBack(.success(poses))
                    continueCallBack()
                    
                } catch let error {
                    callBack(.failure(error))
                }
            case .failure(let apiError):
                print("Poses failed", apiError)
                callBack(.failure(apiError))
            }
        }
    }
    
    private func loadVisits(callBack: @escaping ServiceVisitCallBack, continueCallBack: @escaping () -> Void) {
        let request = RESTRequest(path: ServicePath.visit)
        Amplify.API.get(request: request) { result in
            switch result {
            case .success(let data):
                let str = String(decoding: data, as: UTF8.self)
                print("Visits: \(str)")
                
                do {
                    let visits = try JSONDecoder().decode([VisitApiEntity].self, from: data)
                    callBack(.success(visits))
                    continueCallBack()
                    
                } catch let error {
                    callBack(.failure(error))
                }
            case .failure(let apiError):
                print("Visits failed", apiError)
                callBack(.failure(apiError))
            }
        }
    }
    
}
