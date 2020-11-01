//
//  RouteMapViewController.swift
//  VendRoute
//
//  Created by Vasili Orlov on 11/03/2020.
//  Copyright © 2020 VR. All rights reserved.
//

import UIKit
import MapKit

class RouteMapViewController: UIViewController, RouteMapViewInput, TransitionAdapter {
    //ui
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    //dependency
    var presenter: RouteMapViewOutput?
    
    //data
    private var posData: [PosMapViewModel] = []
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        presenter?.viewIsReady()
    }
    
    
    // MARK: RouteMapViewInput
    func setupInitialState() {
    }
    
    func setData(_ data: [PosMapViewModel]) {
        DispatchQueue.main.async {
            self.posData = data
            let annotations = data.map{ self.map(model: $0) }
            self.mapView.showAnnotations(annotations, animated: true )
        }
    }
    /*
     // 7.
       let directionRequest = MKDirectionsRequest()
       directionRequest.source = sourceMapItem
       directionRequest.destination = destinationMapItem
       directionRequest.transportType = .Automobile
       
       // Calculate the direction
       let directions = MKDirections(request: directionRequest)
       
       // 8.
       directions.calculateDirectionsWithCompletionHandler {
         (response, error) -> Void in
         
         guard let response = response else {
           if let error = error {
             print("Error: \(error)")
           }
           
           return
         }
         
         let route = response.routes[0]
         self.mapView.addOverlay((route.polyline), level: MKOverlayLevel.AboveRoads)
         
         let rect = route.polyline.boundingMapRect
         self.mapView.setRegion(MKCoordinateRegionForMapRect(rect), animated: true)
       }
     */
    
    //MArk: - user actions
    @IBAction func didBtnBackTouchIn(_ sender: Any) {
    }
    
    //MARK: - private methods
    
    private func map(model pos: PosMapViewModel) -> MKPointAnnotation {
        let placeMark = MKPlacemark(coordinate: pos.location, addressDictionary: nil)
        
        let annotation = MKPointAnnotation()
        annotation.title = pos.title
        annotation.subtitle = "\(pos.adress) \n \(pos.comment ?? "")"
        
        if let location = placeMark.location {
            annotation.coordinate = location.coordinate
        }
        
        return annotation
    }
    
    private func map(pos: PosMapViewModel) -> MKMapItem {
        let placeMark = MKPlacemark(coordinate: pos.location, addressDictionary: nil)
        return MKMapItem(placemark: placeMark)
    }
}

//MARK: - MKMapViewDelegate
extension RouteMapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = .red
        renderer.lineWidth = 4.0
        
        return renderer
    }
}
