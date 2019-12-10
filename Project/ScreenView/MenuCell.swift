//
//  MenuCell.swift
//  Project
//
//  Created by Cuong DT on 12/10/19.
//  Copyright © 2019 Cuong DT. All rights reserved.
//

import UIKit

class MenuCell: UITableViewCell {

    @IBOutlet weak var txtList: UILabel!
    
    var list:List? {
         didSet{
            if let list = list{
                txtList.text = list.nameMenu
            }
        }
    }
}
