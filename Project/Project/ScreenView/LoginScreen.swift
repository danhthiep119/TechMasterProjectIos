//
//  LoginScreen.swift
//  Project
//
//  Created by Cuong DT on 11/26/19.
//  Copyright © 2019 Cuong DT. All rights reserved.
//

import UIKit

class LoginScreen: UIViewController {

    
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
        txtThongBao.isHidden = true
        editLayout()
    }
    
    func editLayout(){
        btnDangNhap.layer.cornerRadius = 10
        btnDangKy.layer.cornerRadius = 10
        imgBanner.layer.cornerRadius = 10
        viewUser.layer.cornerRadius = 10
        viewPass.layer.cornerRadius = 10
//        btnDangNhap.addTarget(self, action: #selector(checkLogin), for: .touchUpInside)
    }
    
    func checkLogin(){
        if txtUser.text == nil{
            txtThongBao.isHidden = false
            txtThongBao.text = "Bạn để trống tài khoản!"
        }
        if txtUser.text != nil{
            if txtPass == nil {
                txtThongBao.isHidden = false
                txtThongBao.text = "Bạn để trống mật khẩu"
            }
            else
            {
                isSuccess = true
            }
        }
    if isSuccess == true{
    }
    else {
        txtThongBao.text = "Bạn đăng nhập sai tài khoản và mật khẩu!"
    }
    }
    

    @IBAction func btnDangNhap(_ sender: Any) {
        checkLogin()
        
    }

    @IBAction func btnDangKy(_ sender: Any) {
    }
    
    
    
    
    
    
    
    
}
