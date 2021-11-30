//
//  DataUSAViewController.swift
//  DataUSA
//
//  Created by Александр Матукин on 30.11.2021.
//

import UIKit

class DataViewController: UITableViewController {
    
    var networkManager = NetworkManager.shared
            
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        networkManager.fetchData {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        networkManager.dataUSA?.data?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dataCell", for: indexPath)
        if let data = networkManager.dataUSA?.data?[indexPath.row] {
            var content = cell.defaultContentConfiguration()
            content.text = data.State
            content.image = UIImage(systemName: "globe.americas.fill")
            cell.contentConfiguration = content
        }
        return cell
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
//    }
}
