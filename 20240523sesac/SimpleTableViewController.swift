//
//  SimpleTableViewController.swift
//  20240523sesac
//
//  Created by 장예지 on 5/23/24.
//

import UIKit

class SimpleTableViewController: UITableViewController {
    
    var list = ["📱 iOS", "🖥️ macOS", "🍎 iPadOS", "⌚️ watchOS", "🍏 기타"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    //1. 셀의 갯수(필수)
    //ex. 카카오톡 100명
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(#function)
        return list.count
    }
    
    //2. 셀의 높이(해주는게 좋다! - 약간 필수 권장..)
    //스토리보드 안의 셀에 작업을 해도 찌부되게 나올 수 있음 default - 44
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        print(#function)
        return 64
    }
    
    //3. 셀의 디자인 및 데이터 처리(필수)
    //ex. 카카오톡 친구 이름, 프로필 사진, 상태 메세지 등
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //indexPath -> [section, row]
        print("\(#function): \(indexPath)")
        
        //3-1. 어떤 셀을 사용할지 결정
        // if custom cell
        //tableView.dequeueReusableCell(withIdentifier: <#T##String#>, for: <#T##IndexPath#>)
        
        //apple이 만든 system cell
        //재사용 메커니즘
        let cell = tableView.dequeueReusableCell(withIdentifier: "yejiCell")!
        
        cell.imageView?.image = UIImage(systemName: "pencil.tip")
        cell.tintColor = .black
        cell.textLabel?.text = list[indexPath.row]
        cell.textLabel?.textColor = .darkGray
        cell.textLabel?.font = .systemFont(ofSize: 16)
        
        cell.detailTextLabel?.text = "서브타이틀 스타일의 서브타이틀 입니다."
        cell.detailTextLabel?.textColor = .lightGray
        cell.detailTextLabel?.font = .systemFont(ofSize: 12)
        return cell
    }
    
}
