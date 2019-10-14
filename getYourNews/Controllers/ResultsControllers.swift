//
//  ResultsController.swift
//  getYourNews
//
//  Created by Cosme Fulanito on 14/10/2019.
//  Copyright © 2019 Cosme Fulanito. All rights reserved.
//

import UIKit

class ResultsController: UIViewController {
    var news: [New] = []
    var termToSearch: String = ""
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var termToSearchLabel: UILabel!
    
    @IBAction func backButtonWasPressed(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // MOCK DATA:
        let new1 = New()
        new1.author = "Shams Charania"
        new1.url = "https://www.nba.com"
        
        let new2 = New()
        new2.author = "John Hollinger"
        new2.url = "https://www.nba.com"
        
        let new3 = New()
        new3.author = "Michael Wallace"
        new3.url = "https://www.nba.com"
        
        news.append(new1)
        news.append(new2)
        news.append(new3)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        termToSearchLabel.text = "Term to search: " + termToSearch
    }
}

extension ResultsController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsViewCell") as? NewsViewCell
        let new = news[indexPath.row]
        cell!.configure(new: new)
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let detailsController = storyboard?.instantiateViewController(withIdentifier: "detailsController") as? DetailsController {
            let new = news[indexPath.row]
            detailsController.newToShow = new
            self.present(detailsController, animated: true, completion: nil)
        }
    }
}
