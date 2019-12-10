//
//  SuccessScreen.swift
//  Project
//
//  Created by Cuong DT on 12/9/19.
//  Copyright © 2019 Cuong DT. All rights reserved.
//

import UIKit

class SuccessScreen: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    navigationView()
    }
    
    func navigationView(){
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(backHomeView))
        navigationController?.navigationBar.barTintColor = .brown
    }
    
    @objc func backHomeView(){
        let mainVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeScreen") as! HomeScreen
        let navigation = UINavigationController(rootViewController: mainVC)
        navigation.modalPresentationStyle = .fullScreen
        self.present(navigation, animated: true, completion: nil)
    }
    

    @IBAction func btnMoveToHome(_ sender: Any) {
        let mainVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeScreen") as! HomeScreen
        let navigation = UINavigationController(rootViewController: mainVC)
        navigation.modalPresentationStyle = .fullScreen
        self.present(navigation, animated: true, completion: nil)
    }
}
