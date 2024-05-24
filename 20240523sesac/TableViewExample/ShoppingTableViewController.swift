//
//  ShoppingTableViewController.swift
//  20240523sesac
//
//  Created by 장예지 on 5/23/24.
//

import UIKit

class ShoppingTableViewController: UITableViewController {
    
    @IBOutlet var headerBackgroundView: UIView!
    @IBOutlet var headerTextField: UITextField!
    @IBOutlet var addButton: UIButton!
    
    var list: [ShoppingList] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        setUI()
    }
    
    private func fetchData(){
        if let data = UserDefaults.standard.data(forKey: "shoppingList") {
            let array = try! PropertyListDecoder().decode([ShoppingList].self, from: data)
            list = array
        }
    }
    
    private func setUI(){
        navigationItem.title = "쇼핑"
        
        headerBackgroundView.backgroundColor = .systemGray6
        headerBackgroundView.layer.cornerRadius = 12
        
        headerTextField.borderStyle = .none
        headerTextField.placeholder = "무엇을 구매하실 건가요?"
        
        addButton.setTitle("추가", for: .normal)
        addButton.titleLabel?.font = .systemFont(ofSize: 12)
        addButton.backgroundColor = .systemGray5
        addButton.tintColor =  .label
        addButton.layer.cornerRadius = 8
        addButton.contentEdgeInsets = UIEdgeInsets(top: 8, left: 15, bottom: 8, right: 15)
        
    }
    
    @IBAction func addButtonTapped(_ sender: UIButton) {
        
        var currentList = list

        guard let text = headerTextField.text else { return }
        
        if !text.isEmpty {
            currentList.insert(ShoppingList(title: text), at: 0)
            
            if let data = try? PropertyListEncoder().encode(currentList){
                UserDefaults.standard.set(data, forKey: "shoppingList")
                
                fetchData()
                headerTextField.text = ""
                tableView.reloadData()
            }
        }
    }
    
    private func loadAndSetUI(index: Int, buttonType: ShoppingListButtonType){
        var currentList = list
        
        switch buttonType {
        case .check:
            currentList[index].isChecked.toggle()
        case .like:
            currentList[index].isLiked.toggle()
        }
        
        guard let data = try? PropertyListEncoder().encode(currentList) else {
            return
        }
        UserDefaults.standard.set(data,forKey: "shoppingList")
        fetchData()
        tableView.reloadRows(at: [IndexPath(row: index, section: 0)], with: .automatic)
    }
    
}

//tableView
extension ShoppingTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 48
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ShoppingTableViewCell.identifier, for: indexPath) as! ShoppingTableViewCell
        
        cell.checkButton.tag = indexPath.row
        cell.checkButton.addTarget(self, action: #selector(checkButtonTapped), for: .touchUpInside)
        
        cell.likeButton.tag = indexPath.row
        cell.likeButton.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
        
        cell.setShoppingList(content: list[indexPath.row])
        
        return cell
    }
}

//cell button actions
extension ShoppingTableViewController {
    @objc func checkButtonTapped(_ sender: UIButton){
        loadAndSetUI(index: sender.tag, buttonType: .check)
    }
    
    @objc func likeButtonTapped(_ sender: UIButton){
        loadAndSetUI(index: sender.tag, buttonType: .like)
    }
}

enum ShoppingListButtonType{
    case check
    case like
}

struct ShoppingList: Codable {
    var title: String
    var isChecked: Bool = false
    var isLiked: Bool = false
}
