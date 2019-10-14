//
//  SearchController.swift
//  getYourNews
//
//  Created by Cosme Fulanito on 14/10/2019.
//  Copyright © 2019 Cosme Fulanito. All rights reserved.
//

import UIKit

class SearchController: UIViewController {
    @IBOutlet weak var termTextField: UITextField!
    
    @IBAction func searchButtonWasPressed(_ sender: Any) {
        if let resultsController = storyboard?.instantiateViewController(withIdentifier: "resultsController") as? ResultsController {
            
            resultsController.termToSearch = termTextField.text!
            self.present(resultsController, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        termTextField.text = "Argentina"
        termTextField.becomeFirstResponder()
    }
}
