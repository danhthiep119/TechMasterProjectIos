//
//  Movie.swift
//  Project
//
//  Created by Cuong DT on 11/28/19.
//  Copyright © 2019 Cuong DT. All rights reserved.
//

import Foundation
import UIKit

import ObjectMapper
class Movie: Mappable {
    var count = 0
    var dataMovie = [DataMovie]()

    required convenience init?(map: Map) {
        self.init()
    }

    func mapping(map: Map) {
        count <- map["count"]
        dataMovie <- map["dataMovie"]
    }
}

class DataMovie: Mappable {
    var id = 0
    var createdDate = Date()
    var modifiedDate = Date()
    var title = ""
    var duration_min = 0
    var image = ""
    var description = ""
    var status = ""
    var screenings = [Screenings]()

    required convenience init?(map: Map) {
        self.init()
    }

    func mapping(map: Map) {
        id <- map["id"]
        createdDate <- (map["createdDate"], DateTransform())
        modifiedDate <- (map["modifiedDate"], DateTransform())
        title <- map["title"]
        duration_min <- map["duration_min"]
        image <- map["image"]
        description <- map["description"]
        status <- map["status"]
        screenings <- map["screenings"]
    }
}

class Screenings: Mappable {
    var id = 0
    var createdDate = Date()
    var modifiedDate = Date()
    var amount = 0
    var auditorium_id = 0
    var start_time = ""
    var start_date = ""
    var movie_id = 0
    var reservedSeats = [ReservedSeats]()

    required convenience init?(map: Map) {
        self.init()
    }

    func mapping(map: Map) {
        id <- map["id"]
        createdDate <- (map["createdDate"], DateTransform())
        modifiedDate <- (map["modifiedDate"], DateTransform())
        amount <- map["amount"]
        auditorium_id <- map["auditorium_id"]
        start_time <- map["start_time"]
        start_date <- map["start_date"]
        movie_id <- map["movie_id"]
        reservedSeats <- map["reservedSeats"]
    }
}

class ReservedSeats: Mappable {
    var id = 0
    var createdDate = Date()
    var modifiedDate = Date()
    var seat_id = 0
    var reservation_id = 0
    var screening_id = 0
    var type_id = 0

    required convenience init?(map: Map) {
        self.init()
    }

    func mapping(map: Map) {
        id <- map["id"]
        createdDate <- (map["createdDate"], DateTransform())
        modifiedDate <- (map["modifiedDate"], DateTransform())
        seat_id <- map["seat_id"]
        reservation_id <- map["reservation_id"]
        screening_id <- map["screening_id"]
        type_id <- map["type_id"]
    }
}
