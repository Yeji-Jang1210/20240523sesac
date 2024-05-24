//
//  TodoTableViewController.swift
//  20240523sesac
//
//  Created by 장예지 on 5/24/24.
//

import UIKit

class TodoTableViewController: UITableViewController {
    
    @IBOutlet var todoTextField: UITextField!
    @IBOutlet var addButton: UIButton!
    
    var list = ["👛 장보기", "🎥 영화보기", "📚 과제하기", "✏️ 복습하기", "🛌 잠자기"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 52
        addButton.addTarget(self, action: #selector(addTodo), for: .touchUpInside)
    }
    
    @objc func addTodo(){
        guard let text = todoTextField.text, !text.isEmpty else { return }
        
        list.insert(text, at: 0)
        
        //예외처리도 고려해주기!
        todoTextField.text = ""
        todoTextField.endEditing(true)
        
        //테이블뷰와 관련된 함수들을 실행하는 함수
        //데이터와 뷰는 따로 놀기 때문에, 데이터가 달라지면 뷰를 다시 갱신해주어야 한다.
        tableView.reloadData()
        //tableView(tableView, numberOfRowsInSection: list.count)
        //tableView(tableView, cellForRowAt: ) ....
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //implicit return
        //한줄인 경우에는 return을 적지 않아도 된다.
        //100
        print(#function)
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(#function)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell")!
        
        cell.textLabel?.text = list[indexPath.row]
        
        //basic style일 경우에는 보이지 않음
        //다양한 스타일이 있기 때문에 옵셔널 형태인 것이다.
        //옵셔널 체이닝으로 없을 경우에는 실행하지 않음
        //cell.detailTextLabel?.text = "detailtext"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let delete = UIAlertAction(title: "삭제", style: .destructive){ _ in
            self.list.remove(at: indexPath.row)
            tableView.reloadData()
        }
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        alert.addAction(delete)
        alert.addAction(cancel)
        present(alert, animated: true)
    }
}
