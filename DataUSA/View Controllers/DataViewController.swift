//
//  DataUSAViewController.swift
//  DataUSA
//
//  Created by Александр Матукин on 30.11.2021.
//

import UIKit

class DataViewController: UITableViewController {
    
    private var dataUSA: DataUSA?
            
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        fetchData(from: Link.dataUSALink.rawValue)
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataUSA?.data?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dataCell", for: indexPath)
        let data = dataUSA?.data?[indexPath.row]
            var content = cell.defaultContentConfiguration()
            content.text = data?.State ?? ""
            content.image = UIImage(systemName: "globe.americas.fill")
            cell.contentConfiguration = content
        
        return cell
    }
    
    private func fetchData(from url: String?) {
        NetworkManager.shared.fetchData(from: url) { dataUSA in
            self.dataUSA = dataUSA
            self.tableView.reloadData()
            
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow {
            guard let detailsVC = segue.destination as? DetailViewController else {return}
            detailsVC.dataState = dataUSA?.data?[indexPath.row]
        }
    }
}

//if let indexPath = tableView.indexPathForSelectedRow {
//    guard let detailsVC = segue.destination as? DetailsViewController else {return}
//    detailsVC.dataState = networkManager.dataUSA?.data?[indexPath.row]
//}
//}
//}

