//
//  CustomTableViewCell.swift
//  Project
//
//  Created by Cuong DT on 11/28/19.
//  Copyright © 2019 Cuong DT. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var txtTitleMovie: UILabel!
    
    @IBOutlet weak var imgMovie: UIImageView!
    
    @IBOutlet weak var txtDuration: UILabel!
    
    
    @IBOutlet weak var txtDecription: UILabel!
    @IBOutlet weak var btnMore: UIButton!
    
    
    @IBOutlet weak var btnBooking: UIButton!
    
    
    func setMove(move:Movie){
        txtTitleMovie.text = move.title
        txtDuration.text = String(move.durationmin)
        imgMovie.image = move.image
        txtDecription.text = move.decription
    
    }
    
    
    
    
    @IBAction func btnMore(_ sender: Any) {
        
    }
    
    
    @IBAction func btnBooking(_ sender: Any) {
    }
    
    
    
    
    
    
    
    
    
}
