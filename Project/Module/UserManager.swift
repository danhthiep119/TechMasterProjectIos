//
//  UserManager.swift
//  Project
//
//  Created by Cuong DT on 11/30/19.
//  Copyright © 2019 Cuong DT. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class UserRegister {
    var userName:String
    var email:String
    var pass:String
    
    init(userName:String, email:String,pass:String) {
        self.userName = userName
        self.email = email
        self.pass = pass
    }
}



