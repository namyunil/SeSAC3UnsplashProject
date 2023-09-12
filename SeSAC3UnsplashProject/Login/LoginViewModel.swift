//
//  LoginViewModel.swift
//  SeSAC3UnsplashProject
//
//  Created by NAM on 2023/09/12.
//

import Foundation

class LoginViewModel { // viewModel에서 모든 데이터를 처리하고있다..!
    
    var id = Observable("")
    var pw = Observable("")
    var isValid = Observable(false)
    
    func checkValidation() {
        if id.value.count >= 6 && pw.value.count >= 4 {
            isValid.value = true
        } else {
            isValid.value = false
        }
    }
    
    func signIn(completion: @escaping () -> Void) {
        //서버, 닉네임, id -> Userdefaults
        UserDefaults.standard.set(id.value, forKey: "id")
        
        completion()
    }
}
