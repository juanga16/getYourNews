//
//  DetailsController.swift
//  getYourNews
//
//  Created by Cosme Fulanito on 14/10/2019.
//  Copyright © 2019 Cosme Fulanito. All rights reserved.
//

import UIKit

class DetailsController: UIViewController {
    var newToShow: New?
    
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func backButtonWasPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if let new = newToShow {
            authorLabel.text = new.author
            
            print("New")
            print(new.urlToImage)
            
            if new.urlToImage != "" {
                downloadImage(urlToImage: new.urlToImage)
            } else {
                imageView.isHidden = true
            }
        }
    }
}

extension DetailsController {
    
    func downloadImage(urlToImage: String) {
        print("downloadImage")
        print(urlToImage)
        
        URLSession.shared.dataTask(with: URL(string: urlToImage)!) {
            data, response, error in
            
            print(urlToImage)
            print(data)
            
            DispatchQueue.main.async() {
                self.imageView.image = UIImage(data: data!)
            }
        }.resume()
    }
}
