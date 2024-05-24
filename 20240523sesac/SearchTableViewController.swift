//
//  SearchTableViewController.swift
//  20240523sesac
//
//  Created by 장예지 on 5/24/24.
//

import UIKit

struct Travel {
    let country: String
    let money: Int
    var like: Bool
}

class SearchTableViewController: UITableViewController {
    
    var list = [
        Travel(country: "프랑스", money: 100300500, like: false),
        Travel(country: "일본", money: 100200300, like: true),
        Travel(country: "영국", money: 5757500, like: false),
        Travel(country: "네덜란드", money: 1000100, like: true),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 120
    }
    
    @objc func likeButtonTapped(_ sender: UIButton){
        //list[sender.tag].like = !list[sender.tag].like
        list[sender.tag].like.toggle()
        
        //테이블 전체를 그림
        //tableView.reloadData()
        
        tableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .automatic)
    }

}

extension SearchTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("======")
        //Swift type casting ( UITableViewCell -> SearchTableViewCell )
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell", for: indexPath) as! SearchTableViewCell
        
        let data = list[indexPath.row]
        
        cell.titleLabel.text = data.country
        cell.titleLabel.font = .systemFont(ofSize: 20, weight: .bold)
        
        cell.subtitleLabel.text = data.money.formatted()
        cell.subtitleLabel.textColor = .lightGray
        cell.subtitleLabel.font = .systemFont(ofSize: 12)
        
        cell.posterImageView.layer.cornerRadius = 8
        cell.posterImageView.backgroundColor = .lightGray
        
//        let image = list[indexPath.row].like ? UIImage(systemName: "heart.fill") : UIImage(systemName: "heart")
//        cell.likeButton.setImage(image, for: .normal)
        
        let name = data.like ? "heart.fill" : "heart"
        cell.likeButton.setImage(UIImage(systemName: name), for: .normal)
        cell.likeButton.tintColor = .systemPink
        
        cell.likeButton.tag = indexPath.row
        cell.likeButton.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
       
        return cell
    }
}
