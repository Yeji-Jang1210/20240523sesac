//
//  dislikeViewController.swift
//  20240523sesac
//
//  Created by 장예지 on 5/23/24.
//

import UIKit

class dislikeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("👎🏻 Hate :\(#function)")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("👎🏻 Hate :\(#function)")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("👎🏻 Hate :\(#function)")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("👎🏻 Hate :\(#function)")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("👎🏻 Hate :\(#function)")
    }

    @IBAction func dislikeButtonTapped(_ sender: UIButton) {
        let currentCount = UserDefaults.standard.integer(forKey: "dislike")
        UserDefaults.standard.setValue(currentCount + 1, forKey: "dislike")
        
        print(UserDefaults.standard.integer(forKey: "dislike"))
    }
    
}
