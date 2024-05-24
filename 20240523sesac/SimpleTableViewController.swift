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
        //고정값으로 사용 -> tableView(_: heightForRowAt:)에 고정값을 주는 경우
        //tableView함수를 사용할 경우 매번 셀을 그릴때마다 호출하기 때문에 rowHeight 프로퍼티로 고정값을 줬을 경우
        //함수의 반복적인 호출을 줄일 수 있다.
        //tableView.rowHeight = 52
    }
    
    //옵션: 섹션 갯수
    override func numberOfSections(in tableView: UITableView) -> Int {
        //default -> 1
        return 2
    }
    
    //ex.카카오톡 친구목록 스크롤 시 나오는 자음 스크롤 창
//    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
//        <#code#>
//    }
    
    //섹션 타이틀
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "Apple" : "Mentor"
    }
    
    //1. 셀의 갯수(필수)
    //ex. 카카오톡 100명
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(#function)
        //어떤 섹션이든 섹션 갯수와 상관 없이 리스트의 갯수만큼 표시해라
        if section == 0 {
            return list.count
        } else {
            return 100
        }
        
    }
    
    //2. 셀의 높이(해주는게 좋다! - 약간 필수 권장..)
    //스토리보드 안의 셀에 작업을 해도 찌부되게 나올 수 있음 default - 44
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //섹션마다 높이를 다르게 설정 가능함 : indexPath.section
        print(#function)
        
        //어떤 섹션이냐에 따라
        //return indexPath.section == 0 ? 80 : 52
        
        //어떤 셀의 인덱스 이냐에 따라
        //return indexPath.row == 0 ? 80 : 52
        
        //고정값 주기
        return 52
    }
    
    //3. 셀의 디자인 및 데이터 처리(필수)
    //ex. 카카오톡 친구 이름, 프로필 사진, 상태 메세지 등
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //indexPath -> [section, row]
        print("\(#function): \(indexPath)")
        
        //3-1. 어떤 셀을 사용할지 결정
        // if custom cell
        //tableView.dequeueReusableCell(withIdentifier:, for:)
        
        //apple이 만든 system cell
        //재사용 메커니즘
        
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "yejiCell")!
            
            cell.tintColor = .black
            cell.textLabel?.textColor = .darkGray
            cell.textLabel?.font = .systemFont(ofSize: 16)
            cell.detailTextLabel?.text = "서브타이틀 스타일의 서브타이틀 입니다."
            cell.detailTextLabel?.textColor = .lightGray
            cell.detailTextLabel?.font = .systemFont(ofSize: 12)
            cell.imageView?.image = UIImage(systemName: "pencil.tip")
            cell.textLabel?.text = list[indexPath.row]
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "tanCell")!
            
            cell.tintColor = .black
            cell.textLabel?.textColor = .darkGray
            cell.detailTextLabel?.textColor = .lightGray
            cell.imageView?.image = UIImage(systemName: "sofa.fill")
            cell.textLabel?.text = "Apple"
            cell.detailTextLabel?.font = .systemFont(ofSize: 12)
            
            if indexPath.row < 4 {
                cell.backgroundColor = .blue.withAlphaComponent(0.2)
            } else {
                cell.backgroundColor = .white
            }
            
            return cell
        }
    }
    
}
