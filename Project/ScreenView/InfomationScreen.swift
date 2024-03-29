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
    
    var dataMovie:DataMovie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addData()
        navigationBar()
    }
    
    func addData(){
        txtNameMovie.text = dataMovie?.title
        txtDectiption.text = dataMovie?.description
        if let url = NSURL(string: dataMovie!.image)
        {
            if let data = NSData(contentsOf: url as URL){
                imgBanner.image = UIImage(data: data as Data)
            }
        }
    }
    
    func navigationBar(){
        navigationItem.title = "Thông Tin Chi Tiết"
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .undo , target: self, action: #selector(backView))
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.barTintColor = .brown
    }
    
    @objc func backView(){
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btnBooking(_ sender: Any) {
        let mainVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BookSheet") as! ViewController
               let navigation = UINavigationController(rootViewController: mainVC)
               navigation.modalPresentationStyle = .fullScreen
               self.present(navigation, animated: true, completion: nil)
    }
}
