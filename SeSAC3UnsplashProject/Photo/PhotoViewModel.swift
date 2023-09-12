//
//  PhotoViewModel.swift
//  SeSAC3UnsplashProject
//
//  Created by NAM on 2023/09/12.
//

import Foundation

class PhotoViewModel { // alert, 화면전환, UI요소 제외한 나머지들 처리
    
    //메서드와 연산 프로퍼티를 정하는 기준이 무엇인가 스스로 고민해보자..!
    var list = Observable(Photo(total: 0, total_pages: 0, results: []))
    
    func fetchPhoto() {
        APIService.shared.searchPhoto(query: "sky") { photo in
            guard let photo = photo else { return }
            
            self.list.value = photo
            
        }
    }
    
    var rowCount: Int {
        return list.value.results?.count ?? 0
    }
    
    func cellForRowAt(at indexPath: IndexPath) -> PhotoResult {
        return list.value.results![indexPath.row]

    }
}
