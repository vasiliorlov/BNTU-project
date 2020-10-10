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
typealias ServiceGpsCallBack = (Result<[GpsApiEntity], Error>) -> Void
typealias ServiceAdressCallBack = (Result<[AdressApiEntity], Error>) -> Void
typealias ServicePosCallBack = (Result<[PosApiEntity], Error>) -> Void
typealias ServiceVisitItemCallBack = (Result<[VisitItemApiEntity], Error>) -> Void
typealias ServiceVisitCallBack = (Result<[VisitApiEntity], Error>) -> Void



protocol DownloadService {
    func loaad(measureCallBack: ServiceMeasureCallBack?,
               productCallBack: ServiceProductCallBack?,
               gpsCallBack: ServiceGpsCallBack?,
               adressCallBack: ServiceAdressCallBack?,
               posCallBack: ServicePosCallBack?,
               visitItemsCallBack: ServiceVisitItemCallBack?,
               visitCallBack: ServiceVisitCallBack?)
}
