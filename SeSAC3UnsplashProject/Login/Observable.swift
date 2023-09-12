//
//  Observable.swift
//  SeSAC3UnsplashProject
//
//  Created by NAM on 2023/09/12.
//

import Foundation

class Observable<T> {
    
    //1.
    //var value = "고래밥"
    
    //2.
//    var value: String
//
//    init(value: String) {
//        self.value = value
//    }
    
    
//    //3.
//    var value: String {
//        didSet {
//            print("didset", value)
//        }
//    }
//
//    init(value: String) {
//        self.value = value
//    }
//
    
    //4.
    private var listner: ((T) -> Void)?
        
    var value: T {
        didSet {
            listner?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(_ closure: @escaping (T) -> Void ) {
        print(#function)
        closure(value)
        listner = closure
    }

}
