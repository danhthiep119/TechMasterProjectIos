//
//  HomeScreen.swift
//  Project
//
//  Created by Cuong DT on 11/28/19.
//  Copyright © 2019 Cuong DT. All rights reserved.
//

import UIKit

class HomeScreen: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var tabView: UITabBar!
    @IBOutlet weak var tbListMovie: UITableView!
    var movie:[Movie] = []
    
    var passData:((Movie) ->Void)?
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movie.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movies = movie[indexPath.row]
        let cell = tbListMovie.dequeueReusableCell(withIdentifier: "tableview", for: indexPath) as! CustomTableViewCell
        cell.setMove(move: movies)
         
        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tbListMovie.delegate = self
        tbListMovie.dataSource = self
        
        addMovie()
    }
    
    func addMovie(){
        //var temp:[Movie] = []
        
        let movie1 = Movie(title: "THẤT HÌNH ĐẠI TỘI: SỰ PHẪN NỘ CỦA CÁC VỊ THẦN", durationmin: "Thời Lượng:24 phút", decription: "Thất đại ác nhân”, một nhóm chiến binh có tham vọng lật đổ vương quốc Britannia, được cho là đã bị tiêu diệt bởi các “hiệp sĩ thánh chiến” mặc dù vẫn còn 1 số người cho rằng họ vẫn còn sống. 10 năm sau, Các hiệp sĩ thánh chiến đã làm 1 cuộc đảo chính và khống chế đức vua, họ trở thành người cai trị độc tài mới của vương quốc. Elizabeth, con gái duy nhất của nhà vua, đã lên đường tìm “thất đại ác nhân” để nhờ họ tái chiếm lại vương quốc.", image: UIImage(named: "movie") ?? UIImage())
        
        let movie2 = Movie(title: "FAIRY TAIL", durationmin: "Thời Lượng:24 phút", decription:"Câu chuyện về một cô thiếu nữ tên Lucy Heartfilia, khao khát của cô là gia nhập Hội Pháp sư nổi tiếng Fairy Tail. Trên đường phiêu lưu, Lucy đã vô tình gặp gỡ Natsu Salamander Dragneel, một thành viên của Fairy Tail, người sở hữu pháp thuật cổ đại Sát Long. Thế rồi Lucy được Natsu giới thiệu vào Hội Pháp sư Fairy Tail và cùng anh chàng này tham gia vô số nhiệm vụ khó khăn nhưng cũng không kém phần thú vị.",image: UIImage(named: "movie2") ?? UIImage())
        
        movie.append(movie1)
        
        movie.append(movie2)
    
    
    
    
    }
    
    @IBAction func btnBooking(_ sender: Any) {
        //performSegue(withIdentifier: "ImageMovie", sender: self)
    }
    @IBAction func btnMore(_ sender: Any) {
        let dataView = CustomTableViewCell()
        guard let name = dataView.txtTitleMovie?.text else { return }
        guard let duration = dataView.txtDuration.text else { return }
        guard let decription = dataView.txtDecription.text else { return }
        guard let image = dataView.imgMovie.image else { return }
        
        passData?(Movie(title: name, durationmin: duration, decription: decription, image: image))
        
    }
    
    
}
