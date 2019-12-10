//
//  PayScreen.swift
//  Project
//
//  Created by Cuong DT on 12/9/19.
//  Copyright © 2019 Cuong DT. All rights reserved.
//

import UIKit

class PayScreen: UIViewController {

    @IBOutlet weak var txtName: UILabel!
    @IBOutlet weak var txtEmail: UILabel!
    @IBOutlet weak var txtSheetOrder: UILabel!
    @IBOutlet weak var txtTotal: UILabel!
    var userManager:UserManager?
    var total:Float = 0
    var choose:[Int] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        for info in choose
        {
            txtSheetOrder.text? += "\(String(info)),"
        }
        txtName.text = userManager?.userName
        txtEmail.text = userManager?.email
        txtTotal.text = "\(String(total))"
        navigationItem.title = "Thanh Toán"
            navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .undo, target: self, action: #selector(backView))
            navigationController?.navigationBar.tintColor = .white
            navigationController?.navigationBar.barTintColor = .brown
        }
        
        @objc func backView(){
            self.dismiss(animated: true, completion: nil)
        }
    @IBAction func btnPay(_ sender: Any) {
        let mainVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SuccessScreen") as! SuccessScreen
        let navigation = UINavigationController(rootViewController: mainVC)
        navigation.modalPresentationStyle = .fullScreen
        self.present(navigation, animated: true, completion: nil)
    }
}
