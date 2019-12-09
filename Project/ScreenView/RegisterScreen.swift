//
//  RegisterScreen.swift
//  Project
//
//  Created by Cuong DT on 11/28/19.
//  Copyright © 2019 Cuong DT. All rights reserved.
//

import UIKit
import Alamofire
class RegisterScreen: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var viewTitle: UIView!
    @IBOutlet weak var viewUser: UIView!
    @IBOutlet weak var viewPass: UIView!
    @IBOutlet weak var viewPassRepeat: UIView!
    @IBOutlet weak var btnRegister: UIButton!
    @IBOutlet weak var viewEmail: UIView!
    @IBOutlet weak var txtUser: UITextField!
    @IBOutlet weak var txtPass: UITextField!
    @IBOutlet weak var txtPassRe: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtTBUser: UILabel!
    @IBOutlet weak var txtTBPass: UILabel!
    @IBOutlet weak var txtTBPassRe: UILabel!
    @IBOutlet weak var txtTBEmail: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        editLayout()
        navigationView()
    }
    
    func navigationView(){
        
        navigationController?.navigationBar.tintColor = .white
        navigationItem.title = "Đăng Ký"
        navigationController?.navigationBar.barTintColor = .brown
//            navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .redo, target: self, action: #selector(backView))
    }

//    @objc func backView(){
//        dismiss(animated: true, completion: nil)
//    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        txtUser.resignFirstResponder()
        txtPass.resignFirstResponder()
        txtEmail.resignFirstResponder()
        txtPassRe.resignFirstResponder()
        return true
    }
    

    func editLayout(){
        viewTitle.layer.cornerRadius = 10
        viewUser.layer.cornerRadius = 10
        viewPass.layer.cornerRadius = 10
        viewPassRepeat.layer.cornerRadius = 10
        viewEmail.layer.cornerRadius = 10
        btnRegister.layer.cornerRadius = 10
        txtPassRe.isSecureTextEntry = true
        txtPass.isSecureTextEntry = true
        txtTBPass.isHidden = true
        txtTBUser.isHidden = true
        txtTBEmail.isHidden = true
        txtTBPassRe.isHidden = true
        txtUser.delegate = self
        txtEmail.delegate = self
        txtPass.delegate = self
        txtPassRe.delegate = self
    }
    @IBAction func btnRegister(_ sender: Any) {
        guard let user = txtUser.text,!user.isEmpty  else {
            txtTBUser.isHidden = false
            txtTBUser.text = "Chưa nhập tên tài khoản"
            return}
        guard let email = txtEmail.text, !email.isEmpty else {
            txtTBEmail.isHidden = false
            txtTBEmail.text = "Chưa nhập Email"
            return}
        guard let pass = txtPass.text, !pass.isEmpty else {
            txtTBPass.isHidden = false
            txtPass.text = "Chưa nhập mật khẩu"
            return}
        guard let passre = txtPassRe.text, !passre.isEmpty else {
        txtTBPassRe.isHidden = false
        txtTBPassRe.text = "Chưa nhập lại mật khẩu"
            return}
        if pass == passre {
            register(user: user, password: pass, email: email)
        }
        else {
            txtTBUser.isHidden = false
            txtTBUser.text = "Chưa nhập tên tài khoản"
        }
        
    }
    
    func register(user:String, password:String,email:String){
        let params = [
        "username": user,
        "password": password,
        "email": email
        ]
        let url = "http://vinid-spring-boot.loclx.io/users"
        AF.request(url, method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil).responseObject{ (response: AFDataResponse<User>) in
            let profileResponse = response.value
            print(profileResponse?.code)
            if profileResponse?.code == 0
            {
                UserDefaults.standard.string(forKey: profileResponse!.jwt) ?? ""
//                let mainVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Login") as! HomeScreen
//                let navigation = UINavigationController(rootViewController: mainVC)
//                navigation.modalPresentationStyle = .fullScreen
                self.dismiss( animated: true, completion: nil)
            }
            else {
                print(profileResponse?.message)
//                self.txtTBUser.isHidden = false
                self.txtTBUser.text = profileResponse?.message
            }
        }
    }
    
}
