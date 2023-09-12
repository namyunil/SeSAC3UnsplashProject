//
//  SampleViewModel.swift
//  SeSAC3UnsplashProject
//
//  Created by NAM on 2023/09/12.
//

import Foundation

class SampleViewModel {
    // Viewcontroller가 데이터를 전부 받는 상황
    // 표현하고싶은 데이터만 전달받고싶어 ViewModel을 통해 분리..!
    
    var list = [User(name: "Hue", age: 23), User(name: "Jack", age: 21), User(name: "Bran", age: 20), User(name: "Kokojong", age: 20)]
    
    var numberOfRowsInSection: Int { // 연산 프로퍼티
        return list.count
    }
    
    func cellForRowAt(at indexPath: IndexPath) -> User {
        return list[indexPath.row]
    }
}
