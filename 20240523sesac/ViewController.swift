//
//  ViewController.swift
//  20240523sesac
//
//  Created by 장예지 on 5/23/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var likeLabel: UILabel!
    @IBOutlet var dislikeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("❤️ Main: \(#function)")
        setUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("❤️ Main: \(#function)")
    }
    
    //작년에 나온 새로운 VC 라이프 사이클
    override func viewIsAppearing(_ animated: Bool) {
        super.viewIsAppearing(animated)
        print("❤️ Main: \(#function)")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("❤️ Main: \(#function)")
        setUI()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("❤️ Main: \(#function)")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("❤️ Main: \(#function)")
    }
    
    private func setUI(){
        setEmotionUI(label: likeLabel, key: "like", title: "좋아해")
        setEmotionUI(label: dislikeLabel, key: "dislike", title: "싫어해")
    }
    
    @IBAction func likeButtonTapped(_ sender: UIButton) {
        //1. UserDefaults에 저장되어있는 갯수 가져오기
        let currentCount = UserDefaults.standard.integer(forKey: "like")
        //2. 가져온 값에 1을 더해주기
        //3. UserDefaults에 더한 값 저장해주기
        UserDefaults.standard.set(currentCount + 1, forKey: "like")
        //4. UserDefaults에서 다시 데이터 가져오기
        setUI()
    }
    
    @IBAction func dislikeButtonTapped(_ sender: UIButton) {
        
    }
    
    private func setEmotionUI(label: UILabel, key: String, title: String){
        guard let likeCount = UserDefaults.standard.string(forKey: key) else {
            label.text = title
            return
        }
        label.text = "\(title) \(likeCount)"
    }
    
}

