//
//  DataUSAViewController.swift
//  DataUSA
//
//  Created by Александр Матукин on 30.11.2021.
//

import UIKit
import Alamofire

class DataViewController: UITableViewController {
    
    private var dataUSA: DataUSA?
    private var dataState: [DataState] = []
            
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
//        fetchDataUSA()
        
        // MARK: - Alamofire
        alamofireGetPassed()
        print(dataState)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        dataUSA?.data?.count ?? 0
        
        // MARK: - Alamofire
        dataState.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dataCell", for: indexPath)
        //        let data = dataUSA?.data?[indexPath.row]
        //            var content = cell.defaultContentConfiguration()
        //            content.text = data?.state ?? ""
        //            content.image = UIImage(systemName: "globe.americas.fill")
        //            cell.contentConfiguration = content
        
        // MARK: - Alamofire
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
            detailsVC.dataState = dataUSA?.data?[indexPath.row]
            
            // MARK: - Alamofire
            detailsVC.dataState = dataState[indexPath.row]
        }
    }
    
    private func fetchDataUSA() {
        NetworkManager.shared.fetchData(from: Link.dataUSALink.rawValue) { result in
            switch result {
            case .success(let dataUSA):
                self.dataUSA = dataUSA
                self.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    // MARK: - Alamofire
    func alamofireGetPassed() {
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


