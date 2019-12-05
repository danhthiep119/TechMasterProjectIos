//
//  InfomationScreen.swift
//  Project
//
//  Created by Cuong DT on 11/29/19.
//  Copyright © 2019 Cuong DT. All rights reserved.
//

import UIKit

class InfomationScreen: UIViewController {

    @IBOutlet weak var txtNameMovie: UILabel!
    @IBOutlet weak var imgBanner: UIImageView!
    
    @IBOutlet weak var txtDectiption: UILabel!
    
    
    var movie:Movie?
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let m = movie else { return}
        txtNameMovie.text = m.title
        imgBanner.image = m.image
        txtDectiption.text = m.decription
    }
    

}
