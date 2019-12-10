//
//  MenuScreen.swift
//  Project
//
//  Created by Cuong DT on 12/10/19.
//  Copyright © 2019 Cuong DT. All rights reserved.
//

import UIKit

class MenuScreen: UIViewController,UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var txtName: UILabel!
    @IBOutlet weak var txtEmail: UILabel!
    @IBOutlet weak var tbList: UITableView!
    var list:[List] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tbList.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MenuCell
        cell.txtList.text = list[indexPath.row].nameMenu
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var name = list[indexPath.row].nameMenu
        
        switch name {
        case "Danh Sách Phim":
             let mainVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeScreen") as! HomeScreen
                   let navigation = UINavigationController(rootViewController: mainVC)
                   navigation.modalPresentationStyle = .fullScreen
                   self.present(navigation, animated: true, completion: nil)
            break
        case "Thông Tin Cá Nhân":
            print("Chưa có")
            break
        case "Đăng Nhập":
            let mainVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginView") as! LoginScreen
            let navigation = UINavigationController(rootViewController: mainVC)
            navigation.modalPresentationStyle = .fullScreen
            self.present(navigation, animated: true, completion: nil)
        default:
            print("Lỗi")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tbList.delegate = self
        tbList.dataSource = self
        addData()
    }
    
    func addData(){
        list.append(List(nameMenu: "Danh Sách Phim"))
        list.append(List(nameMenu: "Thông Tin Cá Nhân"))
        list.append(List(nameMenu: "Đăng Nhập"))
    }
}
