//
//  SettingTableViewController.swift
//  20240523sesac
//
//  Created by 장예지 on 5/23/24.
//

import UIKit

class SettingTableViewController: UITableViewController {
    
    let list = [
        Setting(section: "전체 설정", elements: ["공지사항", "실험실", "버전 정보"]),
        Setting(section: "개인 설정", elements: ["개인/보안", "알림", "채팅", "멀티프로필"]),
        Setting(section: "기타", elements: ["고객센터/도움말"])
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return list[section].section
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list[section].elements.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell")!
        cell.textLabel?.text = list[indexPath.section].elements[indexPath.row]
        cell.textLabel?.font = .systemFont(ofSize: 13)
        return cell
    }
    
    
}

struct Setting {
    var section: String
    var elements: [String]
}
