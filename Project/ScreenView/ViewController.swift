//
//  ViewController.swift
//  Project
//
//  Created by Cuong DT on 11/23/19.
//  Copyright © 2019 Cuong DT. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let reuseIdentifier = "cell"
    var items = [0, 0, 0, 0, 0, 0, 0, 2, 2, 2, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2,2,2,2,2, 0, 0, 0, 0, 0, 0, 0, 0]
    
    var choose:[Int] = []
    var check:Bool = false
    var canChoose:Bool = true
    @IBOutlet weak var imgVideo: UIImageView!
    var img:UIImage?
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! CollectionViewCell
        for (index, info) in items.enumerated()
        {
            //ghế vip
            for row in 16...items.count
            {
                if indexPath.row == row{
                    if indexPath.row == index && info != 2{
                        cell.myImage.image = UIImage(named: "Chair1")
                        cell.backgroundColor = .purple
                    }
                }
            }
            // 0 là trạng thái chờ, 1 là đang chọn, 2 là đã được chọn
            if indexPath.row == index && info == 0
            {
                cell.myImage.image = UIImage(named: "Chair1")
            }
            else if indexPath.row == index && info == 1
            {
                cell.myImage.image = UIImage(named: "Chair2")
                cell.backgroundColor = UIColor.gray
            }
            else if indexPath.row == index && info == 2
            {
                cell.myImage.image = UIImage(named: "Chair1")
                cell.backgroundColor = .yellow
            }
        }
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 5
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! CollectionViewCell
        //kiểm tra trạng thái của ghế đã đk chọn hay chưa
        if !check {
            choose += [indexPath.row]
        }
        else {
            choose = choose.filter { indexPath.row != $0 }
        }
        cell.myImage.image = UIImage(named: check ? "Chair1" : "Chair2")
        check.toggle()
        txtSelection.text = choose.map {"\($0)"}.joined(separator: ", ")
        //nếu ghế đã được đặt thì ko cho phép đặt trùng
        for (index, info) in items.enumerated()
        {
            if indexPath.row == index && info == 2
            {
                cell.myImage.image = UIImage(named: "Chair1")
                print("Ghế này đã có người đặt")
            }
        }
        cell.reloadInputViews()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (collectionView.bounds.width)/9
        return CGSize(width: size, height: size)
    }

    @IBOutlet weak var txtSelection: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgVideo.image = img
        collectionView.backgroundColor = .gray
        navigationView()
    }
    
    func navigationView(){
        navigationItem.title = "Đặt ghế"
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(backView))
        navigationController?.navigationBar.barTintColor = .brown
    }
    
    @objc func backView(){
        self.dismiss(animated: true, completion: nil)
    }

}
