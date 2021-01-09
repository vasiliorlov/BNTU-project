//
//  DownloadService.swift
//  VendRoute
//
//  Created by Vasili Orlov on 10/10/20.
//  Copyright © 2020 Vasili Orlov. All rights reserved.
//

import UIKit

typealias ServiceMeasureCallBack = (Result<[MeasureApiEntity], Error>) -> Void
typealias ServiceProductCallBack = (Result<[ProductApiEntity], Error>) -> Void
typealias ServicePosCallBack = (Result<[PosApiEntity], Error>) -> Void
typealias ServiceVisitCallBack = (Result<[VisitApiEntity], Error>) -> Void



protocol DownloadService {
    func load(measureCallBack: @escaping ServiceMeasureCallBack,
               productCallBack: @escaping ServiceProductCallBack,
               posCallBack: @escaping ServicePosCallBack,
               visitCallBack: @escaping ServiceVisitCallBack)
}
