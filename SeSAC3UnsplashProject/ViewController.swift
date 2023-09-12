//
//  ViewController.swift
//  SeSAC3UnsplashProject
//
//  Created by NAM on 2023/09/11.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var nicknameTextField: UITextField!
    @IBOutlet var changeButton: UIButton!
    @IBOutlet var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nicknameTextField.placeholder = "nickname_placeholder".localized
        
        //        let value = NSLocalizedString("nickname_result", comment: "")
        //        resultLabel.text = String(format: value, "고래밥", "다마고치", "파산핑")
        
        resultLabel.text = "age_result".localized(number: 55)
        
        
        //cmd + ctrl + e
        //특정 스코프 내에 반복되는 사항들을 한 번에 변경할 수 있는..
        let searchBar = UISearchBar()
        searchBar.text = "asdf"
        searchBar.placeholder = "QWER"
        //    searchBar.delegate = self
        //    searchBar.showsCancelButton = false
        
    }
    //반복 작업을 줄일 수 있는 방법
    //ctrl + Shift + 클릭 = 멀티 커서
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(#function)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print(#function)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(#function)
    }

}

