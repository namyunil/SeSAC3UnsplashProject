//
//  PhotoViewController.swift
//  SeSAC3UnsplashProject
//
//  Created by NAM on 2023/09/12.
//

import UIKit

class PhotoViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    //    var list = Photo(total: 0, total_pages: 0, results: [])
    var viewModel = PhotoViewModel()
    
    
    override func viewDidLoad() {
        print(#function)
        viewModel.fetchPhoto()
        
        viewModel.list.bind { _ in
            DispatchQueue.main.async {
                self.tableView.reloadData() //갱신에 남아있는, 화면전환에 남아있는 코드들..
                //view의 영역과 data의 영역을 분리하는..!
                //bind를 통해서 구성해두면 list가 바뀔때마다..
            }
            
        }
        
        tableView.dataSource = self
        tableView.delegate = self
        
        
        
        //        APIService.shared.searchPhoto(query: "sky") { photo in
        //            guard let photo = photo else { return }
        //
        //            self.list = photo
        //            self.tableView.reloadData()
    }
    override func viewWillAppear(_ animated: Bool) {
        
        print(#function)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print(#function)
        tableView.reloadData()
    }
}





extension PhotoViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //        return viewModel.list.value.results?.count ?? 0
        return viewModel.rowCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(#function)
        let cell = tableView.dequeueReusableCell(withIdentifier: "photoCell")!
        
        //        let data = viewModel.list.value.results?[indexPath.row]
        let data = viewModel.cellForRowAt(at: indexPath)
        
        //        if data != nil {
        //            cell.backgroundColor = .lightGray
        //        } else {
        //            cell.backgroundColor = .brown
        //        }
        
        
        let value = URL(string: data.urls.thumb)
        
        //이미지가 바로 나오지않는데.. 왜 그런가?
        DispatchQueue.global().async {
            if let url = value, let dataurl = try? Data(contentsOf: url ) {
                DispatchQueue.main.async {
                    cell.imageView!.image = UIImage(data: dataurl)
                }
            }
        }
        
        cell.backgroundColor = .lightGray
        
        
        
        return cell
    }
    
    
}
