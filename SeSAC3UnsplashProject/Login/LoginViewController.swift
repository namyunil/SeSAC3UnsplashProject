//
//  LoginViewController.swift
//  SeSAC3UnsplashProject
//
//  Created by NAM on 2023/09/12.
//

import UIKit

class LoginViewController: UIViewController { // 데이터에 따라 UI적인 처리만..! ViewModel에서 연산, 로직 처리
    
    @IBOutlet var idTextField: UITextField!
    @IBOutlet var pwTextField: UITextField!
    @IBOutlet var loginButton: UIButton!
    
    var viewModel = LoginViewModel()
    
    //MVC 기준으로 만든 후 -> 단계를 쪼개서 MVVM..!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.addTarget(self, action: #selector(loginButtonClicked), for: .touchUpInside)
        idTextField.addTarget(self, action: #selector(idTextFieldChanged), for: .editingChanged)
        pwTextField.addTarget(self, action: #selector(pwTextFieldChanged), for: .editingChanged)
        // .editingChanged 글자가 바뀔때마다..!
        
        viewModel.id.bind { text in
            print("ID Bind \(text)")
            self.idTextField.text = text
        }
        
        viewModel.pw.bind { text in
            print("PW Bind \(text)")
            self.pwTextField.text = text
        }
        
        viewModel.isValid.bind { bool in
            self.loginButton.isEnabled = bool
            self.loginButton.backgroundColor = bool ? .green : .lightGray
        }
        
        
    }
    
    @objc func idTextFieldChanged() {
        print("==")
        viewModel.id.value = idTextField.text!
        viewModel.checkValidation()
    }
    
    @objc func pwTextFieldChanged() {
        viewModel.pw.value = pwTextField.text!
        viewModel.checkValidation()
    }
    
    
    //유효성 검증 - id & pw 제대로 입력했는가? 조건문으로..!
    @objc func loginButtonClicked() {
        
        print("로그인 성공했기 때문에 alert 띄우기")
        //유효성 검증 checkValidation이 true일때만 버튼이 클릭 가능하기때문에 위와 같이 코드 작성이 가능하다.
        //로그인 성공 로직 method도 viewModel에 구현..!
        
        viewModel.signIn {
            //@escaping CompletionHandler Clouser를 활용하여 얼럿 띄우기 가능..
            //print("로그인 성공했기 때문에 얼럿 띄우기")
            
        }
        
        
//        guard let id = idTextField.text else { return }
//        guard let pw = pwTextField.text else { return }
//
//        if id.count > 6 && pw == "1234" {
//            print("로그인 했어요")
//        } else {
//            print("로그인 실패")
//        }
        
    }
    
}


