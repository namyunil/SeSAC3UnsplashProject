//
//  SampleViewController.swift
//  SeSAC3UnsplashProject
//
//  Created by NAM on 2023/09/12.
//

import UIKit


struct User { // Model data
    let name: String
    let age: Int
    
    var introduce: String { // 연산 프로퍼티 Computed Property..
        return "\(name), \(age)살"
    }
}

class SampleViewController: UIViewController { // Controller
    
    @IBOutlet var tableView: UITableView! // View
    
    //var list = [User(name: "Hue", age: 23), User(name: "Jack", age: 21), User(name: "Bran", age: 20), User(name: "Kokojong", age: 20)] // Model에 대한 데이터를 일괄적으로 갖고있음 -> viewModel에 분리
    
    let viewModel = SampleViewModel() // viewModel을 가질 수 있도록 인스턴스 생성
    
    override func viewDidLoad() {
        tableView.delegate = self
        tableView.dataSource = self
        
        //1.
        //데이터를 양방향으로 흐르게..!
        //코드의 흐름을 깨는 행위
//        let sample = Observable()
//        let sample = Observable(value: ")
//
//        sample.bind { text in
//            print(text)
//        }
//
//        sample.value = "3456"
//
//        sample.value = "9999"
//        sample.value
        
//        sample.value = "고래밥"
//
//        sample.value = "ggghhh"
        
        
        
        //2.
        var number1 = 10
        var number2 = 3
        
        print(number1 - number2) //7
        
        number1 = 3
        number2 = 1
        
        //3.
        var number3 = Observable(10)
        var number4 = Observable(3)
        
        number3.bind { number in
            print("Observable", number3.value - number4.value)
        }
        
        //Model Data가 바뀌면 bind 호출..
        //value가 바뀔때마다 didset구문 실행으로 listner 클로저가 실행되는데..!
        number3.value = 100
        number3.value = 500
        number3.value = 50
        
    }
    
}

extension SampleViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sampleCell")!
        let data = viewModel.cellForRowAt(at: indexPath)
        cell.textLabel?.text = "\(data.introduce)"
        //"\(data.name), \(data.age)살"
        //model의 연산 프로퍼티로 개선..!
        return cell
    }
    
    
}
