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
        fetchDataUSA()
//        fetchDataWithAlamofire(from: Link.dataUSALink.rawValue)
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataUSA?.data?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dataCell", for: indexPath)
        let data = dataUSA?.data?[indexPath.row]
            var content = cell.defaultContentConfiguration()
            content.text = data?.state ?? ""
            content.image = UIImage(systemName: "globe.americas.fill")
            cell.contentConfiguration = content
        
        return cell
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow {
            guard let detailsVC = segue.destination as? DetailViewController else {return}
            detailsVC.dataState = dataUSA?.data?[indexPath.row]
        }
    }
    
//    // MARK: - Alamofire
//    func getAlamofire() {
//        NetworkManager.shared.fetchDataWithAlamofire(from: Link.dataUSALink.rawValue) { result in
//            switch result {
//            case .success(let dataState):
//                self.dataState = dataState
//                self.tableView.reloadData()
//            case .failure(let error):
//                print(error)
//            }
//        }
//    }
    func fetchDataWithAlamofire(from url: String) {
        AF.request(url)
                .validate()
                .responseJSON { dataUSA in
                    switch dataUSA.result {
                    case .success(let data):
                        guard let dataState = data as? [[String: Any]] else { return }
                        for dateState in dataState {
                            let data = DataState(
                                state: dateState["State"] as? String,
                                year: dateState["Year"] as? String,
                                population: dateState["Population"] as? Int
                            )
                            self.dataState.append(data)
                        }
                        print(dataState)
                    case .failure(let error):
                        print(error)
                    }
                }
        }
}


