//
//  ViewController.swift
//  DataUSA
//
//  Created by Александр Матукин on 29.11.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var labelDataUsa: UILabel!
    
   private var dataUsa: DataUsa!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        labelDataUsa.text = dataUsa.data.description
    }


}

