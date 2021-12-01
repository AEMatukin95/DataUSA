//
//  DetailViewController.swift
//  DataUSA
//
//  Created by Александр Матукин on 30.11.2021.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var stateLabel: UILabel!
    var dataState: DataState?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = dataState?.State
        if let population = dataState?.Population, let year = dataState?.Year {
            stateLabel.text =
            """
            Population: \(String(population))
            
            Year: \(String(year))
            
            """
        }
    }


}
