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
        
        navigationItem.title = dataState?.state
        if let population = dataState?.population, let year = dataState?.year {
            stateLabel.text =
            """
            Population: \(String(population))
            
            Year: \(String(year))
            
            """
        }
    }
}
