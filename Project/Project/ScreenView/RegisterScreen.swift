//
//  RegisterScreen.swift
//  Project
//
//  Created by Cuong DT on 11/28/19.
//  Copyright © 2019 Cuong DT. All rights reserved.
//

import UIKit

class RegisterScreen: UIViewController {

    @IBOutlet weak var viewTitle: UIView!
    
    @IBOutlet weak var viewUser: UIView!
    
    @IBOutlet weak var viewPass: UIView!
    
    @IBOutlet weak var viewPassRepeat: UIView!
    
    @IBOutlet weak var btnRegister: UIButton!
    @IBOutlet weak var viewEmail: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        editLayout()
    }
    

        func editLayout(){
            viewTitle.layer.cornerRadius = 10
            viewUser.layer.cornerRadius = 10
            viewPass.layer.cornerRadius = 10
            viewPassRepeat.layer.cornerRadius = 10
            viewEmail.layer.cornerRadius = 10
            btnRegister.layer.cornerRadius = 10
        }

}
