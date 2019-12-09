//
//  HomeScreen.swift
//  Project
//
//  Created by Cuong DT on 11/28/19.
//  Copyright © 2019 Cuong DT. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
class HomeScreen: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var tabView: UITabBar!
    @IBOutlet weak var tbListMovie: UITableView!
    var movie:[DataMovie] = []
    var screenings:[Screenings] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movie.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movies = movie[indexPath.row]
        let cell = tbListMovie.dequeueReusableCell(withIdentifier: "tableview", for: indexPath) as! CustomTableViewCell
        if let url = NSURL(string: movies.image)
        {
            if let data = NSData(contentsOf: url as URL){
                cell.imgMovie.image = UIImage(data: data as Data)
            }
        }
        cell.txtTitleMovie.text = movies.title
        cell.txtDuration.text = String(movies.duration_min)
        cell.txtDecription.text = movies.description
         
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let mainVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "InfomationScreen") as! InfomationScreen
        let navigation = UINavigationController(rootViewController: mainVC)
        mainVC.dataMovie = movie[indexPath.row]
        navigation.modalPresentationStyle = .fullScreen
        self.present(navigation, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tbListMovie.delegate = self
        tbListMovie.dataSource = self
        addMovie()
        navigationView()
    }
    
    func navigationView(){
        navigationItem.title = "Danh Sách Phim"
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(loginView))
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.barTintColor = .brown
    }
    
    @objc func loginView(){
        let mainVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginView") as! LoginScreen
        let navigation = UINavigationController(rootViewController: mainVC)
        navigation.modalPresentationStyle = .fullScreen
        self.present(navigation, animated: true, completion: nil)
    }
    
    func addMovie(){
        let url = "http://vinid-spring-boot.loclx.io/movies"
        AF.request(url, method: .get,encoding: JSONEncoding.default, interceptor:nil ).responseObject { (response: AFDataResponse<Movie>) in
        let profileResponse = response.value
        print(response.result)
                    
        if let result = profileResponse?.dataMovie {
            self.movie = result
            self.tbListMovie.reloadData()
            }
        }
        AF.request(url, method: .get,encoding: JSONEncoding.default, interceptor:nil ).responseObject { (response: AFDataResponse<DataMovie>) in
        let profileResponse = response.value
        if let result = profileResponse?.screenings {
            self.screenings = result
            }
        }
        print(screenings)
        print(movie)
    }
    
    @IBAction func btnBooking(_ sender: Any) {
        let mainVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BookSheet") as! ViewController
//        mainVC.img?.images = tbListMovie.indexPathForSelectedRow(movie.)
        let navigation = UINavigationController(rootViewController: mainVC)
        navigation.modalPresentationStyle = .fullScreen
        self.present(navigation, animated: true, completion: nil)
    }
    
    @IBAction func btnMore(_ sender: Any) {
//        let mainVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "InfomationScreen") as! InfomationScreen
//        let navigation = UINavigationController(rootViewController: mainVC)
//        navigation.modalPresentationStyle = .fullScreen
//        self.present(navigation, animated: true, completion: nil)
    }
    
    
}
