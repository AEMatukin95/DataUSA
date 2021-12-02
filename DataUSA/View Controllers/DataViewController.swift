//
//  DataUSAViewController.swift
//  DataUSA
//
//  Created by Александр Матукин on 30.11.2021.
//

import UIKit
import Alamofire

class DataViewController: UITableViewController {
    
    // MARK: Пример с Result(без Alamofire)
//    private var dataUSA: DataUSA?
    
    // MARK: Пример с Alamofire
    private var dataState: [DataState] = []
            
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        // MARK: Пример с Result(без Alamofire)
//        fetchDataUSA()
        
        // MARK:  Пример с Alamofire
        alamofireGetPassed()
    }
    
// MARK: - TableView
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // MARK: Пример с Result(без Alamofire)
//        dataUSA?.data?.count ?? 0
        
        // MARK:  Пример с Alamofire
        dataState.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dataCell", for: indexPath)
        // MARK: Пример с Result(без Alamofire)
        //        let data = dataUSA?.data?[indexPath.row]
        //            var content = cell.defaultContentConfiguration()
        //            content.text = data?.state ?? ""
        //            content.image = UIImage(systemName: "globe.americas.fill")
        //            cell.contentConfiguration = content
        
        // MARK:  Пример с Alamofire
        let data = dataState[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = data.state
        content.image = UIImage(systemName: "globe.americas.fill")
        cell.contentConfiguration = content
       
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow {
            guard let detailsVC = segue.destination as? DetailViewController else {return}
            // MARK: Пример с Result(без Alamofire)
//            detailsVC.dataState = dataUSA?.data?[indexPath.row]
            
            // MARK:  Пример с Alamofire
            detailsVC.dataState = dataState[indexPath.row]
        }
    }
    
    // MARK: - private Func
    
    // MARK: Пример с Result(без Alamofire)
//    private func fetchDataUSA() {
//        NetworkManager.shared.fetchData(from: Link.dataUSALink.rawValue) { result in
//            switch result {
//            case .success(let dataUSA):
//                self.dataUSA = dataUSA
//                self.tableView.reloadData()
//            case .failure(let error):
//                print(error)
//            }
//        }
//    }
    
    
    // MARK: Пример с Alamofire
   private func alamofireGetPassed() {
        NetworkManager.shared.fetchDataWithAlamofire(from: Link.dataUSALink.rawValue) { result in
            switch result {
            case .success(let state):
                self.dataState = state
                self.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
}
  


