//
//  User.swift
//  Project
//
//  Created by Cuong DT on 12/6/19.
//  Copyright © 2019 Cuong DT. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

class User: Mappable {
    var code = 0
    var message = ""
    var dataUser: DataUser?
    var jwt = ""

    required convenience init?(map: Map) {
        self.init()
    }

    func mapping(map: Map) {
        code <- map["code"]
        message <- map["message"]
        dataUser <- map["dataUser"]
        jwt <- map["jwt"]
    }
}

class DataUser: Mappable {
    var id = 0
    var createdDate = Date()
    var modifiedDate = Date()
    var username = ""
    var email = ""
    var password = ""
//    var reservations = [Reservations]()

    required convenience init?(map: Map) {
        self.init()
    }

    func mapping(map: Map) {
        id <- map["id"]
        createdDate <- (map["createdDate"], DateTransform())
        modifiedDate <- (map["modifiedDate"], DateTransform())
        username <- map["username"]
        email <- map["email"]
        password <- map["password"]
//        reservations <- map["reservations"]
    }
}



