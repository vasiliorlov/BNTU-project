//
//  UserProfileViewController.swift
//  VendRoute
//
//  Created by Vasili Orlov on 25/10/2020.
//  Copyright © 2020 VR. All rights reserved.
//

import UIKit

class UserProfileViewController: UIViewController, UserProfileViewInput, TransitionAdapter {
    //UI
    
    @IBOutlet weak var imgUser: UIImageView!
    @IBOutlet weak var lblFirstName: UILabel!
    @IBOutlet weak var lblLastName: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    
    var presenter: UserProfileViewOutput?

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewIsReady()
    }


    // MARK: UserProfileViewInput
    func setupInitialState() {
        imgUser.layer.cornerRadius = imgUser.bounds.height / 2.0
    }
    
    //MARK: - user action
    
    @IBAction func btnCloseDayTouchIn(_ sender: Any) {
    }
    @IBAction func btnLogOutTouchIn(_ sender: Any) {
    }
}
