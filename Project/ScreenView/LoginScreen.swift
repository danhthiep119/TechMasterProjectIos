//
//  LoginScreen.swift
//  Project
//
//  Created by Cuong DT on 11/26/19.
//  Copyright © 2019 Cuong DT. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
class LoginScreen: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var imgBanner: UIImageView!
    
    @IBOutlet weak var viewUser: UIView!
    @IBOutlet weak var viewPass: UIView!
    
    @IBOutlet weak var txtUser: UITextField!
    @IBOutlet weak var txtPass: UITextField!
    @IBOutlet weak var txtThongBao: UILabel!
    var isSuccess:Bool = false
    @IBOutlet weak var btnDangNhap: UIButton!
    @IBOutlet weak var btnDangKy: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtUser.delegate = self
        txtPass.delegate = self
        editLayout()
        navigationBar()
    }
    
    func navigationBar(){
        navigationItem.title = "Đăng Nhập"
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .undo, target: self, action: #selector(backView))
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.barTintColor = .brown
    }
    
    @objc func backView(){
        dismiss(animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        txtUser.resignFirstResponder()
        txtPass.resignFirstResponder()
        return true
    }
    
    func editLayout(){
        btnDangNhap.layer.cornerRadius = 10
        btnDangKy.layer.cornerRadius = 10
        imgBanner.layer.cornerRadius = 10
        viewUser.layer.cornerRadius = 10
        viewPass.layer.cornerRadius = 10
        txtThongBao.isHidden = true
        txtPass.isSecureTextEntry = true
    }
    
    func checkLogin(user:String, password:String){
        let params = [
        "username": user,
        "password": password
        ]
        let url = "http://vinid-spring-boot.loclx.io/authenticate"
        AF.request(url, method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil).responseObject{ (response: AFDataResponse<User>) in
            let profileResponse = response.value
//            print(profileResponse?.code)
//            print(profileResponse?.jwt)
            if profileResponse?.code == 0
            {
                print(profileResponse?.jwt)
                UserDefaults.standard.set(profileResponse?.jwt, forKey: profileResponse!.jwt)
                self.dismiss(animated: true, completion: nil)
            }
            else {
//                print(profileResponse?.message)
                self.txtThongBao.isHidden = false
                self.txtThongBao.text = profileResponse?.message
            }
        }
    }
    

    @IBAction func btnDangNhap(_ sender: Any) {
        guard let name = txtUser.text else { return}
        guard let pass = txtPass.text else { return}
        checkLogin(user: name,password: pass)
        
    }

    @IBAction func btnDangKy(_ sender: Any) {
    }
    
    
    
    
    
    
    
    
}
